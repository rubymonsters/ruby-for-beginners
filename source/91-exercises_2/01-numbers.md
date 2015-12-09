# Working with Numbers

In order to do these exercises you should have read at least the chapter about
[built_in_classes/numbers.html].

## Exercise 1.1

In `irb`, calcluate:

* How many hours are in a year.
* How many minutes are in a decade?
* How many seconds old are you?

<p class="hint">
To start <code>irb</code> open your terminal and type <code>irb</code>, then
hit the <code>return</code> key (<code>enter</code>). To quit it (and get back
to your system shell prompt) type <code>exit</code> or press <code>ctrl-d</code>.
</p>

## Exercise 1.2

What do you think happens when you combine floats and integers the following
in the following calculations?

Try computing these in `irb`:

* `3 / 2`
* `3.0 / 2`
* `3 / 2.0`
* `4 * 2.0`
* `0 + 1`

Is the result a float or an integer?

## Exercise 1.3

Try finding out what "modulo" means by asking Google.

In Ruby (and many other languages) the operator for modulo is `%`.

Try the following in `irb`:

* `5 % 2`
* `15 % 2`
* `505 % 2`

And:

* `8 % 5`
* `9 % 5`
* `10 % 5`
* `11 % 5`

## Exercise 1.4

Methods are a way of "doing something with an object", and you'll learn a lot
more about them in a few chapters.

In Ruby, numbers have methods that allow you to check whether the number is odd
or even.

Look through the <a href="http://ruby-doc.org/core-2.2.2/Integer.html">documentation for integer</a>
numbers and find the methods that tell if a number is odd or even.

Look at the examples for some of the other methods on that page.

<p class="hint">
You can use a method by appending a dot <code>.</code> and then the method name
to the object. E.g. <code>-99.abs</code> uses (we also say: "calls") the method
<code>abs</code> on the number <code>-99</code>.
</p>

## Exercise 1.5

In `irb`, use these methods to find out if certain numbers are odd or even.

Try a bunch of numbers like `0, 1, 2, 99, -502` etc.

Try for yourself what it does, and google for "ruby number odd even" to find
[the documentation](http://ruby-doc.org/core-2.2.2/Integer.html#method-i-odd-3F)
for these methods.

<a href="/solutions_2/numbers-5.html" class="solution">Show solution</a>
