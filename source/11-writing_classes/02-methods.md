# Defining instance methods

If you have read closely methods can be defined and called on objects (i.e.
instances), e.g. `1.odd?`. And you have just seen that they can also be
defined on classes, e.g. `Calculator.new`.

Fairly straightforward, methods that are available on classes are called
*class methods*, and methods that are available on instances are called
*instance methods*.

In this chapter we want to add the "stand alone" methods that we've learned to
port (move) in the previous chapters [Writing Methods](/writing_methods.html)
to our class `Calculator` so that they'll end up as instance methods.

Here's how we can do that.

```ruby
class Calculator
  def sum(number, other)
    number + other
  end
end
```

That's right. You simply move the method into the class body, so that it's
enclosed by it.

<p class="hint">
Instance methods are defined inside the class body.
</p>

Also note that the method definition is indented by one level, that is, 2
spaces. This signals that the method `sum` belongs to the class `Calculator`.
Everything between the line `class Calculator` and the final line `end` is
called the "class body", and just like method bodies we indent them by one more
level.

<p class="hint formatting">
On formatting: the keywords <code>class</code> and <code>end</code> sit on
the same level. The class body is indented by one level.
</p>


Cool.

So, how can we use the new method? That is, how can we *call* the method `sum`
on a calculator?

Before you read more, think about this a little. In theory you have all the bits
and pieces to answer this question:

* You know how to create a new calculator instance (object).
* You know how to call a method on an object.
* You know how to pass arguments (extra bits of information) to the method call.

We can instantiate ("order") a new instance from our `Calculator` class, and
call the method `sum` on it like so:

```ruby
calculator = Calculator.new
puts calculator.sum(2, 3)
```

This will output `5`. Success :)

A calculator that cannot do anything but additions is pretty useless. Let's
spice our class up by adding more operations, i.e. methods. Also, let's rename
`sum` to `plus` so it matches the operator:

```ruby
class Calculator
  def plus(number, other)
    number + other
  end

  def minus(number, other)
    number - other
  end

  def multiply(number, other)
    number * other
  end

  def divide(number, other)
    number / other
  end
end
```

Now our calculator already is slightly more useful: We can do the most basic
math operations with it.

```ruby
calculator = Calculator.new
puts calculator.plus(2, 3)
puts calculator.minus(2, 3)
puts calculator.multiply(2, 3)
puts calculator.divide(2, 3)
```

This will output:

```
5
-1
6
0
```

Whoops!

This looks all good except for the last line, right. Remember why that is?
Right, dividing one integer number by another returns, again, an integer
number. And these aren't quite great for calculating divisions.

One thing we could do about this is require the users of our calculator to pass
(provide) the appropriate types of numbers themselves. So it would be their own
responsibility if something goes wrong with the division.

However, we could also think that a calculator should be smart enough to notice
this.  So we could improve our calculator to always change the type of the
numbers passed to floating point numbers as part of the method `divide`. In
other words, the method `divide` would take the numbers, makes sure at least
one of them is a `Float` (floating point number), and only then do the
calculation.

The method used to convert an integer to a float is `to_f`. When called on a
float it will just return the float:

```ruby
$ irb
> 1.to_f
1.0
> 1.0.to_f
1.0
```

Alright, lets use that knowledge to improve our `divide` method. It will be
sufficient to call the method `to_f` on one of the numbers, because that will
make sure we get a `Float` back:

```ruby
class Calculator
  # ...

  def divide(number, other)
    number.to_f / other
  end
end
```

With that in place our calculator always returns a `Float` from the method
`divide`:

```ruby
calculator = Calculator.new
puts calculator.plus(2, 3)
puts calculator.minus(2, 3)
puts calculator.multiply(2, 3)
puts calculator.divide(2, 3)
```

This will output:

```
5
-1
6
0.666666666666
```

Perfect.

Let's move on, and define a class `Person`, which should be even more fun.
