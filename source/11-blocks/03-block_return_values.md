# Block return values

Remember that we said a block returns a value just like methods do?  So far, in
our two examples above, we did not do anything with the return values of the
block.

Here's an example that does that:

```ruby
p [1, 2, 3, 4, 5].collect { |number| number + 1 }
```

This will take the array of numbers, and transform it into *another* array.

It does this by calling the method `collect` on the original array, which calls
the given block for each of the elements, and collects each of the return
values returned by the block. The resulting array is then returned by the
method `collect`, and printed to the screen.

In other words, the method `collect` uses the block as a transformer. It takes
each element of the array, passes it to the block in order to transform it
to something else, and then keeps all the transformed values in a *new* array
that the method `collect` then eventually returns.

Note that the method `collect` has an alias, which is `map`. These are exactly
the same methods. Many programmers prefer `map` over `collect` because it is
shorter, and also more commonly used in other languages. However, in our study
groups we use `collect` more often, because it simply expresses more clearly
what the method does.

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
* We then call the method `select` on it, and pass our block as a filter
  criterion.
* Now, the method `select` calls our block for each of the numbers.
* It first calls the block passing the number `1`.
* We now are inside the block, and a local variable `number` is assigned the
  object that was passed as an argument, which is the number `1`.
* Inside our block we now call the method `odd?` on this number, and of course,
  because `1` is odd, this will return `true`.
* Since this is the only, and thus, last statement in the body of our block,
  our block also returns `true` to the method `select`. `select` therefore will
  *keep* ("select") the number `1`.
* It then calls the block again, this time passing the number `2`. Of course,
  because this is not an odd number, the method `odd?` and therfore our block
  will return `false` back the the method `select`. Therefore it *discards* this
  element.
* It keeps doing this for each of the remaining elements in the array, and
  eventually has this array: `[1, 3, 5]`
* The method `select` then returns this array and Ruby will pass it to the
  method `p`, which prints the array out to the screen.

Thus, the code above prints out `[1, 3, 5]`.

Here's another example of a method that uses the block as a criterion:

```ruby
p [1, 2, 3, 4, 5].detect { |number| number.even? }
```

Again, `detect` will pass each of the elements of the array to the block, one
by one, and check the return value of the block. However, as soon as the block
returns something truthy (something that is "equivalent to true"), the method
`detect` will return the current object itself. Therefore, this will print out
`2`: the first number in the array that is even.

In Ruby there are a lot more methods that accept blocks, and they do very
different things.

However, they have one thing in common: By accepting a block, from
you as a programmer, the method can pass control to you. This principle is
called "inversion of control".

For example, instead of having to define lots of methods like `select_odd`,
`select_even`, `select_lesser_than`, `select_greater_than` and so on, defining
one method per potentially useful criterion, Ruby only has to implement one
single, generic method for arrays: `select`, allowing you to flexibly specify
the criterion in form of Ruby code: by passing a block to the
method. That way Ruby lets you, as a programmer, take over control, and specify
what is used as a criterion to select elements.

Methods on arrays and hashes that take a block are also called iterators.
We say they "iterate over the array", meaning that these methods take each
element of the array and do something with it.

In Ruby iterators are "chainable", adding functionality on top of each other.
That means that, if you do not pass a block to an iterator method, such as
`each`, `collect`, `select`, then you'll get an iterator object back. You can
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

For the first iteration it will call the block with `1` and `0`, since `0` is
the first "position", that is, index. It therefore returns `1`. For the second
iteration it calls the block with `2` and `1`, and returns `3`, and so on.




