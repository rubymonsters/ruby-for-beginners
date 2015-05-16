# Bonus: Storing data

So far our little application doesn't do anything with the data that we submit,
except for displaying it on the same page, right away. Once you go to another
URL that previous data is gone.

Instead, let's store it to a file. Normally, web applications would use some
kind of database for storing data, but for our purpose using a file will be
good enough.

What we want to achive is that every name ever submitted to our application
is appended to a file, let's say `names.txt`. So we'll keep a long running
list of all these names.

## Writing to a file

How to append a string to a file in Ruby? If you google for "Ruby file append"
you'll find a bunch of answers that all basically look like this:

```ruby
File.open(filename, "a+") do |file|
  file.puts(string)
end
```

This uses two local variables `filename` and `string`, which in our case would
be `names.txt` and the name passed as the param. The slightly weird looking
second argument `"a+"` tells the `open` method that we want to use the file for
appending something (thus `a`), and that we'd like it to create a new file
unless it already exists (thus `+`).

Also, `File.open` takes a block, and passes an object, an instance of the class
<a href="http://ruby-doc.org/core-2.2.0/File.html">File</a> to it. It does this
because the file needs to be closed once we're done with it. The `open` method
makes sure we don't forget this, and closes the file once it has run our block.
Pretty handy.

Inside of the block we simply call `puts` on the file object, which will append
the string that we pass, and also add a newline (just like `puts` does when you
output a string to the terminal).

## Storing the name

Ok, now that we know how to append something to a file, let's use that in our
application.

We could change our route like so:

```ruby
get "/hello" do
  @name = params["name"]

  File.open("names.txt", "a+") do |file|
    file.puts(@name)
  end

  erb :hello
end
```

However, that stuffs a lot of clutter into our route, while we'd like to keep
these readable. So let's extract storing the name to method right away:

```ruby
def store_name(filename, string)
  File.open(filename, "a+") do |file|
    file.puts(string)
  end
end

get "/hello" do
  @name = params["name"]
  store_name("names.txt", @name)
  erb :hello
end
```

Better. Our route now describes what it does, instead of telling how exactly
it is done.

If you restart your Sinatra application, and reload the page, you should see
a file `names.txt` created in the same directory, and it should contain the
name from the form.

You can check this using command line tools like this:

```
$ ls names.txt
names.txt

$ cat names.txt
Monstas
```

Of course you can also just look at the file in your editor :)

## Listing the names

Let's make it so that we can look at the list of the names in the browser
though. This is a web application, right.

For this we'll need to read the names from the file. Again, if you ask Google
for "Ruby read file" you'll find it's as simple as this:

```ruby
File.read(filename)
```

This returns a single, long string, which represents the content of the entire
file. Because we store every name on a new line we can split this string with
the newline character `"\n"` in order to get our names as an array:

```ruby
def read_names
  File.read("names.txt").split("\n")
end
```

However, this would break if there's no file with this name, yet. So let's
a little safeguard, and return an empty array if the file does not exist:

```ruby
def read_names
  return [] unless File.exist?("names.txt")
  File.read("names.txt").split("\n")
end
```

Does this make sense? If the file does not exist we return an empty array `[]`.
If it exists we read it, and split the content into lines.

Also, let's store the names on an instance variable in our route, so we can
then use it in the template later:

```ruby
get "/hello" do
  @names = read_names
  @name = params["name"]
  store_name("names.txt", @name)
  erb :hello
end
```


Now we can output the names as an unordered list (`<ul>`) in our `hello.erb`
template like so:

```erb
<ul>
  <% @names.each do |name| %>
    <li><%= name %></li>
  <% end %>
<ul>
```

<img src="/assets/images/11-storing_data_1.png">

## Using POST

Ok, that's pretty cool. However, there's one big problem with our application
that we definitely want to fix.

The HTTP specification says that `GET` requests should be safe, and idempotent.
What does that mean? <a href="http://en.wikipedia.org/wiki/Idempotence">Wikipedia says</a>:

*"Idempotence is the property of certain operations in mathematics and computer
science, that can be applied multiple times without changing the result beyond
the initial application."*

Obviously, whenever we reload the URL our application adds the name again, and
again, and again. Since we do this in response to a `GET` request we do not
comply with the HTTP specification.

When we store, modify, or delete data in our application we also say that we
"change the state" of the application: It goes from "3 names stored" to "4
names stored".

`GET` requests should not modify the state of our application though. They
should only "get" what's already there. So what do we do?

The appropriate HTTP verb (request method) to use for this kind of request
is `POST`. The result of a `POST` request does not need to be idempotent,
and it's basically up to the application to decide what to do with it.

In order to tell the browser to send a `POST` request instead of a `GET`
request we add this as an attribute to the `<form>` tag like so:

```html
<form method="post">
  <input type="text" name="name" value="<%= @name %>">
  <input type="submit">
</form>
```

When you reload the page, and try to submit the form again, you'll get
Sinatra's 404 (Not Found) page though: "Sinatra doesn’t know this ditty."

Of course, we do not have a route for `POST` requests, yet. So let's add
one, and more the logic for storing the name to it:

```ruby
get "/hello" do
  @names = read_names
  @name = params["name"]
  erb :hello
end

post "/hello" do
  store_name("names.txt", params[:name])
end
```

Cool, our `get` route is now idempotent (it does not change any state), and we
also have a `post` route for the same path, and we store the name if there is
one. However, what should we now send back to the browser in response?

For starters, we could just send a little confirmation:

```ruby
post "/hello" do
  store_name("names.txt", params[:name])
  "Ok!"
end
```

<img src="/assets/images/11-storing_data_2.png">

Hmmmm. Ok, this isn't too bad, we could make this a proper HTML template.

However, in today's web applications it is more common to redirect the browser
to the page that displays the changed state: The web application would respond
to the `POST` request by saying *"Alright, I've done this. Go here to check it
out."*

The way of expressing this in terms of HTTP is by the way of returning the
status code `303` ("See Other"), and adding a `location` header to the response
that tells the browser where to go (what to `GET`) next.

Sinatra lets us do this like so:

```ruby
post "/hello" do
  name = params[:name]
  store_name("names.txt", name)
  redirect "/hello"
end
```

The `redirect` method will make sure our application responds with the status
code `303` and add a `location` header to the response with the value
`http://localhost:4567/hello` (since we have passed the path `/hello`, but the
`location` header needs a full URL).

If you restart the server, go to <a href="http://localhost:4567/hello">http://localhost:4567/hello</a>,
and submit the form you'll see that your browser will be redirected, and make
a new `GET` request to the same URL.

So this is pretty cool. We now have two routes. One for displaying (`GET`ing)
the current state of our application, and one for storing (`POST`ing) new data.

However, we've now lost the actual greating. That's because we redirect to
`/hello`, so the `get` route does not know, and cannot display the name.

Let's fix that:

```ruby
post "/hello" do
  name = params[:name]
  store_name("names.txt", name)
  redirect "/hello?name=#{name}"
end
```

Our application now passes the name through to the next `GET` request, and
thus can include the greating:

<img src="/assets/images/11-storing_data_3.png">

Awesome!
