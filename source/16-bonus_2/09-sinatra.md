# Bonus: Sinatra

<a href="http://www.sinatrarb.com/">Sinatra</a> is a quite popular, small
framework for writing web applications. It sits somewhere between Rack and
Rails in terms of how many features it provides, and what kind of things it
makes easy for developers, and what kind of things one has to implement on
their own.

## Sinatra versus Rails

Maybe you could compare Sinatra to a bicycle, and Rails to a car. Both do
the job of helping you to get from A to B.

Sinatra is much more lightweight, needs less resources, and does fewer things
out of the box. Rails on the other hand is packed with features, comes with a
ton of code, and makes it very easy to build complicated web applications in
limited time, if you know how to use it. Of course, because it's lightweight,
Sinatra also is much faster than Rails, and this is where our little metaphor
ended fairly quickly :) Rack, by the way, would be a pair of shoes. Sinatra and
Rails both use Rack under the hood.

So which one is better for a beginner?

Both are great :) Sinatra is great for learning the basics of HTTP and routing.
Rails on the other hand is better for learning how to use a database, and
actually store things, learn the concept of a "resource" etc.

## Domain specific languages

Sinatra, on its homepage, does not call itself a framework. Instead it calls
itself a DSL, so let's talk about that, too.

DSL is short for "Domain specific language", and you might find that term used
in the Ruby world once in a while. "Domain" in this case refers to the "problem
at hand", or rather the context of the problem. What does that mean?

Consider a book shop application, such as Amazon, back when it still sold
nothing but books.  The domain of this application would be the entirety of
concepts that their users have in mind, and that they care about when they use
it. In this example this would include things like: books, categories, a
shopping cart, payment methods, delivery addresses, and so on.

A domain specific language is a language that includes terms to speak about
these concepts. In the context of a library that means, there are classes
and methods that allow to "speak about them", or implement them, in the form
of code.

Ruby makes it very easy to implement a DSL. In the case of Sinatra this means
that it supports methods like `get`, `post`, `put`, and `delete`. It also
has methods like `headers`, `session`, `cookies`, and other things that
relate to concepts from HTTP.

## Your first Sinatra application

Let's get started looking at Sinatra.

Make sure you have the Sinatra gem installed. Use `gem list sinatra` to
check if it's there. If it's not install it using `gem install sinatra`.

Now, let's steal the intro example from their homepage, and adopt it. Make a
new directory `sinatra`, `cd` into it, create a file `monstas.rb` and add this
code:

```ruby
require "sinatra"

get "/" do
  "OMG, hello Ruby Monstas!"
end
```

Now you can run your little app using `ruby monstas.rb`. You should see
something like this:

```
$ ruby monstas.rb
[2015-05-15 21:37:41] INFO  WEBrick 1.3.1
[2015-05-15 21:37:41] INFO  ruby 2.2.1 (2015-02-26) [x86_64-darwin14]
== Sinatra (v1.4.6) has taken the stage on 4567 for development with backup from WEBrick
[2015-05-15 21:37:41] INFO  WEBrick::HTTPServer#start: pid=27182 port=4567
```

Again, there are lots of version numbers, that we can ignore, and it
also tells us the port that it's running on.

So let's point the browser to <a href="http://localhost:4567">http://localhost:4567</a>.

You should see something like this:

<img src="/assets/images/09-sinatra_1.png">

That was easy, wasn't it.

Sinatra uses Rack under the hood, but it deals with the nitty gritty details of
looking at the `REQUEST_METHOD` and `REQUEST_PATH` for you. Instead it allows you
to use the methods `get`, `post`, `put`, and `delete` with a path argument, and
simply specify a block that will be called whenever a request matches the request
method (verb) and path.

It also allows you to simply return a string from this block, which will then
be used as the response body, and sets things like the status code and headers
for you (when it returns the Rack style response array to Rack). Since the vast
majority of requests will want to return 200 as a status code Sinatra just
assumes you want that, too, unless you specify something else.

## Params

Sinatra allows specifying patterns for paths. It will match the pattern
against the path, and see if it applies. Let's try that out.

Add the following route (request handler) to your program, at the end of the
file:

```ruby
get "/hello/:name" do
  "Hello #{params["name"]}!"
end
```

... and restart your Sinatra application, then point your browser to
<a href="http://localhost:4567/hello/monstas">http://localhost:4567/hello/monstas</a>.

How does this work?

`params` is a hash that Sinatra makes available for you in your route blocks, and
it will automatically include relevant data from the request.

In our case our route specifies a path that is a pattern: the last part of the
path starts with a colon `:`. This tells Sinatra that we'd like to accept any
string here, and that we'd like to call this string `name`. Sinatra therefore
adds the key `"name"` to the `params` hash, and sets the given string from the
path (i.e. from the URL) to it.

When you point your browser to the URL
<a href="http://localhost:4567/hello/Elizabeth">http://localhost:4567/hello/Elizabeth</a>
your application will say *"Hello Elizabeth!"*, when you go to
<a href="http://localhost:4567/hello/Juliane">http://localhost:4567/hello/Juliane</a>
your application will say *"Hello Juliane!"*, and so on.

Let's inspect the params hash, and return this string as the response body:

```ruby
get "/hello/:name" do
  params.inspect
end
```

If you restart your application, and reload the page in your browser, then it
should display something like this:

```
{"splat"=>[], "captures"=>["monstas"], "name"=>"monstas"}
```

So this confirms that `params` is a hash, and the key `"name"` has the value
`"monstas"` set.  `splat` and `captures` are for building more complicated
routes, and we can ignore these for now.

This is pretty cool.

## Rendering templates

So far, our application does not actually return HTML, it returns just plain
text. Let's fix that. For this we'll want to re-use what we've learned about
rendering ERB templates.

In order to use ERB we need to require it, we need to define a ERB template,
and make any variables used in the template known as local variables in our
route:

```ruby
require "erb"

get '/hello/:name' do
  name = params[:name]
  ERB.new("<h1>Hello <%= name %></h1>").result(binding)
end
```

This code is familiar to you, isn't it? We get the name out of the params hash
and stick it into a local variable `name` because that's the variable name we're
using in our template, too.

If you restart the server, and reload the page in your browser, it should now
look like this:

<img src="/assets/images/09-sinatra_2.png">

Awesome.

However, Sinatra also has built-in support for ERB templates ("views"), and
allows us to achieve exactly the same thing like this:

```ruby
get '/hello/:name' do
  erb "<h1>Hello <%= name %></h1>", { :locals => { :name => params[:name] } }
end
```

I.e. Sinatra has a method `erb`, that hides all the details of rendering the
template from us, and also accepts a template. On top of this, it also accepts
a hash that allows us to specify options. If we specify a key `:locals` and
give it another hash, then Sinatra will make each key/value pair on this hash
available as *local* variables (thus "locals") in our ERB template.

## Layouts

Our HTML still isn't quite valid: '<html>' and '<body>' tags are mandatory,
even though browsers still render our HTML happily without them.

We could add these wrapping tags to each and every one of our templates,
every time we create a new one. However, that's quite some repitition, and
should we ever want to change anything about them (which is likely) we'd
have to change all of our templates.

For building web applications it is handy to have "wrapping" templates. And
that's something Sinatra supports, too. They're called "layout" templates.

Here's how it works:

```ruby
get '/hello/:name' do
  template = "<h1>Hello <%= name %></h1>"
  options = {
    :locals => { :name => params[:name] },
    :layout => "<html><body><%= yield %></body></html>"
  }
  erb template, options
end
```

Don't forget to restart your application, and refresh the page. If you inspect
the source code of the web page (right click on the page, and select "View Page
Source", or whatever that's called in your browser) you'll see that it now has
the `<html>` and `<body>` tags from our layout template.

What about that `yield` thing in the ERB tag in our layout template though?

`yield` is a keyword in Ruby that calls a block that was given to a method.
Hmmm.  Well, that's how it works under the hood, that is correct. However, in
this context, all you need to remember is that, in a layout template, `<%=
yield %>` needs to be place where the other template (the one that is being
wrapped) is supposed to be inserted.

Imagine you have an application with, say, 10 `get` routes. Each of them
renders a different template. Say, there's one for the homepage, one for
a user signup page, one for a user profile page, and so on. Each of these
templates is supposed to be wrapped into the same layout, which has the
enclosing `<html>`, `<body>`, and other tags, which are all common to each
of these pages.

Each route will then render its own template, and specify the layout template
to be used, which will replace the `<%= yield %>` tag with the template, and
wrap it.

Does that make sense?

## Template files

So far we've defined our templates as strings right inside our route. That
worked well because our templates were ridiculously small. Of course, any
real application will have much bigger templates. Managing these inside
our routes would get pretty messy pretty quickly.

It is, therefore, better to store them in separate files. And again, Sinatra
has built-in support for that: when we call the method `erb` with a symbol
instead of a string, then Sinatra assumes this is part of a filename, and
it will look for a template file in a directory `views`.

Let's create a new directory `views`, and add a file `hello.erb`, containing
our template:

```erb
<h1>Hello <%= name %></h1>
```

Also, add a file `layout.erb` with our layout template:

```erb
<html><body><%= yield %></body></html>
```

Now we are ready to change our route as follows:

```ruby
get '/hello/:name' do
  erb :hello, { :locals => { :name => params[:name] } }
end
```

Restart your application, and reload the page. You should see the same result.

But our code looks much better, doesn't it?

## Using instance variables

So far we've passed data to our templates using the `:locals` option key which
holds a hash.

Sinatra supports a second way of passing data, which uses instance variables.
We mention this mostly because this is also the "Rails way" of passing data to
your templates (views).

Let's change our template to use an instance variable `@name`, like so:

```erb
<h1>Hello <%= @name %></h1>
```

If we now assign the same instance variable in our route, then Sinatra will
make it available to the template, too:

```ruby
get '/hello/:name' do
  @name = params["name"]
  erb :hello
end
```

This also is a little bit more concise, and spares a few keystrokes.

So, which way is the better one?

On one hand there's an argument that using the `:locals` way is the cleaner,
and "right" way of doing it. On the other hand using instance variables is much
more common due to the fact that Rails encourages it. As always, you should
just use whatever you think feels better to you, and maybe ask your friends
and fellow developers for their opinions and reasons.


