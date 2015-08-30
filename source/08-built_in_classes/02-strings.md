# Strings

A String, in programming languages, is text.

More precisely a String is an object that represents a specific text. E.g. your
name, represented in Ruby, is one String. The title of this text is another
String, and so is this paragraph, and this full text in its entirety.

In web applications Strings are everywhere. In fact they're used by far more
often than numbers. That probably is because most applications that we deal
with on a daily basis are dealing with text messages (Email, Facebook, Twitter,
...) or descriptions of things (Amazon, Ebay, ...).

Did you ever use a web application that is a complicated calculator app, and
mostly deals with numbers? There you go :)

In Ruby there are a couple of flexible ways to create Strings, but the most simple
and by far most common way is to simply enclose some characters in quotes:

```ruby
"This is one String!"
'And this is another one.'
```

<p class="hint">
Strings can be defined by enclosing any text with single or double quotes.
</p>

Both of these are good to use. Technically they are *almost* the same, except
for one important feature called "String interpolation", which we'll [explain
later](/bonus/string_interpolation.html).

### Things you can do with Strings

Here are a few things you can do with Strings.

You can glue them together by using `+`. We also call this
[concatenation](http://www.wikiwand.com/en/Concatenation).

```ruby
$ irb
> "snow" + "ball"
=> "snowball"

> "hi" + "hi" + "hi"
=> "hihihi"
```

The last operation can also be done by using `*`, like so:

```ruby
$ irb
> "hi" * 3
=> "hihihi"
```

I.e. multiplying a String by a number in Ruby means repeating the String as
many times.

The following examples are worth noting, too:


```ruby
$ irb
> "1" + "1" + "1"
=> "111"

> "1" * 3
=> "111"
```

This demonstrates that Ruby behaves the same for Strings that contain nothing
but numbers.

Some other things that you can do with Strings that you can try yourself in
`irb`:

```ruby
> "hello".upcase
=> "HELLO"

> "hello".capitalize
=> "Hello"

> "hello".length
=> 5

> "hello".reverse
=> "olleh"
```

<p class="hint">
These last few examples are examples of "calling methods on objects that are Strings".
Methods are "behaviour" that objects are capable of. We'll explain methods, and how
they relate to objects more in just a few chapters.
</p>

Exercises: How about doing some of the [exercises on Strings](/exercises/strings.html)
next?

## History

The reason why pieces of text, in the context of programming languages, usually
are not referred to as "text", but instead with the slightly odd term "String"
is a historical, and technical one:

In early programming languages Strings were implemented as lists of characters,
and programmers had to deal with them as such: imagine pellets lined up on a
String. One had to take care of nasty things like manually managing the length
of the character list, and inserting a couple characters in the middle of such
a list was quite a complicated operation.

When languages evolved over time they made things like this easier for
developers, and added built-in abstractions for the concept of "Strings".
So the name sticked, and resembles the way programmers had thought about text
before: as characters lined up on Strings.

<p class="hint">
Luckily, nowadays, in Ruby and any other modern language, you can just think
about Strings as text.
</p>

