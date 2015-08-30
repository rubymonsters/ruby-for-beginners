# Scopes

*Spheres of visibility, like rooms in a house*

When we talked about variables we mentioned that the most common type of
variables is the "local variable", without explaining any further why they are
local. Local to what? Where? We're finally ready to explain that more.

Since we have now talked about methods, we can also discuss another important
concept: scopes.

Wikipedia says: *"In programming, the scope of a name is the part of a program
where the name is valid: where the name can be used to refer to something
else."* (slightly modified to match our own terminology)

<p class="hint">
Names are known (or defined) in a certain scope, and unknown (or undefined)
outside of this scope.
</p>

You can think about a scope as of a sphere, a bubble, or a room (with no
windows, and doors closed): Certain names, like variable names, are "known" and
"visible" inside of the room. Other names, known and visible in another room are
not known in this room, but only in the other room.

Every time there is a method call, and the flow of execution enters the
method's body, it enters a new scope, or "room". Things that are "local" to
this method's scope (i.e. things that are "inside" of the room), are *only*
visible in this scope. Outside of it, they are unknown.

## Undefined local variable or method

This is also a good opportunity to talk about an error message that you
might see most often. E.g. you'll see it every time when you made a typo
and misspelled a variable or method name.

Consider this code:

```ruby
def add_two(number)
  number + 2
end

puts add_two(3)
puts number
```

The line `puts add_two(2)` will output `5`, but the line `puts number` will
then raise an error.

This is because the variable `number` that is assigned the number `3` when we
call the method is a *local* variable. It is local to the method's scope. It
is created when the flow of execution enters the method.

Outside of this scope, when the flow of execution has returned from the method
the method's scope has been destroyed, and all local variables are gone. The
local variable `number` is therefore not known, and Ruby raises an error saying
`undefined local variable or method 'number'`.

If you think about this error message for little bit, does it make sense to
you?

We have silently skipped over the fact that, in Ruby, both local variable
names and method names, are written the same way: they're just plain words.
For example, here:

```ruby
number = 2
puts number
```

`number` is a local variable, and it is used in the line `puts number`.

However, here:

```ruby
def number
  2
end
puts number
```

`number` is the name of a method. And it can be used (called) in the exact same
way: `puts number`

This is because Ruby, when it executes a program, evaluates one statement after
another. And when it encounters a plain word like `number` then it will first
check if, within the current scope, it knows a local variable with the same
name. If so, it will use the value that is associated to this variable. If
there's no local variable with this name, then it will look for a method. If
there's also no method with this name it will then raise the error message
`undefined local variable or method 'number'`.

So the error message is pretty precise, but also sounds kind of convoluted. What
it basically tries to say is:

*You've used the word "number" here, and i don't know it (in this scope). Did
you mean to use a local variable? Or a method?*

Does that make sense?

Back to the topic of local scopes. Let's look at another example:

```ruby
number = 1

def add_to(number)
  number + 2
end

puts add_to(3)
```

What do you think the output will be? Will it be `3`, or `5`? Something else?

If you run the code you will see that it's `5`.

The reason for that is that we do assign the number `1` in the outer scope to a
variable `number`, but this variable is then never used: the only other line in
the outer scope is the last line `puts add_to(3)`, and this line does not use
the variable `number`.

Instead, when the control flow enters the method `add_to` Ruby will create a
new local scope, and it will define a new local variable `number` which is
assigned the number `3` that was passed to the method. This new variable
`number` is *local* to the method's scope, and therefore this is a *different*
variable than the one on the very first line, in the outer scope.

We found the following a good metaphor for scopes:

When Ruby enters a method, it's like she enters a shiny new room in a
house. With her, she brings the objects that are passed as arguments to the
method call. In the example above she brings an object that is the number `3`.

Now, as soon as Ruby enters the method, she sticks post-it notes on the
objects, according to the argument list from the method definition. In our
example that is the name `number`. So from now on, in this room, there's a
known local variable that has a value assigned: The object (number) `3` with
the post-it note `number` on it.

In our example, the outer scope and the scope of the method `add_two`, are
two different rooms, and there are two different post-it notes stuck on
two different numbers, which just happen to have the same name on them.

