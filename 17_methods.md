# Methods

*A named block of code that takes input and returns output*

Everything in programming is about data, and doing interesting things with it.
If you think about Twitter, it essentially takes some 140 characters of text
(which is data) from users and displays it to other users.

You have already learned about some of the most important types of data in
Ruby: numbers and strings, as well as two structures that can be used to store
them: arrays and hashes. That's about the "data" part.

Methods are about the "doing interesting things" part. Methods are all about
encapsulating some bits of behaviour, so that it can be applied to different
bits of data easily. For example there methods that do things like: sorting an
array, reading a CSV file, sending an email, signing in on Facebook, sending
a Tweet.

There are four things that constitute a method:

* a name
* a block of code
* potentially accept some input
* returning some output

Not all methods actually want any input (because they don't need any), and not
always do we care about the output that a method returns.

Imagine a vending machine where you can chip in some money, press some buttons,
and the machine will spin a few gears and wheels and spit out the chocolate bar
you were after.

If the vending machine was a method, then your money, as well as the buttons
you press are the input. The way the machine internally spins certain mechanics
is the block of code. And the product that it dispenses is the return value.
Although this would be an odd thing to mention to a non-programmer, we could
say that a vending machine is a way to "transform" money and data into
chocolate.

Methods are a lot like that. They take some input, do something with it, and
return a result. Instead of using the term "input" in programming we say that
a method accepts a number of arguments. And instead of "output" we use the term
"return value": the thing that we get back from the method.

Let's define a simple method that takes a number, adds the number `2` to it,
and returns the result:

```ruby
def add_two(number)
  number + 2
end
```

This *defines* a method. It does not *use* it, yet. You only build and place
that vending machine, so it can be used later.

Let's walk through this method definition step by step:

* On the first line the keyword `def` tells Ruby that you are about to define a
  new method.
* The next word `add_two` is the name that we want this method to have.
* The parentheses tell Ruby that we are about to define an argument list.
* The arguments list, in our case contains one argument which we'd like to be
  know as `number`.
* The next line (indented by two spaces) is the block of code that the
  method encapsulates, also referred to as the "method body".
* And the keyword `end` tells Ruby that we"re done with the method body.

Now we can use (we say "call") this method like so:

```ruby
def add_two(number)
  number + 2
end

puts add_two(3)
```

* This will create an instance of the number `3`, and call the method we
  defined earlier `add_two`, passing the number to the method, as the argument
  `number`.
* When a method is used (called), then Ruby jumps into the method's body.
  So, we are now inside of the method body, and `number` is now a local
  variable with `3` assigned to it.
* Ruby will now execute the method body, which is the expression `number + 2`.
  Because `number` is assigned `3` (the value that we have passed to the method
  as an argument) this expression will evaluate to `5`.
* Since this line of code is the last line in the method body, the value `5`
  also will be returned from the method.
* We are now back outside of the method. The method call has returned the
  number `5`, and it will be passed to `puts`, which prints it to the screen.

On formatting: Note that

* There are no spaces before, and inside the parentheses that define the
  argument list.
* The method body is indented by exactly two spaces.
* The keyword `end` sits on the same level as the keyword `def`.
