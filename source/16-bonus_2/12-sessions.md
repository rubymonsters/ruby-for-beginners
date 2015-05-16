# Bonus: Sessions

HTTP is a so called <a href="http://en.wikipedia.org/wiki/Stateless_protocol">stateless protocol</a>.
Wikipedia says:

*"In computing, a stateless protocol is a communications protocol that treats
each request as an independent transaction that is unrelated to any previous
request so that the communication consists of independent pairs of request and
response."*

Imagine talking to a person with a very shortlived memory:

"Hey, who are you?" - *"I'm a web application."*
"Hey, who are you?" - *"I'm a web application."*
"Hey, who are you?" - *"I'm a web application."*
"How often have I just asked you who you are?" - *"I don't know, I don't keep track."*

That's what's meant by HTTP being stateless: The web application just responds
to the request at hand, but has no way to identify how these requests relate to
each other.

Imagine thousands of users clicking around and using your web application. The
application would just respond to each of these requests individually, but does
not know from the protocol where these requests are coming from, or how many
people (browsers) it is talking to: There is no concept of a conversation, or
"session" in HTTP.

Basically.

However, of course there are ways to identify your users. We all know that we
can sign in to a web application, and it would recognize who we are. Right?
Often web applications use cookies for this.

A cookie is a little piece of information that a web application can send along
with a response, and that will be stored by the browser. From then on, when the
browser makes another request to the same application it will include the cookie
to the request, sending it back to the application.

For example, an HTTP response that sets a cookie for a user's prefered visual
theme could look like this:

```
HTTP/1.0 200 OK
Content-type: text/html
Set-Cookie: theme=light
```

From now on, the browser would then include the cookie to subsequent requests:

```
GET /blog.html HTTP/1.1
Host: rubymonstas.org
Cookie: theme=light
```

This way the application could apply the "light" theme to the blog, because the
user has selected it in some previous request: Cookies are a way to persist
(keep) state (data) across multiple requests.

Building on top of this, even though HTTP itself does not have a concept of a
"session" (or conversation), Sinatra (just as basically any web application
tool or framework) supports sessions. A session is a way for a web application
to set a cookie that persists arbitrary data across multiple requests.

Let's have a look how this works.

Say we'd like to pass a message from our `post` route to the next request, saying
"Successfully stored the name [name]". After successfully storing the name to
the file, we'd like to pass a message to the `GET` request that the browser is
going to be redirected to.

We'd only want to display this message once right after the redirection from
the `post` route: when we'd reload the page it should be gone. This is called
transient state, and a session is a great place to keep it.

First, we need to enable the `:sessions` feature in Sinatra. You can do that
by adding this line above of your routes:

```ruby
enable :sessions
```

Now, we want to store the message in our `post` route:

```ruby
post "/hello" do
  name = params[:name]
  store_name("names.txt", name)
  session[:message] = "Successfully stored the name #{name}."
  redirect "/hello"
end
```

Ok, cool.

This will add a `Set-Cookie` header to the reponse which has a long, messy looking, encrypted
string as a value.

In my browser it looks like this:

```
Set-Cookie: rack.session=BAh7CUkiD3Nlc3Npb25faWQGOgZFVEkiRWI4OTdhMDJlNDBkMDFlNjcxNWUw%0AZGI1ZWU5MzQ0YTQyMjAzYjFiZTE2YzYxNzgwMWQxYjI3NzhiOWNhYTQ4YzUG%0AOwBGSSIJY3NyZgY7AEZJIiU2ZjdjN2Y0ZmM0MTdmMGJkNjBkNmY5MmQ1NDEx%0ANGQ4ZgY7AEZJIg10cmFja2luZwY7AEZ7B0kiFEhUVFBfVVNFUl9BR0VOVAY7%0AAFRJIi03NGNlNDIxYTczNjMwZDY3MWViNTlkYzIzN2YyN2M5NGU3ZWU4NTRm%0ABjsARkkiGUhUVFBfQUNDRVBUX0xBTkdVQUdFBjsAVEkiLTA3NjBhNDRjMzU0%0AODIxMzJjZjIyNDQyYTBkODhjMDhiYjg1NTYyNTAGOwBGSSIIZm9vBjsARkki%0ACGJhcgY7AFQ%3D%0A; path=/; HttpOnly
```

Wow. Ok, the name of the cookie gives us a hint that this is a session, and it
is managed by Rack, which is what Sinatra uses under the hood to persist the
session.

Luckily we do not need to understand how exactly it does this. All we need to
know is that we can now use this data in the next request (the `GET` request)
like so:

```ruby
get "/hello" do
  @message = session.delete(:message)
  @names = read_names
  @name = params["name"]
  erb :hello
end
```

I.e. we delete the key `:message` from our session (which is something very
similar to a Ruby hash).  Deleting it will return the value that was stored on
this key, and we assign it to the instance variable `@message`, which makes it
available to our template.

That means we can now use the message in our view like so:

```erb
<% if @message %>
  <p><%= @message %></p>
<% end %>
```

Let's try it out. Restart your application, and go to <a href="http://localhost:4567">http://localhost:4567</a>.
If you enter a name, and click submit you should then see something like this:

<img src="/assets/images/12-sessions_1.png">

When you reload the page the message should be gone.

How does this work?

In our `post` route we store the message to the session hash. This has is
something that Sinatra provides to us as developers. When we enable this
feature then Sinatra will, after every request, store this hash to a cookie
with the name `rack.session`, in the encrypted form that you saw above.

We say the hash is being <a href="http://en.wikipedia.org/wiki/Serialization">serialized</a>,
which is a fancy way of saying that it is turned into some kind of format that
can be stored in text form. Sinatra (actually, Rack, under the hood) then also
encrypts and signs this data, so it is safe to send it over the internet (in
case we keep any sensitive data in it).

Ok, so the `post` route includes the `Set-Cookie` header with this session
cookie into its response, and sends it to the browser. The browser will, from
now on, pass this cookie back the our application as part of every subsequent
request.

When our browser is now redirected to `GET` the same URL again, it passes the
cookie, and Sinatra will, because we have the `:sessions` feature enabled,
*deserialize* (i.e. decrypt and read) the session data, and put it into the
hash that is returned by the method `session`, so we can work with it.

In our `get` route we now simply always delete the key `:message` from the
session hash. Should anything be in there it will be assigned to the `@message`
instance variable, and the view will display it. If nothing's stored on the
session key, for example when we reload the page, then deleting the key will
simply return nil, and nothing will be displayed in the view.

Does that make sense?

Awesome :)

