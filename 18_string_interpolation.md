# String interpolation

As mentioned above you can stick strings together by using the `+` operator.

Consider the following code:

```ruby
name = "Ada"
puts "Hello, " + name + "!"
```

This, of course, will output the message `Hello, Ada!`.

Glueing strings together like this works, and you can do it. However, there is
another method of accomplishing the same, and it is very widely used, and
usually preferred over concating strings with `+`.

This method is called "string interpolation", and this is how it looks:

```ruby
name = "Ada"
puts "Hello, #{name}!"
```

Using this syntax everything between the opening `#{` and closing `}` bits is
evaluated as Ruby code, and the result of this evaluation will be embedded into
the string surrounding it.

In other words, when Ruby finds the bit `#{name}` in this string, then it will
evaluate the piece of Ruby code `name`. It finds that this is a variable, so it
returns the value of the variable, which is the string `"Ada"`. It then embeds
this string into the surrounding string, replacing the bit `#{name}`.

And now we can finally explain the difference between strings created with
single and double quotes:

String interpolation only works with double quotes.

That means that:

```ruby
puts "Interpolation works in double quoted strings: #{1 + 2}."
puts 'And it does not work in single quoted strings: #{1 + 2 }.'
```

will print out:

```ruby
Interpolation works in double quoted strings: 3.
And it does not work in single quoted strings: #{1 + 2 }.
```

If you type the code above in your editor, and syntax highlighting for Ruby
code is used, it should highlight the code in the double quoted string, so it
gives you a visual clue about the interpolation.


So, why do people prefer string interpolation?

First of all, again, it's a few less letters to type. In our example, that's
just 5 characters, no big deal. However, consider a longer string, that is
constructed using three, four, or more variables. Now this extra space quickly
adds up, and things wouldn't nicely fit on a single line anymore.

Also, many people find that the syntax reads a better. There's a little bit
less clutter, and all spaces used actually represent spaces that are part of
the string.

One other, albeit pretty neglectable reason is, that string interpolation
actually uses slightly less resources: The code `"Hello, #{name}!"` creates one
single string, and then embeds another, existing string into it, which is the
string `"Ada"`.

The code `"Hello, " + name + "!"` on the other hand is, as you saw above,
equivalent to the code `"Hello, ".+(name.+("!"))`. That means it creates the
string `"!"`, and passes it to the method `+` on `name`.  `name` also contains
a string, and `+` returns a *new* string, which is, in our example, `"Ada!"`,
now this string is passed to the method `+` on `"Hello, "`, again, generating a
*new* string, `"Hello, Ada!"`.

So, in our example, with string interpolation there are only two strings
involved. Whereas with string concatenation there are 4 different strings
created, even though only 2 of them are interesting to us.

We recommend you pick whatever method works best for you for now. You can
easily ignore the fact that string concatenation produces a few wasted objects,
and the rest is a matter of style.
