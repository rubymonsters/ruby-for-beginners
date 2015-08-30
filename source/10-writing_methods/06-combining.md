# Combining Methods

We've discussed how to define a method, and how to call (use) it.

What if one method is not enough? What if methods need to do more complicated
things?

Easy. We can call methods from other methods.

For example, we could re-write ("re-implement") our method `add_two` using
another method `add_one`, and simply call it twice:

```ruby
def add_one(number)
  number + 1
end

def add_two(number)
  number = add_one(number)
  add_one(number)
end

puts add_two(3)
```

This would output `5` just like our previous examples. Do you understand how it
works?

Of course, in Ruby we could also just solve this whole thing with simply using
the `+` operator.

However, for the sake of the example, let's have a look how we could add a method
that does the exact same thing as the `+` operator, too:

```ruby
def sum(number, other)
  number + other
end
```

We can now use that method like so:

```ruby
puts sum(3, 2)
```

Which, again, would output `5`.

Note that in this example our method `sum` now takes two arguments, and so,
when we call (use) it, we also need to pass two numbers (i.e. add them inside
the parentheses on the last line).

Now, with this method in place we could change ("refactor") our previous methods
to use it:

```ruby
def sum(number, other)
  number + other
end

def add_one(number)
  sum(number, 1)
end

def add_two(number)
  sum(number, 2)
end

puts add_one(3)
puts add_two(3)
```

Again, these examples are not super realistic, as we'd probably just use the
`+` operator in the first place, in practice.

However, we think this nicely demostrates how you can use one method from
another ... and how different methods require different numbers of arguments.

We'll look at a more realistic example in the next chapter.
