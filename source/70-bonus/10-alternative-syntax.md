# Alternative Syntax

You have, so far, learned that Strings are defined using single or double
quotes, like so:

```ruby
"A String"
'Another String'
```

And Arrays are defined using square brackes, with a comma separated list of
objects, like so:

```ruby
["One", "Two", "Three"]
```

We'd like to quickly mention two alternative syntaxes for defining the same
objects, even though they're not used very often. However, you may sometimes
find them in other people's code, so it's useful to know they exist.

## Strings

First, Ruby has an alternative syntax for defining strings that goes like so:

`%[any-character]The actual string[the same character]`

Meaning, that when there's a percentage character `%` followed by any other
character, which also closes the whole thing, then this defines a string, too.

For examples these definitions all mean exactly the same:

```ruby
"A String"
'A String'
%(A String)
%{A String}
%|A String|
```

Which character is used to open and close the string is a matter of style, and
preference. The author of this text prefers round paratheses for readability,
but others prefer curly braces or pipes. There's no very clear convention in
the Ruby community.

When would you use this alternative syntax?

Sometimes you need to define a string that itself contains (or may contain, in
future versions) the same quote character that you've used to define the string.
For example, if you have a string that contains the string `"Name"`, including
the quotes, but in the same string you'd also like to use
[String interpolation](/bonus/string_interpolation.html), so you'd normally
use double quotes to define the string. In that case you'd need to escape the
double quotes that are contained in your string.

It probably helps to look at an example. Imagine you're working on an
application that asks the user for an email address, validates the format of
the given address, and then displays an error message if the format looks
invalid:

```
The given email address "ruby@monstas" does not look like a valid email address.
```

Using double quotes your code might look like this:

```ruby
address = "ruby@monstas"
message = "The given email address \"#{address}\" does not look like a valid email address."
puts message
```

Try running this code, and then also try removing the backslashes, and running
it again. You'll get a syntax error message because Ruby thinks the second
double quote (after `address `) closes the first one, so it would look at
`#{...}` outside of a string, which is not valid Ruby.

While the above code, including the backslash characters, is valid Ruby code,
it looks a little ugly. Typing this stuff is kinda cumbersome, and programmers
usually hate it.

So Ruby gives us another, nicer way to express the same:

```ruby
message = %(The given email address "#{address}" does not look like a valid email address.)
```

Also, this allows us to freely change the message later, without having to
change the quotes. For example, if our original message would have looked like
so:

```ruby
message = %(The given email address does not look like a valid email address.)
```

We could now change it to say the following without changing the quotes:

```ruby
message = %(The given email address doesn't look like a valid email address.)
```

## Arrays

Imagine you are running a programming study group, and you want to quickly
write a piece of code that runs a little raffle to assign people to pairs
randomly.

```ruby
people = [
  "Anne",
  "Elizabeth",
  "Erica",
  "Iryna",
  "Johanna",
  "Juliane",
  "Katja",
  "Katrin",
  "Maria",
  "Renate",
  "Sureka",
  "Miriam",
  "Zazie",
  "Anja"
]
people.shuffle.each_slice(2) do |pair|
  puts pair.join(', ')
end
```

Well, this code works. But wouldn't it be cool to be able to define the array
without having to write out all those quotes and commas? They're quite
cumbersome to type, aren't they? Also, if we could omit them then we could just
copy and paste that list of names from some where else, without modifying it
further.

Luckily, Ruby provides us with a piece of syntax that does exactly this:

```ruby
people = %w(
  Anne
  Elizabeth
  Erica
  Iryna
  Johanna
  Juliane
  Katja
  Katrin
  Maria
  Renate
  Sureka
  Miriam
  Zazie
  Anja
)
people.shuffle.each_slice(2) do |pair|
  puts pair.join(', ')
end
```

The `w` in `%w(...)` stands for "words", which means an array defined like this
will always only contain strings. So, `%w(1 2 3 4)` would result in the same
array as `["1", "2", "3", "4"]`.
