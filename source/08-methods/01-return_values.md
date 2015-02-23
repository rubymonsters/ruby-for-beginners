# Return values

In Ruby, methods always return exactly one single thing (an object).

The returned object can be anything, but a method can only return one thing,
and it also *always returns something*. In order to return a bunch of things
at once we can return an array that holds the things that we are interested in
(but the array itself is just one object).

Also, in Ruby we do not have to use the statement `return`, as in other
languages. This is extremely convenient, but it is also something we need to
learn:

If we don't do anything else, then a method will return the value that was
returned from the last evaluated statement. Most often, this is the last line
in the method body.

This is important to understand. Please read that sentence again:

If we don't do anything else, then *a method will return the value that was
returned from the last evaluated statement*.

In our example method

```ruby
def add_two(number)
  number + 2
end

p add_two(3)
```

the last evaluated statement is the expression `number + 2`. In our example
this expression returns the number `5`, and that is why the value returned by
our method also is `5`.

If, in certain cases, we do want to "return" from the method early, then we can
still do this using the `return` statement. For now, you don't need to worry
about this case.
