# Arguments and parentheses

If you have read carefully, you may have noticed that we said about the code
`puts 5` that `puts` is a method call. And then later we've enclosed the value
`3` in parentheses when calling the method: `add_two(3)`.

That's right:

<p class="hint">
In Ruby, when you define or call (execute, use) a method, you can omit the
parentheses.
</p>

So these lines mean exactly the same:

```ruby
puts "Hello!"
puts("Hello!")
```

And so do these:

```ruby
add_two 2
add_two(2)
```

And all of these:

```ruby
puts add_two 2
puts add_two(2)
puts(add_two 2)
puts(add_two(2))
```

So when do you use parentheses, and when do you omit them?

There is no clear rule about this, but there are some conventions. For now,
you can just stick with the convention we are using at our study groups, which
is:

* Use parentheses for all method calls that take arguments, except for the
  methods `puts` and `p` (and later: `require` and `include`).
* If a method does not take any arguments, then do not add empty parentheses,
  omit them.

So the idiomatic way to write the line above is:

```ruby
puts add_two(2)
```

## Methods without arguments

Also, so far we've only mentioned that sometimes methods do not take any arguments.
But we haven't looked at an example so far.

Here's one:

```ruby
def greet
  puts "Oh, hello!"
end

greet
```

The first three lines define a method, and we've picked the name `greet` for it.
Again, the method body contains just a single line.

The last line consists of nothing but the word `greet`. When Ruby runs this code,
and it finds the word `greet` it will know that this refers to the method defined
earlier, and call it.

So Ruby jumps into the method body (this time it does not bring any objects with
it as arguments, because our method does not need any). It then executes the line
`puts "Oh, hello!"` which prints a greeting to the screen.

As you can see we do not use any parentheses here. We could do that. The following
code would be perfectly valid, and do exactly the same:

```ruby
def greet()
  puts "Oh, hello!"
end

greet()
```

However since we can omit the parentheses in this case we do just that. They
just add visual noise and make the code slightly less readable.

## Returning nil

Also, you might wonder what's going on with the return value our our `greet`
method. We just said that every method call always returns "something" (an
object).

That's right. The method call `greet` will return the object returned from the
last evaluated statement (which, in our case, is `puts "Oh, hello!"`).

What do you think that is?

The method `puts` always returns `nil` (because it was written that way): Its
purpose is to print something to the screen, not return something interesting.
It's a [command, not a question](/bonus/questions_commands.html). So the most
sensible choice for a return value is `nil`.

So where does the `nil` object go?

If you look at our example code you notice that we don't do anything with the
return value of the method call `greet`: We don't assign it to a variable. And
we don't pass it to another method call. In fact, we simply discard it since
we're not interested it in.

In our example that's just fine. In practice you should always be aware *why*
you are calling a certain method. Is it a command like *Please print this*?
Then you probably aren't interested in the return value and you can discard
it as we've done above. Or is it a more like a question *What's the result
when you add 2 to this number?* In that case obviously you want to use
the return value later.

For the sake of demonstrating that `puts` and `greet` indeed return `nil`
we can use `p` to inspect the return value like so:

```ruby
$ irb
> def greet
>   puts "Oh, hello!"
> end
> p greet
Oh, hello!
=> nil
```

Here we go. The `=>` thing in IRB signals that this is the return value. As you
can see it first prints the greeting (using `puts`) and then, after returning
from the method, outputs the `nil` value.
