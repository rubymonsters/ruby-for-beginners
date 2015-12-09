# Block arguments

Blocks make a lot of sense on methods that are defined on collections like
arrays and hashes.

Let's have a look at some examples with arrays.

In our previous example that used the method `times` our block did not accept
an argument. A block that accepts an argument looks like this:

```ruby
[1, 2, 3, 4, 5].each do |number|
  puts "#{number} was passed to the block"
end
```

And, again, this is the same as:

```ruby
[1, 2, 3, 4, 5].each { |number| puts "#{number} was passed to the block" }
```

It is unknown to us why Matz has chosen to not enclose the argument list of
a block with round parentheses just like method argument lists. Instead, Ruby
wants us to use vertical bars (we call them "pipes").

So, for blocks, `do |number|` is the same that is `def add_two (number)` for a
method definition, except that the method wants a name while a block is
anonymous: `|number|` and `(number)` both are argument lists. The first one
is used for blocks, the second one for methods.

<p class="hint">
Block arguments are listed between pipes <code>|</code>, instead of parentheses.
</p>

Now, when you run the code example above, you'll see the message printed out
for each of the numbers contained in the array.

Does that make sense? Again, our code almost reads like an English sentence:

*With this array for each of its elements, naming it `number`, output the
following message.*

The method `each` is defined on arrays, and it does just this:

It takes each of the elements in the array and calls the block, passing the
element as an argument. The block can then do whatever you want it to do with
the element. In our case we interpolate it into a string and print it out to
the screen.
