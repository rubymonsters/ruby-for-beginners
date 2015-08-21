# Defining a method

Let's define a simple method that takes a number, adds the number `2` to it,
and returns the result:

```ruby
def add_two(number)
  number + 2
end
```

This *defines* a method. It does not *use* it, yet: You only build and place
that vending machine, so it can be used (by yourself, or others) later.

Let's walk through this method definition step by step:

Ruby will start reading the code at the top, and find the keyword `def`. This
tells Ruby that we're about to define a new method.

Methods need a name, so Ruby looks for it next, and finds the word `add_two`.

Ruby then checks if we define anything to "input" to the method (remember, this
is optional). She finds the parentheses, and knows that we're about to define
a list of things that can be given to the method. This list is called an
*argument list*.

<p class="hint">
An argument list defines names for objects passed to the method, enclosed by
parentheses right after the method name.
</p>

In our case the argument list has one single argument `number`, which means
our method can accept one single thing (object).

The next line is the block of code that our method has ("encapsulates"). This
is also referred to as the *method body*.

Inside the method body the arguments are known as local variables: You can see
how the code in our method body uses the variable name `number`.

Finally the keyword `end` tells Ruby that we're done with the method body, and
the method definition.

All we've done so far is defining the method, we haven't used it for anything,
yet. We'll do that in the next chapter.

<p class="hint formatting">
On formatting: Note that the keywords <code>def</code> and <code>end</code> sit
on the same level, while the method body is indented by two spaces. Also, there
are no space before or inside the argument list, i.e. the <code>()</code>
parentheses.
</p>
