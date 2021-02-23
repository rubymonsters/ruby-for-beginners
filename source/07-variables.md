# Variables

*Naming things*

In order to refer to the "things" (objects) that our program deals with we want
to assign names to them.

Every practical programming language has a feature to do this, called
variables. This is basically the same concept that you might know from math,
although in Ruby there are different kinds of variables (you will get to know
another one in a couple chapters).

We'll discuss this concept quickly because you already need to know it in the
next chapter, and the respective exercises.

If some of this seems rather abstract to you, don't fret. It will become very
practical, and you won't even think a lot about it any more, as soon as you
actually work with variables while learning other things.

Alright. Let's jump right in:

In Ruby you can assign a name to something (an object) by using the so called
assignment operator `=`. Like so:

```ruby
number = 1
```

This will *assign* the name `number` to the "thing" (object) that is the number
`1`. From now on we can refer to this object by using the name `number`. For
example the following code would output the number `1`:

<p class="hint">
A name on the left side of the assignment operator <code>=</code> is assigned
to the object on the right side.
</p>


```ruby
number = 1
puts number
```

One important thing to note here is that a variable is not a "thing" (an object)
by itself. Instead it's just a *name* for an actual object. In our example the
number `1` is an object, while `number` is a name for it because we've assigned
it.

<p class="hint">
A variable itself is not a "thing". It's just a name for a thing (an object).
</p>

You can think of it like a post-it note with the name `number` written on it,
and stuck on the actual thing, which is an object (in this case, a number).

Imagine you were in the middle of learning some Spanish, and sticked post-its
onto things in your apartment: the name *nevera* onto the refrigerator, *cama*
onto your bed, and *puerta del baño* onto the bathroom door.

Now, whenever you use one of these terms, as in *abrir la nevera* (open the
refrigerator) in order to learn the language and rehearse vocabulary, you'll
obviously refer to the object, and open its actual, physical door.

That's pretty much how variable assignment works in Ruby. There's a "thing",
the object on the right side of the assignment operator `=`, and the name on
the left side is being assigned to it.

Whenever we use a variable name that has been defined before we refer to the
actual object that it has been assigned to. E.g. on the second line of the
code example above `number` refers to the actual object, the number `1` that
it has been assigned to on the first line. Therefore `puts number` outputs
the number.

<p class="hint">
You can pick whatever variable names you want, they're just names, like post-it
notes stuck onto actual objects.
</p>

Since names are just names, the following examples would do exactly the same:

```ruby
a = 1
puts a

large_number = 1
puts large_number

apples = 1
puts apples
```

However, also note that it makes sense to try and pick names that reveal your
intention. The chapter <a href="/bonus/good_names.html">Using the right
words</a> at the end of this book will talk more about this. Feel free to jump
ahead if you are curious. In short, the first example using `a` as a name would
be frowned upon because it's wasting the opportunity to use a meaningful name.
The second and third examples are just trying to be stupid, and pick names that
don't match the "thing" (the object, number `1`) at all.

There are a two more things about variable assignments that we'd like to
point out before we move on.

