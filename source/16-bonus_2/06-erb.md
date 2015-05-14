# Bonus: Embedded Ruby

HTML is the main format that fuels the world wide web, i.e. the part of the
internet that we use most often.

Web applications are applications that run somewhere on the internet, and that
web browsers talk to. E.g. if you check your Twitter, or Facebook feed your browner
talks to the respective applications that are run by these companies.

Since generating HTML (so it can be send to web browsers) dynamically based on
some data (e.g. the current user's name, and their tweets, or emails) is the
one main concern of many web applications Ruby has some builtin support for
making this easier: a library called ERB, short for "embedded Ruby".

The main idea behind ERB is to embed some Ruby code *into* an HTML document
(also called a template). This idea actually predates Ruby's ERB library and
became popular with PHP, a language that originally was meant to be used
exactly this way: by embedding some code into an HTML template file.

Here's an example:

```erb
<html>
  <body>
    <h1>Messages for <%= name %></h1>
    <ul>
      <% messages.each do |message| %>
        <li><%= message %></li>
      <% end %>
    </ul>
  </body>
</html>
```

Can you guess what this means?

Everything inside the so called ERB tags `<% ... %>` is considered Ruby code.
Everything outside of them is just some text, in our case HTML code, into
which the results of the Ruby code will be embedded whenever the ERB tag also
has an equals sign, as in `<%= ... %>`.

Imagine stripping everything outside the ERB tags, and the tags themselves
from the code above. And imagine replacing the `=` equals sign with `puts`
statements. You'd then end up with this code:

```ruby
puts name

messages.each do |message|
  puts message
end
```

That's some code you understand, right? ERB, when executed, does exactly this,
except that `=` as part of the ERB tag `<%= ... %>` will not output things to
the terminal, but capture it, and insert it to the surounding text (HTML code,
in our case) in place of this tag.

Ruby code in ERB tags that do not have an equal sign, such as `<% ... %>` will
be executed, but the output will not be captured, but just discarded.

Now the above Ruby code uses two local variables, or methods with the names
`name` as well as `messages` (where `each` is called on `messages`, so this
should probably be an array).

So how do we provide these objects to the ERB template? And how do we execute
the whole thing?

It's probably best to look at a simple example:

```ruby
require "erb"

template = %(
  <html>
    <body>
      <h1>Messages for <%= name %></h1>
      <ul>
        <% messages.each do |message| %>
          <li><%= message %></li>
        <% end %>
      </ul>
    </body>
  </html>
)

name = "Ruby Monstas"
messages = [
  "We meet every Monday night at 7pm",
  "We've almost completed the beginners course!",
  "Feel free to come by and join us!"
]

html = ERB.new(template).result(binding)
puts html
```

Does this code make sense to you?

On the first line we require the erb from the
<a href="http://ruby-doc.org/stdlib-2.2.2/libdoc/erb/rdoc/ERB.html">Ruby Standard Library</a>.

Also, as you've learned in <a href="/bonus_1/alternative-syntax.html">this chapter</a>
the syntax `%(something)` defines a string. So, `template` is just one, long
string that contains our HTML code including ERB tags (the same as discussed above).

Next we define two local variables `name` and `messages`, which hold a simple
string, as well as an array with 3 strings.

Now on the next line we create an instace of the class `ERB` and pass our
`template` (the string defined earlier) to it. On this instance we then call
the method `result` with something that is called `binding`.

This method call to `result` returns something that we assign to the variable
`html`, so, as you might guess, this should be the HTML we were after.

Let's just output it to the terminal on the last line, using `puts`.

If you run this code it will output something like this:

```html
<html>
  <body>
    <h1>Messages for Ruby Monstas</h1>
    <ul>
      <li>We meet every Monday night at 7pm</li>
      <li>We've almost completed the beginners course!</li>
      <li>Feel free to come by and join us!</li>
    </ul>
  </body>
</html>
```

... which is a valid HTML document that a browser would render (display) like
this:

<img src="/assets/images/06-erb_1.png">

Looks good?

So, basically, all that our code above does is the following:

* Define an template with some HTML and some embedded ERB tags.
* Define a couple variables that contain things that our template wants (`name` and `messages`).
* Create an instance of the class ERB, passing this template.
* On this instance, call the method `result`.

This executes (we say "renders") the ERB template using the `name` and
`messages` objects, and returns the HTML as a result.

Now, what's this `binding` thing? Obviously we do not define a local variable,
so it needs to be a method.

Let's google that: <a href="">Ruby binding</a>

The first result goes to the <a
href="http://ruby-doc.org/core-2.2.0/Binding.html">Ruby documentation</a>,
saying (some rather cryptic stuff stripped for our purpose):

*"Objects of class Binding encapsulate the execution context at some particular
place in the code and retain this context for future use. The variables,
methods, [...] that can be accessed in this context are all retained. Binding
objects can be created using Kernel#binding [...]. These binding objects can be
passed [around]."*

Hmmmmm, let's re-read that, and think about it.

First of all, <a href="http://ruby-doc.org/core-2.2.2/Kernel.html">Kernel</a>
is something we have never mentioned so far. It is a
<a href="/bonus_2/modules">Ruby module</a> that is included to each and every
object in Ruby: whenever you create any object, this module, and thus all of
its methods will be included. This is the secret reason to why methods like
`p`, `puts`, and so on are available everywhere, and it is also the reason
why we do not have to define the method `binding`. It's just already there.

Now, what's this execution context the documentation is talking about?

Remember when we talked about <a href="/methods/scopes.html">scopes</a> in the
context of methods? That's the same as the Ruby documentation means by
"execution context".  It is that empty room or space that Ruby enters whenever
it starts your program, or enters a method. If you define a *local* variable,
then this variable will be visible within this scope, or room, but not outside
of it.

Now the `binding` is exactly *this knowledge*: which variables are defined,
and what objects they are referring to. And the `binding` itself is an object
that can be passed around.

If you find this puzzling and confusing don't worry. This is, seriously, a
piece of knowledge few Ruby programmers know about, or at least they very
rarely use this themselves. Putting very advanced programming techniques
(called "meta programming") aside rendering ERB templates is the one single use
case where you ever need it. (And, on top of this, as a developer who builds
Sinatra or Rails applications you also never use it yourself because both
Sinatra and Rails ship with tools that hide this weird stuff from you).

For now, the one thing you can remember is that, by calling `binding` and
passing the result to the ERB instance, you simply pass *access* to the
two local variables `name` and `messages`, so they can be used inside your
ERB template.

Does this make sense?

Then maybe it's a good time for an
<a href="/exercises/mailbox_erb.html">exercise on ERB</a>.







