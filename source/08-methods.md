# Methods

*A named block of code that takes input and returns output*

Everything in programming is about data, and doing interesting things with it.
If you think about Twitter, it essentially takes 140 characters of text
(which is data) from users and displays it to other users.

You have already learned about the most important primitive (simplistic) types
of data in Ruby: numbers, strings, symbols, true, false and nil. And we've had
a quick look at the two most common data structures that can be used to store
things: arrays and hashes.

All of this was about the *data* part so far.  Methods on the other hand are
about the *doing interesting things* part.

## Methods define behaviour

Methods are all about defining bits of *behaviour* (actions), so that they can
be applied to different bits of data in different contexts easily. For example,
there are methods that do things like: sorting an array, reading a CSV file,
sending an email, signing in to Facebook, sending a Tweet.

This means that unless you're studying computer science at university and
you're faced with the (questionable, but pretty much inevitable) exercises of
implementing your own sorting algorithms for data collections, ... you'll just
use the method `sort` that already comes defined on Arrays in Ruby out of the
box.

Most of the time, in day-to-day programming, we'd define object types
(classes), and add methods to them (e.g. a user knows and responds with their
name, when asked. So we define a class `User` and give it a method `name`).

However, one can also define methods without defining classes. So we'll start
with this, and then later explain what classes are and how you can use them
to create your own, more fancy objects.

## What makes a method

There are four things that constitute a method:

* a name
* a block of code
* (optionally) accepting input
* returning output

Not all methods actually need input (so they don't take any), and not always do
we care about the output that a method returns.

Imagine a vending machine where you can chip in some money, press some buttons,
and the machine will spin a few gears and wheels, and spit out the chocolate
bar you were after.

If the vending machine was a method, then your money, as well as the buttons
you press are the *input*. The way the machine internally spins certain
mechanics is the *block of code*, the stuff it does internally. And the product
that it dispenses is the *return value*.

Although this would be an odd thing to mention to a non-programmer, we could
say that a vending machine is a way of "transforming" money and data into
chocolate.

Methods are a lot like that:

<p class="hint">
Methods have a name, take some input, do something with it, and return a result.
</p>

Instead of using the term "input" in programming we say that a method accepts a
number of *arguments*. And instead of "output" we use the term *return value*:
the thing that we get back from the method.

## Defining a method

Let's define a simple method that takes a number, adds the number `2` to it,
and returns the result:

```ruby
def add_two(number)
  number + 2
end
```

This *defines* a method. It does not *use* it, yet: You only build and place
that vending machine, so it can be used (by yourself, or others) later.

Let's walk through this method definition step by step:

* On the first line the keyword `def` tells Ruby that you are about to define a
  new method.
* The next word `add_two` is the name that we want this method to have.
* The parentheses tell Ruby that we are about to define an argument list.
* The arguments list, in our case contains a single argument which we give
  the name `number`.
* The next line (indented by two spaces) is the block of code that the
  method encapsulates, also referred to as the *method body*.
* Inside the method body the arguments are known as local variables, so
  we can use it, and add something to it.
* Finally the keyword `end` tells Ruby that we're done with the method body,
  and the method definition.

Again, all we've done so far is defining the method, we haven't used it for
anything, yet.

## Using (calling) a method

Once defined we can use (we say "call") our method like so:

```ruby
def add_two(number)
  number + 2
end

puts add_two(3)
```

We will discuss each aspect of this method definition (and other examples) in
depth in the following chapters. But let's quickly walk through this inder the
microscope, too. If you don't understand each part of this just yet, don't
worry, we'll get back to all of this.

* On the first three lines Ruby defines the method `add_two` as discussed
  above.
* On the next line Ruby will look at the bit `add_two(3)` first. It recognizes
  that we are referring to a method defined earlier, and this will tell it to
  call (execute, use) this method.
* In order to do so it first needs to look at what's inside the parantheses `()`.
  It finds the `3` and so it creates a new object (number) for it.
  Now Ruby is ready to actually call (execute, use) the method, passing the
  number `3`.

So it now jumps into the method body.

Doing so it now *assigns* the number `3` to a local variable `number` before
it starts executing the method body.

That's how method arguments work: When a method is called and objects are
passed as arguments, then Ruby implicitely defines local variables with the
argument names, and assigns the passed objects to them (in our case we have
just one argument `number`). These local variables are then available in the
method body.

You can imagine the method body now reads like this:

```ruby
number = 3
number + 2
```

* Ruby will now execute (evaluate, run) the method body, which in our case is a
  single line with the expression `number + 2`.
* Because `number` is assigned `3` this expression will evaluate to `5`.
* Since this line of code is the last line in the method body, the value `5`
  also is the value returned from the method call.

So Ruby now jumps back out of the method. The expression `add_two(3)` has just
returned the object `5`. Imagine the last line now reads like this instead:

```ruby
puts 5
```

And you know what that does. It prints the number `5` to the screen.

<p class="hint">
On formatting: There are no spaces before, and inside the parentheses that
define the argument list.  The method body is indented by exactly two spaces.
The keyword <code>end</code> sits on the same level as the keyword
<code>def</code>.
</p>

## Terminology: Arguments vs Parameters

We should mention that we are slightly simplifying terminology here. We
conflate two terms that normally would be defined separately: We simply use the
term "argument" for both the variable names that are defined in the arguments
list of the method definition, and the value that is passed as part of the
method call.

In programming, normally the "argument list" is called a "parameter list"
instead, and a single name on it is called a "parameter". On the other hand,
only the objects passed when calling the method are referred to as "arguments".

E.g. in the code:

```ruby
def add_two(number)
  number + 2
end

puts add_two(3)
```

the word `number` in the first line is a "parameter", whereas `3` in the
last line is an "argument".

We found making this distinction in our beginners classes unnecessarily
confusing, and thus ignore it. We simply call both these things "arguments",
and point out that they create a local variable inside of the method body.

So, now you know :)
