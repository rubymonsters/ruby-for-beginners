# Working with Strings

In order to start `irb` open your terminal and type `irb`, then hit the
`return` key (`enter`). In order to quit `irb` again (and get back to your
system shell prompt) you can type `exit` or press `ctrl-d`, which does the
same.

## Exercise 2.1

What do you think this will do?

```ruby
$ irb
> "hello".length + "world".length
```

Try it yourself.

## Exercise 2.3

Skim through the [documentation for strings](http://www.ruby-doc.org/core-2.1.4/String.html)
in the Ruby documentation, and look for a method that prepends one string
to another string.

Using that method prepend the string `"Learning "` to the string `"Ruby"`

<a href="/solutions/strings-3.html" class="solution">Show solution</a>

## Exercise 2.4

Skim through the [documentation for strings](http://www.ruby-doc.org/core-2.1.4/String.html)
in the Ruby documentation, and look for a method that removes characters
from a string.

Using that method turn the string `"Learning Ruby"` into the string `"Lrnng Rb"`.

<a href="/solutions/strings-4.html" class="solution">Show solution</a>

## Exercise 2.5

Find out how to convert the string `"1.23"` into the number `1.23`.

You can either, again, skim the documentation page for strings, or google for
"ruby convert string to number".

Then also find out what method can be used to turn the string `"1"` into the
number `1` (remember floats and integers are different kinds of numbers).

Confirm that you have found the right methods by trying them in `irb`.

<a href="/solutions/strings-5.html" class="solution">Show solution</a>

## Exercise 2.6

There is a method that allows to justify a string, and padding it with another
string.

Find that method and use it on the string `"Ruby"` together with `"<3"` so that
you get the following string back:

```ruby
"Ruby<3<3<3"
```

We'll admit that this is a rather creative usage of this method. Normally you'd
use it to align strings to columns (e.g. so that they line up nicely when you
format a table). You'll use this method in other exercises later on.

<a href="/solutions/strings-6.html" class="solution">Show solution</a>

