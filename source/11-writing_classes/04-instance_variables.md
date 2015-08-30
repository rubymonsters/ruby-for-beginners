# Instance variables

*An object's own knowledge*

Now that you understand how the string that we pass to the method `new`
ends up being passed to the new object's `initialize` method, we can start
improving `initialize`, so it does something with the string, and actually
*initializes* our new object:

```ruby
class Person
  def initialize(name)
    @name = name
  end
end
```

This introduces another new concept: `@name` is a new type of variable, called
an "instance variable".

The body of the `initialize` method now does nothing else but assign the value
of the local variable `name` to an instance variable `@name`.

You remember how we said that each method has its own local scope, which is
created when the method is called, and populated with local variables from the
arguments list. You have also learned that this scope is erased, and thrown
away when Ruby exits the method body and returns from the method. And that
local variables that are visible in one method are not visible in other
methods: that's why they are called local.

Now, the thing is: Every *object* also has its own scope.

An object's scope is populated with instance variables, in the moment we assign
something to them. And they are visible *everywhere* in the object, that is, in
every method that the object has.

<p class="hint">
Instance variables live in, and are visible everywhere in the object's scope.
</p>

You can think of the object's scope as your own knowledge, or memories.

For example, you know your name, your email address, and your email password.
You keep this knowledge around, and you can use it when you do things (such as
responding to another person). Likewise, an object keeps its instance variables
around, as long as the object exists.

Ok, let's see how that works in practise.

If you create, and output an instance of our class `Person`, you'll see that
Ruby now prints out the instance variable, too:

```ruby
person = Person.new("Ada")
p person
```

The first line creates a new instance of the class `Person`, passing the string
`"Ada"`, and assign this new object to the variable `person`. The second line
will then print it out:

```
#<Person:0x007fd8947aa868 @name="Ada">
```

As you can see this includes the instance variable `@name` with the value
`"Ada"`: This specific, concrete instance of the class `Person` knows their
name.

You can think of this as you, as a programmer, creating this new person, and
in the moment of its creation, its birth, you also give it a name. Which kind
of how it works with real people, too, isn't it?

Hmm, well ... Yeah, sort of. Anyhow, let's move on.
