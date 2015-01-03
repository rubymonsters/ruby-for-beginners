# Block return values

Remember that we said a block returns a value just like methods do?  So far, in
our two examples above, we did not do anything with the return values of the
block.

Here's an example that does that:

```ruby
p [1, 2, 3, 4, 5].collect { |number| number + 1 }
```

This will take the array of numbers, and transform it into another array. It
does that by calling the method `collect` on the original array, which calls
the given block for each of the elements, and collects each of the return
values returned by the block. The resulting array is then returned by the
method `collect`, and printed to the screen.

In other words, the method `collect` uses the block as a transformer. It takes
each element of the array, passes it to the block in order to transform it
to something else, and then keeps all the transformed values in a *new* array
that the method `collect` then eventually returns.

(Note that the method `collect` has an alias, which is `map`. These are exactly
the same methods. Many programmers prefer `map` over `collect` because it is
shorter, and also more commonly used in other languages. However, in our study
groups we use `collect` more often, because it simply expresses more clearly
what the method does.)

Here's another example that uses the return value of the block, can you guess
what it does?

```ruby
p [1, 2, 3, 4, 5].select { |number| number.odd? }
```

In this case, the method `select` uses the block in a different way: as a
filter, or criterion, to select values out of the array, and then return a new
array with the selected values.

Let's walk through this step by step, under the microscope:

* We create an array `[1, 2, 3, 4, 5]`.
* We then call the method `select` on it, and pass our block.
* Now, the method `select` calls our block for each of the numbers, and it
  will keep those numbers for which the block returned something truthy.
* It first calls the block passing the number `1`.
* We now are inside the block, and a local variable is assigned the value
  that was passed as an argument, which is the number `1`.
* Our block now calls the method `odd?` on this number, and of course, because
  `1` is odd, this will return `true`.
* Since this is the only, and thus, last statement in the body of our block,
  our block also will return `true` to the method `select`. `select` therefor
  will *keep* the number `1`.
* It then calls the block, passing the number `2`. Of course, because this
  is not an odd number, the method `odd?` and therfor our block will return
  `false` back the the method `select`. There for it discards this element.
* It keeps doing this for each of the remaining values, and eventually
  have this array: `[1, 3, 5]`
* The method `select` then returns this array and Ruby will pass this return
  value to the method `p`, which prints the array out to the screen.

Thus, the code above prints out `[1, 3, 5]`.

Here's another example of a method that uses the block as a criterion:

```ruby
p [1, 2, 3, 4, 5].detect { |number| number.even? }
```

Again, `detect` will pass each of the elements of the array to the block, one
by one, and check the return value of the block. However, as soon as the block
returns something truthy, the method `detect` will return the current object
itself. Therefor, this will print out `2`: the first number in the array
that is even.

In Ruby there are a lot more methods that accept blocks, and they do very
different things.

However, they have one thing in common: By the way of accepting a block, from
you as a programmer, the method can pass control to you. This principle is
called "inversion of control".

For example, instead of having to define lots of methods like `select_odd`,
`select_even`, `select_lesser_than`, `select_greater_than` and so on, defining
one method per potentially useful criteria, Ruby only has to implement one
single, generic method for arrays: `select`. That way Ruby can let you, as a
programmer, take over control, and allow you to specify the criterion is used
to select elements in any way you like.

Methods on arrays and hashes that take a block are also called iterators.
We say they "iterate over the array", meaning that these methods take each
element of the array and do something with it.

