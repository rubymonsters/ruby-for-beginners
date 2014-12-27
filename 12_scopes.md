# Scopes

*Spheres of visibility, like rooms in a house*

When we talked about variables we have mentioned that the most common type of a
variable is the "local variable", without explaining any further why they are
local. Local to what? Where?

Since we have now talked about methods, we can also discuss another important
concept: scopes.

Wikipedia says: "In programming, the scope of a name is the part of a program
where the name is valid: where the name can be used to refer to something
else." (slightly modified to use our own terminology)

You can think about a scope as of a sphere, a bubble, or a room (with no
windows, and doors closed): Certain names, like variable names, are "known" and
"visible" inside of the room. Other names, know and visible in other rooms are
not known in this room, but only in the other room.

Every time there is a method call, and the flow of execution enters the
method's block, it enters a new scope, or "room". Things that are "local" to
this method's scope (i.e. things that are "inside" of the room), are *only*
visible in this scope. Outside of it, they are unknown.

Consider this code:

```
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
local variable `number` is therefor not know, and Ruby raises an error saying
`undefined local variable or method 'number'`.

If you think about this error message for little bit, does it make sense to
you?

We have silently skipped over the fact that, in Ruby, both local variable
names and method names, are written the same way: they're just plain words.
For example, here:

```
number = 2
puts number
```

`number` is a local variable, and it is used in the line `puts number`.

However, here:

```
def number
  2
end
puts number
```

`number` is the name of a method. And it can be used (called) in the exact same
way: `puts number`

This is because Ruby, when it executes a program, evaluates one statement after
another and when it encounters a plain word like `number` then it will first
check if, within the current scope, it knows a local variable with the same
name. If so, it will use the value that is associated to this variable. If
there's no local variable with this name, then it will look for a method. If
there's also no method with this name it will then raise the error message
`undefined local variable or method `number'`.

Makes sense?

Let's look at another example.

```
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

Instead, when the flow of execution enters the method `add_to` Ruby will create
a new empty local scope, and it will define a new local variable `number` which
gets the number `3` assigned that was passed to the method. This new variable
`number` is *local* to the method's scope, and therefor is a different variable
than the one on the very first line, in the outer scope.

We found the following a good metaphor for scopes:

When Ruby enters a method, then that's like it enters a shiny, new, empty room
in a house. With her, she brings the objects that are passed as arguments to
the method call. In the example above it brings an object that is number `3`.

Now, as soon as Ruby enters the method, it sticks post-it notes on the objects,
according to the argument list from the method definition. In our example that
is the argument name `number`. From now on, in this room, there's a known local
variable that has a value assigned: The number `3` with the post-it note
`number` on it.
