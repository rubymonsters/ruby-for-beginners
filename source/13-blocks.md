# Blocks

*Like methods, but without a name*

Blocks are one of the things programmers absolutely love about Ruby. They are
an extremely powerful feature that allows us to write very flexible code. At
the same time they read very well, and they are used all over the place.

So, what is a block?

A block, essentially, is the same thing as a method, except it does not have a
name, and does not belong to an object.

I.e. a block is an anonymous piece of code, it can accept input in form of
arguments (if it needs any), and it will return a value, but it does not have a
name.

Moreover, blocks can only be created by the way of passing them to a method
when the method is called.

<p class="hint">
A block is a piece of code that accepts arguments, and returns a value. A block
is always passed to a method call.
</p>

Let's jump right in:

```ruby
5.times do
  puts "Oh, hello from inside a block!"
end
```

As you can see `times` is a method that is defined on numbers: `5.times` calls
the method `times` on the number `5`.

Now, when this method is called the only thing passed is a block: that is the
anonymous piece of code between `do` and `end`. There are no objects passed as
arguments to the method `times`, instead it just passes a block.

The method `times` is implemented in such a way that it simply calls (executes)
the block 5 times, and thus, when you run the code, it will print out the
message `"Oh, hello from inside a block!"` 5 times.

The code almost reads like an English sentence *Five times do output this
message*, right? It does, and that's one of the reasons why Rubyists love
using blocks.

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
message. You repeat this 5 times, because `5` is the value that you know.

This is pretty much how the method `times` on numbers works, and how blocks
work: `times` takes the block (the instructions), and runs it as many times
as the value of the number.

To summarize: Methods can not only accept input in the form of objects passed
as arguments.  They can also accept this one special piece of input, which is
an anonymous block of code. And they can then call (execute) this block of code
in order to do useful things with it.

Let's look at some other aspects of how blocks work next.
