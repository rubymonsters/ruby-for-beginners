# Using the right words

*Naming things is hard*

Just like programmers are obsessed about formatting, they also care a lot
about how to name the things they create.

Choosing good names for your variables, methods, and classes is important,
because this makes your code more expressive and easy to read. In fact, once
you've learned the basic concepts of Ruby, well crafted code will read almost
like a prose text to you.  Not necessarily like your favorite novel, but maybe
like a recipe or other instructional prose. Ruby is particularly great for
writing expressive, readable code.

Here are a few examples of great, and rather bad names to pick.

Consider this code:

```ruby
class Email
  def initialize(str, string2, headers_hash)
    # ...
  end

  # more methods ...
end

an_email = Email.new("Hi there, Ruby Monstas!", "2015-01-02", { :from => "Ferdous" })
```

From looking at the first two lines of this code you can figure out that the
author defines an Email class, and it takes 3 arguments, two of which probably
are supposed to be strings, and one is a hash containing some headers.

But what's the purpose of the first two arguments? All we know the author wants them
to be strings. So we might have to consult the documentation, or look at examples
using the class. Luckily we can find an example at the very bottom of the file, and
see that the first argument is supposed to be the subject, while the second one is
a date.

Using the "type" of an object as a variable name, or part of a variable name,
usually is not a very good idea: `string`, `array`, `hash` often are bad names,
except in contexts where the type of the object is all that matters. One example
for such a context is the method definition `def encrypt(string)` in the
<a href="/advanced/modules.html">Modules</a> chapter.

In our case it makes sense to name these arguments `subject` and `date` in the
first place, in order to make it easier for others to understand the purpose of
these arguments:

When you tell your non-programmer friends that "An email requires two strings
and a hash of headers.", they'd probably stare at you weird and switch to
another topic.  When you instead say "An email requires a subject, a date, and
some headers" then they might roughly understand what you're saying.

So let's rename them:

```ruby
class Email
  def initialize(subject, date, headers)
    # ...
  end
end

email = Email.new("Hi there, Ruby Monstas!", "2015-01-02", { :from => "Ferdous" })
```

Also, the first argument name `str` in the first example is an abbreviation,
which is something that isn't very common in the Ruby world. People used to use
abbreviated variable names back when memory was extremely sparse, and
expensive: longer variable names would consume more memory. Nowadays there's
just no reason any more to make your fellow developers puzzle over abbreviated
names. Consider `var`, `var1`, `var_2` bad names, and instead use names that
reveal (talk about) your intentions, and their purpose.

Did you notice the local variable name `an_email` in the first example? The
name `email` in the second example also is much better in most situations. The
prefix `an_` doesn't add any kind of information. It's just noisy, and adds
clutter.

Another example:

```ruby
emailslist = [
  Email.new("Hi there, Ruby Monstas!", "2015-01-02", { :from => "Ferdous" }),
  Email.new("Keep on coding! :)", "2015-01-03", { :from => "Dajana" })
]
emailslist.each do |mail|
  puts mail.subject
end
```

Again, `list` says something about the type. Why not just call it `emails`. The
plural already says that it's some kind of list.

Also, the block argument `mail` deviates from the class name `Email`, and the
variable name `emails` ... and thus might raise a question "Wait, is this a
`mail` maybe something different from an `email` in this code?". So why not
avoid confusion like that in the first place and call it `email` ... simply
the singular form of the name of the collection `emails`:

```ruby
emails = [
  Email.new("Hi there, Ruby Monstas!", "2015-01-02", { :from => "Ferdous" }),
  Email.new("Keep on coding! :)", "2015-01-03", { :from => "Dajana" })
]
emails.each do |email|
  puts email.subject
end
```

The section "Naming variables" in this chapter of
<a href="http://tutorials.jumpstartlab.com/projects/ruby_in_100_minutes.html#2.-variables">Ruby in 100 Minutes</a>
also has a couple great examples of good vs bad names.

Also, even though these examples are talking about local variables, the same
reasoning applies to method names, class names, ... basically any name that you pick.

Great names reveal your intention while you write this code. They talk about
the purpose of your code, and explain things to your fellow developers.

Oh, and if you're curious to read more about this, here is an interesting presentation on
[How to name things](http://www.slideshare.net/pirhilton/how-to-name-things-the-hardest-problem-in-programming)
as well as a blog post on what programmers find the
[hardest tasks](http://www.itworld.com/article/2833265/cloud-computing/don-t-go-into-programming-if-you-don-t-have-a-good-thesaurus.html)
they face (guess what, it's naming things ...).
