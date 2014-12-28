# Blocks

*A method, but without a name*

Blocks are one of the things programmers absolutely love about Ruby. They are
an extremely powerful feature that allows us to write very flexible code. At
the same time, they read very well, and they are used all over the place.

However, blocks are also a language feature that take a little while to get
used to. Often times they are one of the hardest thing to understand for
programmers that come from languages that do not have blocks.

So, what is a block?

A block, essentially, is the same thing as a method, except they do not have a
name: That means a block is a piece of code, it can accept input in form of
arguments, and it will return a value, but it does not have a name.

Moreover, blocks can only be created by the way of passing them to a method
when the method is called.

Let's have a look at an example:

```ruby
5.times do
  puts "Oh, hello from inside a block!"
end
```

As you can see `times` is a method that is defined on numbers: `5.times` calls
the method `times` on the number `5`. Now, when this method is called the only
thing passed is this anonymous piece of code between `do` and `end`. There are
no objects passed as arguments, instead it passes a block.

The method `times` is implemented in such a way that it simply calls the block
5 times, and thus, when you run the code, it will print out the message `"Oh,
hello from inside a block!"` 5 times.

The code almost reads like an English sentence "Five time do output this
message", right? It does, and that's one of the reasons why Rubyists love
blocks so much.

One of the things that seem rather hard to grasp about blocks is that

* First, they are anonymous chunks of code.
* Second, they are passed to methods just like other objects.
* And third, they still can be called (just like methods), from inside the
  method that it was passed to.

Does that make sense?

Imagine you are the object that represents the number `5`. You are a number and
you do know your own value.

Now I hand you a piece of paper saying: `Please print the following on the
screen: "Oh, hello!"`, and I ask you to execute this instruction as many times
as the value that you know.

You'd go ahead and follow the instructions on the paper, and thus print out the
message, 5 times, because `5` is the value that you know.

This is roughly how the method `times` on numbers works, and how blocks work.

To summarize: Methods can not only accept input in the form of objects passed
as arguments.  They can also accept this one special piece of input, which is
an anonymous block of code. And they can then call (execute) this block of code
in order to do something useful with it.

##### Alternative syntaxes

Next to the syntax above, using `do` and `end`, Ruby comes with an alternative
syntax, which uses curly braces for defining a block.

These two statements do exactly the same:

```ruby
5.times do
  puts "Oh, hello!"
end

5.times { puts "hello!" }
```

So when do you use one or the other? In the Ruby community there's a convention
to use curly braces, if you have a single line block, and it fits on the same
line (as, in our example, it does). Whenever you need to have more than one
line in your block, then you use the syntax using `do` and `end`. Sometimes
people also would use the `do` and `end` syntax when they feel it makes the
code more readable.


##### Block arguments

Blocks make even more sense on methods that are defined on collections like
arrays and hashes. Let's have a look at some examples with arrays.

In our example above our block did not accept an argument. A block that accepts
an argument looks like this:

```ruby
[1, 2, 3, 4, 5].each do |number|
  puts "This is the number #{number}."
end
```

And, again, this is the same as:

```ruby
[1, 2, 3, 4, 5].each { |number| puts "This is the number #{number}." }
```

It is unknown to us why Matz has chosen to not enclose the argument list of
a block with round parentheses just like method argument lists. Instead, Ruby
wants us to use vertical bars (we call them "pipes").

So, for blocks, `do |number|` is the same that is `def add_two (number)` for a
method definition, except that the method also wants a name while a block is
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


##### Block return values

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

Let's walk through this step by step:

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
  will keep the number `1`.
* It then calls the block, passing the number `2`. Of course, because this
  is not an odd number, the method `odd?` and therfor our block will return
  `false` back the the method `select`. There for it discards this element.
* It keeps doing this for each of the remaining values, and eventually
  have this array: `[1, 3, 5]`
* The method `select` then returns this array and Ruby will pass this return
  value to the method `p`, which prints the array out to the screen.

In Ruby there are a lot more methods that accept blocks, and they do very
different things.

However, they have one thing in common: By accepting a block from you as a
programmer, the method can pass control to you. This principle is called
"inversion of control".

For example, instead of having to define lots of methods like `select_odd`,
`select_even`, `select_lesser_than`, `select_greater_than` and so on, defining
one method per potentially useful criteria, Ruby only has to implement one
single, generic method for arrays: `select`. Ruby can let you, as a programmer,
take over control, and allow you to specify the criteria that is used to select
elements in any way you like.
