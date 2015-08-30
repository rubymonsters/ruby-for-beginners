# Reusing variable names

It is also important to keep in mind that a name is unique, in the sense that
the same name can only be assigned to one value (object) at a time.

In other words, if you assign different values to the same variable, then
assignments that happen later will simply overwrite previous ones. Like so:

```ruby
number = 4
number = number * 3
puts number + 2
```

This, again, would output `14`.

<p class="hint">
Variable names can be re-used, and re-assigned.
</p>

The first line assigns the name `number` to the number `4`. The second line
re-assigns it to another object.

Getting back to our post-its metaphor ... this would stick a post-it with the
name `number` on one thing, and then later take it off of it, and stick it on
something else.

Let's look at it under the microscope:

* On the **first line** Ruby creates the number (object) `4`.
* It then assigns the name `number` to it (sticks a post-it onto it).
* On the **second line**, Ruby first looks at the stuff on the right side,
  and evaluates the expression `number * 3`. Doing so it will create
  the number (object) `3` and multiply it with the object that currently has
  the name `number`, which is `4`. This operation results in a new number
  (object) `12`.
* Now Ruby is finally ready to stick the name `number` on the result `12`.
  I.e. *from now on* the name `number` refers to a different object, which is
  `12`.
* On the **third line** Ruby will, again, first look at the expression `number + 2`
  on the right. It creates the object `2` and adds it to the object that currently
  has the name `number`. This results in a new number (object) `14`.
* Finally Ruby passes this object `14` to `puts`, which outputs it to the
  screen.

Of course, you would probably never actually write this exact code in practice
since you can simply do all this in just one line instead: `puts 4 * 3 + 2`.

However, sometimes you'll find or write code that assigns an initial value to a
variable, and then keeps working on it for a few more lines. This sometimes is
useful to break up long lines, and make code more readable.

<p class="hint">
Using variable names can be useful to break up long lines and make code more
expressive and readable.
</p>

Also, Ruby has different kinds of variables.

The kind of variable that we've introduced so far is called a *local variable*,
and it's the one used most often. You will learn about another type of
variables later when we talk about classes and objects.

<p class="hint formatting">
On formatting: Note that there are spaces around the assignment operator `=`
as well as the arithmetical operators `+` and `*`.
</p>

