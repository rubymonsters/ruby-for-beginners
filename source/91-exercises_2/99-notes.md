# Working with Strings

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


# Working with Arrays (1)

## Exercise 3.3

Make a new file `arrays_1-3.rb`, and fill in the following line:

```ruby
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# your code goes here
p numbers
```

So that you get the following output:

```ruby
[2, 4, 6, 8, 10]
```

<p class="hint">
Read the documentation for the method <code>select</code> that you can use on arrays
on the <a href="http://www.ruby-doc.org/core-2.2.0/Array.html#method-i-select">Ruby documentation</a>
</p>

<a href="/solutions/arrays_1-3.html" class="solution">Show solution</a>

## Exercise 3.5

Again, copy your last file to a new file: `cp arrays_1-4.rb arrays_1-5.rb`,
then open this new file.

Now change your code so that you get the following output:

```ruby
[10, 8, 4, 2]
```

Bonus: Find at least three different solutions for this last change.

<a href="/solutions/arrays_1-5.html" class="solution">Show solution</a>


