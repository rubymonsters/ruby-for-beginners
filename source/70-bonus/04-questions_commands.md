# Questions and commands

Generally speaking, methods play one of two roles: They either answer a question,
or they perform a command.

For example, if we have a `user` object, and users have a name, then we would
ask the user object for its name by calling the method `name`: `user.name`
would return the user's name. Arrays know their size (how many elements they
have), so we can ask an array: `[1, 2, 3].size` will return `3`.

Another example is the method `sort` on arrays. This method does not actually
sort the array that it is called on. Instead it returns a *new* array with the
same values, but in a sorted order:

```ruby
array = [3, 2, 1]
p array.sort
p array
```

This will output `[1, 2, 3]` and then `[3, 2, 1]`. So we see that the original
array is still the same.

Often questions need another bit of information passed. E.g., we can ask
a string *Do you start with this character?*, and we'll need to pass the
character that we are talking about: `"a string".start_with?("a")`. The answer
to this question will be `true`. Or if we ask an array if it includes a certain
element, then of course we need to pass that element, as in `[1, 2,
3].include?(1)`

The other role that a method can play is being responsible for executing a
certain command.

For example in Rails objects that can be stored to the database have a method
`save`. Of course, the purpose of this method is to save the object to the
database. E.g. `user.save` would save some changes that we've made to the user
before, like, maybe we have given them a new password.

Another example is the method `sort!` on arrays. Different from the method
`sort` (without an exclamation mark), this method tells the array to sort
itself:

```ruby
array = [3, 2, 1]
array.sort!
p array
```

If you run this code, then it will print out `[1, 2, 3]`: the array is now
sorted.

Another example for a method that is a command is the method `puts`. All it
does is print something to the screen, and it always returns `nil`.

Whenever you think about adding a new method to your code it makes sense to
think about the role the method should have. Is it a question? Or a command?
