# Bang Methods

All of the examples that we've discussed before have one thing in common:

They are questions, and do not modify the object they are called on.

For example:

```ruby
name = "Ruby Monstas"
puts name.downcase
puts name
```

This will output:

```ruby
ruby monstas
Ruby Monstas
```

As you can see the method `downcase` has returned a new String, which is the
lowercase version of the String that the method is being called on. When we
output the original String on the next line, we can then see that it's still
the same: The method `downcase` does not modify the String.

However, there also are variants of some of these methods, which end in an
exclamation mark `!`. These methods are called "bang methods", and they usually
modify the object that they're being called on.

<p class="hint">
Bang methods end with an exlamation mark, and often modify the object they are called on.
</p>

For example, next to the method `downcase` Strings also have a method `downcase!`.

Let's try that:

```ruby
name = "Ruby Monstas"
puts name.downcase!
puts name
```

This will output:

```ruby
ruby monstas
ruby monstas
```

As you can see calling the method `downcase!` on the second line has modified
the String itself (the object that `name` refers to), and *also* returned the
new downcased version.

Nowadays programmers have learned that using these methods has a number of
disadvantages, and usually should be avoided, unless there are very good
reasons for it (usually, there are none).

<p class="hint">
Use bang methods with caution.
</p>

We mostly mention these methods because you might see them used elsewhere.
