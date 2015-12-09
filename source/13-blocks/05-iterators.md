# Iterators

Methods on arrays and hashes that take a block are also called iterators.

We say they *iterate over the array*, meaning that these methods take each
element of the array and do something with it.

In Ruby iterators are "chainable", adding functionality on top of each other.

That means that, if you do not pass a block to an iterator method, such as
`each`, `collect`, `select`, then you'll get an *iterator object* back. You can
then call more methods on these iterator objects, and finally pass a block.
Like so:

```ruby
numbers = [1, 2, 3, 4, 5].collect.with_index do |number, index|
  number + index
end
p numbers
```

This will print out:

```
[1, 3, 5, 7, 9]
```

What's going on here?

The method `with_index` can be called on any iterator object. All it does is
pass the index of the element within the array to the block, as a second block
argument, in addition to the element itself.

Inside of the block we can then use it, and add the index to the number itself.

So for the first iteration it will call the block with `1` and `0`, since `0` is
the first "position", that is, index. It therefore returns `1`. For the second
iteration it calls the block with `2` and `1`, and returns `3`, and so on.

Therefor the method call eventually returns the array `[1, 3, 5, 7, 9]`.

<p class="hint">
Iterators in Ruby are chainable.
</p>


