# What makes a method

There are four things that constitute a method:

* a name
* a block of code
* (optionally) accepting input
* returning output

Not all methods actually need input (so they don't take any), and not always do
we care about the output that a method returns.

Imagine a vending machine where you can chip in some money, press some buttons,
and the machine will spin a few gears and wheels, and spit out the chocolate
bar you were after.

If the vending machine was a method, then your money, as well as the buttons
you press are the *input*. The way the machine internally spins certain
mechanics is the *block of code*, the stuff it does internally. And the product
that it dispenses is the *return value*.

Although this would be an odd thing to mention to a non-programmer, we could
say that a vending machine is a way of "transforming" money and data into
chocolate.

Methods are a lot like that.

<p class="hint">
Methods have a name, take some input, do something with it, and return a result.
</p>

Programmers usually don't use the term "input" in this context. Instead we say
that a method accepts a number of *arguments* (pieces of input). And instead of
"output" we use the term *return value*: the thing that we get back from the
method.

<p class="hint">
A method's input is referred to as "arguments", while its output is called a
"return value".
</p>

This will become more clear in the following chapters. Let's define a method next.
