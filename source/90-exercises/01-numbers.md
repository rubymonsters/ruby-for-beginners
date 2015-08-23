# Working with Numbers

In order to start `irb` open your terminal and type `irb`, then hit the
`return` key (`enter`). In order to quit `irb` again (and get back to your
system shell prompt) you can type `exit` or press `ctrl-d`, which does the
same.

## Exercise 1.1

In `irb`, calcluate:

* How many hours are in a year.
* How many minutes are in a decade?
* How many seconds old are you?

## Exercise 1.2

What do you think happens when you combine the following floats and integers?

Try computing these in `irb`:

* `3.0 / 2`
* `3 / 2.0`
* `4 ** 2.0`
* `4.1 % 2`

Is the result a float or an integer?

## Exercise 1.3

Methods are a way of "doing something with an object". E.g. in Ruby, numbers
have two methods that allow you to check whether the number is odd or even.

Look through the <a href="http://ruby-doc.org/core-2.1.5/Fixnum.html">documentation for integer</a>
numbers (called `Fixnum`) and find the methods that tell if a number is odd or
even.

## Exercise 1.4

In `irb`, use these methods to find out if certain numbers are odd or even.
Numbers like `0, 1, 2, 99, -502` etc.

<p class="hint">
You can use a method by appending a dot <code>.</code> and then the method name
to the object. E.g. <code>-99.abs</code> uses (we also say: "calls") the method
<code>abs</code> on the number <code>-99</code>.
</p>

Try for yourself what it does, and google for "ruby abs" to find
[the documentation](http://ruby-doc.org/core-2.0/Numeric.html#method-i-abs)
for this method.
