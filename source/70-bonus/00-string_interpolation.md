# String interpolation

As mentioned above you can stick strings together by using the `+` operator.

Consider the following code:

```ruby
name = "Ada"
puts "Hello, " + name + "!"
```

This, of course, will output the message `Hello, Ada!`.

Glueing strings together like this works, and you can do it. However, there is
another method of accomplishing the same, and it is widely used, and usually
preferred over concatenating strings with `+`.

This method is called "string interpolation", and this is how it looks:

```ruby
name = "Ada"
puts "Hello, #{name}!"
```

Using this syntax everything between the opening `#{` and closing `}` bits is
evaluated as Ruby code, and the result of this evaluation will be *embedded
into* the string surrounding it.

In other words, when Ruby finds `#{name}` in this string, then it will
evaluate the piece of Ruby code `name`. It finds that this is a variable, so it
returns the value of the variable, which is the string `"Ada"`. So it embeds it
into the surrounding string `"Hello, #{name}!"`, by replacing `#{name}`.

Now we can also finally explain the difference between strings created with
single and double quotes:

String interpolation only works with double quotes.

That means that:

```ruby
puts "Interpolation works in double quoted strings: #{1 + 2}."
puts 'And it does not work in single quoted strings: #{1 + 2}.'
```

will print out:

```
Interpolation works in double quoted strings: 3.
And it does not work in single quoted strings: #{1 + 2}.
```

If you type the code above in your editor, and syntax highlighting for Ruby
code is used, it should highlight the code in the double quoted string, so it
gives you a visual clue about the interpolation.


So, why do people prefer string interpolation?

First of all, again, it's slightly fewer letters to type. In our example, that's
just 5 characters, no big deal. However, consider a longer string, which is
constructed using three, four, or more variables. Now this extra space quickly
adds up, and things wouldn't fit nicely on a single line anymore.

Also, many people find that the syntax reads a bit better. There's a little bit
less clutter, making it a little bit easier to see what's going on.

One other, albeit pretty negligible reason is, that string interpolation
actually uses less resources:

* The code `"Hello, #{name}!"` creates one single new string object, and then
  embeds the existing string `"Ada"` into it.

* The code `"Hello, " + name + "!"` on the other hand creates 3 new string
  objects: first it creates the string `"!"`, and passes it to the method `+`
  on the existing string `"Ada"`.  The operator `+` returns a *new* string,
  which now is `"Ada!"`.  Now this string is passed to the method `+` on
  `"Hello, "`, which again, creates a *new* string, `"Hello, Ada!"`.

So, string concatenation creates 2 more string objects even in our simple
example. These intermediate objects are immediately discarded, because they're
not used any more. We're only interested in the final result `"Hello, Ada!"`.

We recommend you get used to using string interpolation, just because this
is what most developers use.

#### Escape sequences

There's one other little difference between single and double-quoted string
that we should mention while we're at it.

In programming, strings can not only contain text as we normally think about
it. They can also contain [control characters](http://www.wikiwand.com/en/Control_character).
Control characters are also called "non-printing" characters, even though
they can have visual effects.

Control characters can represent all sorts of things, such as removing
the last character ("backspace"), the next one ("delete"), or even causing
an auditable alert ("bell").

The one most typically used in Ruby programs is the "newline" character.

Because there's no way to represent a "newline" character using any of the
keys on your keyboard programmers have come up with the idea of [escape
sequences](http://www.wikiwand.com/en/Escape_sequences_in_C): An escape
sequence is a code that consists of a backslash and another character,
and this combination is used in place of control characters.

For example, `\n` is the escape sequence that stands for the "newline"
character.

So this code:

```ruby
puts "one\ntwo\nthree"
```

Will print out:

```
one
two
three
```

Now, escape sequences also only work in double quoted strings. If you
try to use them in a single quoted string like so:

```ruby
puts 'one\ntwo\nthree'
```

then that will print out the string literally:

```
one\ntwo\nthree
```

Which means that escape sequences are not replaced in single quoted strings.
