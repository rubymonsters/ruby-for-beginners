# Block arguments

Blocks make even more sense on methods that are defined on collections like
arrays and hashes. Let's have a look at some examples with arrays.

In our example above our block did not accept an argument. A block that accepts
an argument looks like this:

```ruby
[1, 2, 3, 4, 5].each do |number|
  puts "Number #{number} was passed to the block"
end
```

And, again, this is the same as:

```ruby
[1, 2, 3, 4, 5].each { |number| puts "Number #{number} was passed to the block" }
```

It is unknown to us why Matz has chosen to not enclose the argument list of
a block with round parentheses just like method argument lists. Instead, Ruby
wants us to use vertical bars (we call them "pipes").

So, for blocks, `do |number|` is the same that is `def add_two (number)` for a
method definition, except that the method wants a name while a block is
anonymous.

Now, when you run the code example above, you'll see the message printed out
for each of the numbers contained in the array. Does that make sense? Again,
this code almost reads like an English sentence: "With this array for each of
its elements, naming it `number`, output the following message".

`each` is a method defined on arrays, and it does just this: For each of the
elements in the array, it calls the block, and passes the element as an
argument to the block. The block can then do whatever you like it to do with
the element. In our case we interpolate it into a string and print it out to
the screen.
