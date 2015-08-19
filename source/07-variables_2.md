# More on Variables

You've seen above how you can name things in Ruby by assigning them to a
variable:

```ruby
a = 1
```

This assigns the name `a` to the object that is `1`. You could also say:
The object `1` is being assigned to the variable `a`.

There are a couple more things about variable assignments that we'd like to
point out:

## Things on the right go first

Note that, just as in traffic (well, at least in
[most parts of the world](https://en.wikipedia.org/wiki/Right-_and_left-hand_traffic)),
things on the right side go first :)

In order to assign the thing on the right side to the name on the left side,
Ruby first needs to figure out the thing on the right. As you will see later
the same is true for many other expressions in Ruby.

In our example above it will first create the object that is the number `1`,
and then assign it to the name `number`. The following example makes that more
clear:

```ruby
number = 2 + 3 * 4
puts number
```

On the first line Ruby will first look at the expression `2 + 3 * 4`, which
will result in the number (object) `14`. Ruby will *then* assign the name
`number` to this object.

Again, on the second line Ruby will then pass the thing with the name `number`
(which is `14`) to `puts`, which will output it to the screen.

In practice, we don't say "we give the name `number` to the result".  Instead
we usually say that we "assign the result to the variable `number`". From then
on we can say that "the variable number is assigned the value 14".

## Reusing names

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

Of course, no one would actually write this exact code in practice since you can
simply do all this in just one line instead: `puts 2 + 3 * 4`.

However, sometimes you'll find or write code that assigns an initial value to a
variable, and then keeps working on it for a few more lines. This sometimes is
useful to break up long lines, and make code more readable.

<p class="hint">
Using extra variables can be useful to break up long lines and make code more
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
