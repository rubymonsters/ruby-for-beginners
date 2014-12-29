# Methods

*A named block of code that takes input and returns output*

Everything in programming is about data, and doing interesting things with it.
If you think about Twitter, it essentially takes some 140 characters of text
(which is data) from users and displays it to other users.

You have already learned about some of the most important types of data in
Ruby: numbers and strings, as well as two structures that can be used to store
them: arrays and hashes. That's about the "data" part.

Methods are about the "doing interesting things" part. Methods are all about
encapsulating some bits of behaviour, so that it can be applied to different
bits of data easily. For example there methods that do things like: sorting an
array, reading a CSV file, sending an email, signing in on Facebook, sending
a Tweet.

There are four things that constitute a method:

* a name
* a block of code
* potentially accept some input
* returning some output

Not all methods actually want any input (because they don't need any), and not
always do we care about the output that a method returns.

Imagine a vending machine where you can chip in some money, press some buttons,
and the machine will spin a few gears and wheels and spit out the chocolate bar
you were after.

If the vending machine was a method, then your money, as well as the buttons
you press are the input. The way the machine internally spins certain mechanics
is the block of code. And the product that it dispenses is the return value.
Although this would be an odd thing to mention to a non-programmer, we could
say that a vending machine is a way to "transform" money and data into
chocolate.

Methods are a lot like that. They take some input, do something with it, and
return a result. Instead of using the term "input" in programming we say that
a method accepts a number of arguments. And instead of "output" we use the term
"return value": the thing that we get back from the method.

Let's define a simple method that takes a number, adds the number `2` to it,
and returns the result:

```ruby
def add_two(number)
  number + 2
end
```

This *defines* a method. It does not *use* it, yet. You only build and place
that vending machine, so it can be used later.

Let's walk through this method definition step by step:

* On the first line the keyword `def` tells Ruby that you are about to define a
  new method.
* The next word `add_two` is the name that we want this method to have.
* The parentheses tell Ruby that we are about to define an argument list.
* The arguments list, in our case contains one argument which we'd like to be
  know as `number`.
* The next line (indented by two spaces) is the block of code that the
  method encapsulates, also referred to as the "method body".
* And the keyword `end` tells Ruby that we"re done with the method body.

Now we can use (we say "call") this method like so:

```ruby
def add_two(number)
  number + 2
end

puts add_two(3)
```

* This will create an instance of the number `3`, and call the method we
  defined earlier `add_two`, passing the number to the method, as the argument
  `number`.
* When a method is used (called), then Ruby jumps into the method's body.
  So, we are now inside of the method body, and `number` is now a local
  variable with `3` assigned to it.
* Ruby will now execute the method body, which is the expression `number + 2`.
  Because `number` is assigned `3` (the value that we have passed to the method
  as an argument) this expression will evaluate to `5`.
* Since this line of code is the last line in the method body, the value `5`
  also will be returned from the method.
* We are now back outside of the method. The method call has returned the
  number `5`, and it will be passed to `puts`, which prints it to the screen.

On formatting: Note that

* There are no spaces before, and inside the parentheses that define the
  argument list.
* The method body is indented by exactly two spaces.
* The keyword `end` sits on the same level as the keyword `def`.


#### On return values

In Ruby, methods always return exactly one single thing (object). This thing
can be anything, but a method can only return one thing, and it also always
return something. In order to return a bunch of things from a method at once we
can return an array that holds the things that we are interested in (but the
array itself is just one object).

Also, in Ruby we do not have to use the statement `return`, as in other
languages. This is extremely convenient, but it is also something we need to
learn:

If we don't do anything else, then Ruby will return the value that was returned
from the last evaluated statement. Most often, this is the last line in the
method body.

This is important to understand. Please read that sentence again: If we don't
do anything else, then Ruby will return the value that was returned from the
last evaluated statement.

In our example above the last evaluated statement is the expression `number + 2`.
This statement returns the number `5`, and that is why the value returned by
our method also is `5`.

If, in certain cases, we do want to "return" from the method early, then we can
still do this using the `return` statement. For now, you don't need to worry
about this case.


#### On parentheses

If you have read carefully, you may have noticed that we said on the line
`puts number` above `puts` is a method call. And then later we've enclosed the
value `5` by parentheses when calling the method `add_two(3)`.

That's right. In Ruby, when you call (use) a method, you can omit the
parentheses. So these lines do exactly the same:

```ruby
puts "Hello!"
puts("Hello!")
```

And so do these:

```ruby
add_two 2
add_two(2)
```

And all of these:

```ruby
puts add_two 2
puts add_two(2)
puts(add_two 2)
puts(add_two(2))
```

So when do you use parentheses, and when do you omit them?

There is no clear rule about this, but there are some conventions. For now,
you can just stick with the convention we are using at our study groups, which
is:

Use parentheses for all method calls that take arguments, except for the
methods `puts` and `p` (and later: `require` and `include`). Also: if a method
does not take any arguments, then do not add empty parenthese, omit them.

So the idiomatic way to write the line above is:

```ruby
puts add_two(2)
```

#### Writing a new method

As programmers we like to split up our tasks, and do one thing after another.
This allows us to focus on one small task, and once we've solved it, we move on
to the next one.

When you need to add some new functionality to your program you'll often times
find yourself thinking "I should add a method for this": methods encapsulate
behaviour.

Now, the first thing you should ask yourself is: "What is it that this method
should do?". The answer to this gives you a hint for a good method name.

Let's say you are working on an application that deals with emails, and the
thing you are trying to accomplish is formatting an email. So your method name
can be `format_email`.

With this first task solved, knowing the method name, you can already write the
method:

```ruby
def format_email
end
```

While this is a pretty useless method, since it does nothing at all, it already
*is* a valid method. So that's good progress already: you've made the first
step.

The next question to ask is: "Does this method need to be given any information
in order to do it's thing?". The answer to this question specifies the method's
arguments list.

In our example, the answer probably is that, in order to format an email, it
needs the email.

So you can now add the argument list to the method:

```ruby
def format_email(email)
end
```

With these two things solved you can now start thinking about implementing
the method body. How can you transform the email into some formatted text?

You'd add a new line between `def` and `end`, and indent it by two spaces
(hit `tab`), and start typing:

```ruby
def format_email(email)
  ...
end
```

You see how we've split up the task of writing a new method into three smaller
tasks, and worked on each one of them after another.

Even though this might seem trivial at first, we recommend you get into this
habit, too.

Many editors help you formatting things. For example, when you are on a line
that starts with `def something`, and at the end of the line hit return,
Sublime will already indent the next line for you by 2 spaces. If you now type
`end`, then Sublime will notice that you are closing the method, and outdent
this again, so `def` and `end` sit on the same level. Smart, isn't it?

Also, if you type an opening parentheses `(`, then Sublime will add a closing
one `)`, too, but keep your cursor placed between them, so you can type the
argument list where it belongs.


#### Flow of execution

One of the things we, as programmers, have assimilated so much that we forget
to explain to beginners is how, and in what exact order, Ruby goes through your
program. This is called the "flow of execution", or "control flow".

When you execute a Ruby file with the `ruby` runtime then this program (also
called an "interpreter") will read your Ruby code, and start executing it line
by line, from top to bottom.

Let's look at our example from above, and how the Ruby control flow flows
through it under the microscope.

For convenience we've now added line numbers, like your editor does. We have
also added parentheses for the method call to `puts`, to make this more
obvious, even though in praxis we recommend against this:

```ruby
1 | def add_two(number)
2 |   number + 2
3 | end
4 |
5 | puts(add_two(3))
```

Ruby starts on line 1, and finds our method definition, so it will read all
of it, until it finds the `end` keyword on line 3. For now it does nothing but
define this method, and keep it in memory so it can be used from now on.

Now, on line 5, Ruby finds that we are using the word `puts` and sees that
we are trying to pass something to it, so this must be a method call.

In order to call a method Ruby needs to first evaluate the values that we want
to pass. So Ruby now looks at what's between the parentheses, and finds another
method call `add_two(3)`.

Again, in order to actually call the method `add_two` Ruby needs to first
evaluate the values that we want to pass.

In this case this is the number `3`, so Ruby will create this object (an
instance of the class `Fixnum`). Now it is finally ready to actually call the
method `add_two`, passing the object just created.

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
of the operator, which in our example, again, is a number. Ruby will therefor
create the number (an instance of the class `Fixnum`), this time with the value
`2`.

Ruby is now ready to evaluate the operator, and add the number `2` to the
number `3`. This operation returns a new number (an instance of the class
`Fixnum`), which is `5`.

Ruby recognizes that the method body has ended, and so it returns from the
method `add_two`, with the return value `5`, because this was the return value
of the statement that was evaluated last.

This is now the second time that Ruby makes a jump: the control flow jumps
back to line 5. Ruby is now done evaluating the method call `add_two(3)`, and
this method call has returned the object `5`. Ruby can now finally call the
method `puts` passng the object `5`, which will then print it out.


