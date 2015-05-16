# Bonus: Forms

So far, all that our little application can do is return some HTML when asked.
I.e. it can respond to `GET` requests by returning HTML.

What if we want to talk back to our application, and send some data from the
browser to it? You have seen this a million times, there are those little forms
on websites that let you enter data and somehow submit it.

So, how does that work?

HTML defines a couple tags for describing forms that are part of a document
(web page).

Here's how a simple form looks like in HTML:

```html
<form>
  <input type="text">
  <input type="submit">
</form>
```

If you copy this HTML code to a file, and open the file in your browser it will
look similar to this:

<img src="/assets/images/10-forms_1.png">

Neat.

You can see that the two `<input>` tags are rendered (displayed) in different
ways because they have two different types: `text` and `submit`. In modern HTML
there are lots of other input element types. You can find a
<a href="https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input">full list here</a>.

Let's make our little Sinatra application serve this form.

Replace the content of your `hello.erb` template in your `view` directory with
the HTML above. Then replace your `get '/hello/:name'` route with the following:

```ruby
get "/hello" do
  erb :hello
end
```

Restart the server and go to <a href="http://localhost:4567">http://localhost:4567</a>.
You should see something like our screenshot above.

Now, this form isn't very useful, yet. If you submit it (enter something, and
click "Submit") nothing much will happen. It clears the input element, and
appends a question mark to the URL for some reason, but that's it.

What's happening here?

When you click a button that is a "submit" input element then your browser will
submit the form that this button is part of. But where? If we do not specify
anything else the browser will submit it to the same URL that we are currently
looking at.

Also, what does "submit" mean, in this case? We said browsers speak HTTP when
they talk to a web server (our Sinatra application), so "submit" means making
another HTTP request. Again, if we do not specify anything else, the default
method will be `GET`.

So this basically just reloads the page, and displays the same form again,
served from our `get "/hello"` route. This is why the text in the input field
goes away.

Ok, where does the question mark come from though?

When the browser submits the form it collects all the data from the form input
elements, and sends it along with the HTTP request. In case of a `GET` request
it will append it to the URL, after a question mark, as name/value pairs.

However, our form input text element does not a name, and so the browser cannot
pass it in a meaningful way.

So let's change that, and specify a name for our text input. Since we want
the user to input their name, the name of our input should be `name`:

```html
  <input type="text" name="name">
```

If you restart the application, reload the page, and again enter some text and
click submit ... you should see that the URL changes to something like
`http://localhost:4567/hello?name=Monstas`. Aha!

So that's how the browser passes our input to the application. It just appends
it to the URL as name/value pairs (in case of a `GET` request): these pairs
after the question mark are called "query parameters" in HTTP.

Let's check that, and output the `params` in our route:

```ruby
get "/hello" do
  p params
  erb :hello
end
```

Again, restart the application, and load the URL
<a href="http://localhost:4567/hello?name=Monstas">http://localhost:4567/hello?name=Monstas</a>.
In your terminal you should then see something like:

```
{"name"=>"Monstas"}
```

So this is how we can access the data that has been passed from the browser as
part of the HTTP request, when it submitted the form.

Let's do something with it. Change your route like so:

```ruby
get "/hello" do
  @name = params["name"]
  erb :hello
end
```

And add this code at the top of your `hello.erb` view:

```html
<% if @name %>
  <h1>Hello <%= @name %>!</h1>
<% end %>
```

When you restart the server, and reload the page you should see something like
this:

<img src="/assets/images/10-forms_2.png">

Awesome!

So this is how you can pass (submit) data from the brower to your application,
and use it in some way.

Let's make one more improvement to our form. It currently always whipes out the
text that has been submitted. Let's make sure we preseve it in the input element.

We can do that by specifying the `value` attribute on the `input` tag, like so:

```html
<form>
  <input type="text" name="name" value="<%= @name %>">
  <input type="submit">
</form>
```

When you restart your application, and reload the page, it should now put the
name to the input element:

<img src="/assets/images/10-forms_3.png">

