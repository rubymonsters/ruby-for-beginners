# Flow of execution

Feel free to skip this chapter if you feel you understand the flow of
how Ruby goes through a program, defines a method, then calls it, returns
from it, maybe calls another method and so on. We've discussed this
[before](/writing_methods.html). But since this is a confusing topic
to some, we'll also go over it again.

One of the things that we, as programmers, have assimilated so much that we
forget to explain to beginners is how, and in what exact order, Ruby goes
through your program. This is called the "flow of execution", or "control
flow".

When you execute a Ruby file with the `ruby` runtime then it will read your
Ruby code and start executing it line by line, from top to bottom.

Let's look at our example from above, and how the Ruby control flow goes
through it under the microscope.

For convenience we've now added line numbers, like your editor does. We have
also added parentheses for the method call to `puts`, to make this more
obvious, even though in practice we recommend against this:

```ruby
1 | def add_two(number)
2 |   number + 2
3 | end
4 |
5 | puts(add_two(3))
```

Ruby starts on line 1, and finds our method definition, starting with the
keyword `def`, so it will read all of it, until it finds the keyword `end` on
line 3. For now it does nothing but define this method, and keep it in memory
so it can be used from now on.

Now, on line 5, Ruby finds that we are using the word `puts`, and it sees that
we are trying to pass something to it, so this must be a method call.

In order to call a method Ruby needs to first evaluate the values that we want
to pass. So Ruby now looks at what's between the parentheses, and finds another
method call `add_two(3)`.

Again, in order to actually call the method `add_two` Ruby needs to first
evaluate the values that we want to pass.

In this case this is the number `3`, so Ruby will create this object (an
instance of the class `Fixnum`). Now it is finally ready to actually call the
method `add_two`, passing the number just created.

Now, for the first time, Ruby starts to deviate from the default flow of
execution, which simply goes from top to bottom. Instead, since we are calling
a method, Ruby now enters the method body that we have defined for the method
`add_two` before: the control flow now jumps to line 2.

In this moment, since we are entering a method that has an argument, Ruby
also defines a local variable `number`, and assigns the object that was
passed, the number `3`, to this variable.

Now Ruby is ready to evaluate line 2. It finds that we are using the operator
`+`, on the value that is assigned to the variable `number`, which is `3`. In
order to do that Ruby first evaluates the thing that is on the right hand side
of the operator, which in our example, again, is a number. Ruby will therefore
create the number (an instance of the class `Fixnum`), this time with the value
`2`.

Ruby is now ready to evaluate the operator, and add the number `2` to the
number `3`. This operation returns a new number (an instance of the class
`Fixnum`), which is `5`.

Ruby recognizes that the method body has ended, and so it returns from the
method `add_two`, with the return value `5`, because this was *the return value
of the statement that was evaluated last*.

This is now the second time that Ruby makes a jump: the control flow jumps
back to line 5. Ruby is now done evaluating the method call `add_two(3)`, and
this method call has returned the object `5`. Ruby can now finally call the
method `puts` passing the object `5`, which it will then print out.
