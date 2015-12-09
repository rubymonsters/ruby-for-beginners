# Using (calling) a method

Once defined we can use our method.

As programmers we usually say that we "call" a method. This means we ask Ruby
to execute the code that the method body has, with some given arguments
(input), if any.

Here's how that looks:

```ruby
def add_two(number)
  number + 2
end

puts add_two(3)
```

Let's inspect what's happening here under the microscope. If you don't
understand each part of this just yet, don't worry, we'll get back to all of
this.

On the first three lines Ruby defines the method `add_two` as discussed above.

* On the next line Ruby will look at the bit `add_two(3)` first. She recognizes
  that we are referring to a method defined earlier, and this will tell her we
  want to call (execute, use) this method.
* In order to do so she first needs to look at what's inside the parantheses
  `()` so she can pass it on. She finds the `3` and creates a new object
  (number) for it.
* Now Ruby is ready to actually call (execute, use) the method, passing the
  number `3`.

So Ruby now deviates from the normal flow, which just goes from top to bottom
in our file. Instead she now jumps into the method body.

In this moment she now *assigns* the number `3` to a local variable `number`
before she starts executing the method body.

That's right. This is how method *arguments* work:

When a method is called and objects are passed as arguments, then Ruby
implicitely defines local variables with the argument names. She assigns the
passed objects to the variable names that are in the argument list. These local
variables are then available in the method body.

In our case we have just one argument `number`. So we get one local variable
`name` with the object `3` assigned (because that's the object passed when we
called the method).

You can imagine the method body now reads like this:

```ruby
number = 3
number + 2
```

Ok, so we're inside the method body now:

* Ruby will now execute (evaluate, run) the method body (again, going from top
  to bottom), which in our case is just a single line with the expression
  `number + 2`.
* Because `number` is assigned `3` this expression will evaluate to `5`.
* Since this line of code is the last line in the method body, the value `5`
  also is the value returned from the method call.

So Ruby now jumps back out of the method. The expression `add_two(3)` has just
returned the object `5`. Imagine the last line now reads like this instead:

```ruby
puts 5
```

And that will now print the number `5` to the screen.

Let's have a closer look at that thing with the return value ("output"), as
we just rushed over that a little.
