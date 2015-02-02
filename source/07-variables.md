# Variables

*Naming things*

In order to refer to the "things" (objects) that our program deals with we want
to assign names to them.

Every practical programming language has a feature to do this, called
variables. This is basically the same concept that you might know from math,
although in Ruby there are different kinds of variables (which you will learn
about later).

In the following example the first line calculates the result of the operation
`2 + 3 * 4` and sticks the name `number` on the result. In doing so it creates
a variable: a name that refers to something (an object, in our case a number).

Think of it like a post-it note with the name `number` written on it, and stuck
on the actual thing, which is an object (in this case, a number).

The second line then refers to the number that was the result of the
calculation, by using the variable name, and prints the result to the screen:

```ruby
number = 2 + 3 * 4
puts number
```

This will output the number `14`.

In practice, instead of saying that we "give the name `number` to the result",
we usually say that we "assign the result to the variable `number`". From then
on we can say that "the variable number is assigned 14" (in our example).

The operator `=` is called the assignment operator. It simply does that: It
assigns the value on the right side to the variable given on the left side.

Note that, in order to assign the value on the right, Ruby needs to evaluate
the expression `2 + 3 * 4` first. This evaluation will return the value `14`,
which is then assigned to the variable `number`.

On the second line something similar happens: `puts` expects to be handed a
value that it can then actually output to the screen. In order to pass that
value Ruby will first look at the right hand side, and evaluate the expression
`number`. Since this is a variable, the expression simply evaluates to the
value that was assigned to the variable on the first line.

In Ruby, variables are created the moment you use them, by way of assigning
something to them. You don't need to declare them as in other languages, which
is pretty convenient.

If you assign different values to the same variable, then assignments that
happen later will simply overwrite previous ones. Like so:

```ruby
number = 4
number = number * 3
puts number + 2
```

This, again, would output `14`. Let's walk through it:

* The first line assigns the number `4` to the variable `number`, creating that
  variable.
* The second line multiplies the value that is assigned to the variable
  `number` (which is `4`) by the number `3`, and then assigns the result (which
  is `12`) to the variable `number`.
* The third line adds the value `2` to the value assigned to the variable
  `number` (which is now `12`). The result of this operation (which is `14`) is
  then passed to `puts` which prints it out to the screen.

Of course, no one would actually write this exact code in practice since you can
simply do all this in just one line instead: `puts 2 + 3 * 4`. But sometimes
you'll find or write code that assigns an initial value to a variable, and then
keeps working on it for a few more lines. This sometimes is useful to break up
long lines, and make code more readable.

As mentioned earlier, Ruby has different kinds of variables. The kind of
variable used above is called a "local variable", and it's the one used most
often. You will learn about another type of variables later when we talk about
classes and objects.

On formatting: Note that there are spaces around the assignment operator `=`
as well as the arithmetical operators `+` and `*`.
