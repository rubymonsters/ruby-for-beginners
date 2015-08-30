# Return values

In Ruby, a method always return exactly one single thing (an object).

The returned object can be anything, but a method can only return one thing,
and it also *always returns something*.

<p class="hint">
Every method always returns exactly one object.
</p>

The object returned could be the object `nil`, meaning "nothing", but it still
is an object.  Also, in order to return a bunch of things at once we could
return an Array that holds the things that we are interested in, but the Array
itself is just one object.

Also note that in Ruby we do not have to use the statement `return`, as in
other languages. In fact, most Ruby code does not use the keyword `return` at
all.

This is extremely convenient, but it is also something we need to learn:

If we don't do anything else, then a method will return *the value that was
returned from the last evaluated statement*. Most often, this is the last line
in the method body.

This is important to understand. Please read that sentence again:

<p class="hint">
If we don't do anything else, then a method will return the return value of
the last evaluated statement.
<p>

In our example method ...

```ruby
def add_two(number)
  number + 2
end

p add_two(3)
```

... the last evaluated statement is the expression `number + 2`. Since in our
example `number` is assigned `3` this expression returns the number `5`, and
that is why the value returned by our method also is `5`.

If, in certain cases, we do want to "return" from the method early, then we can
still do this using the `return` statement. For now, you don't need to worry
about this case.

So, let's move on :)
