# Defining a method

So far you have seen methods that "belong" to objects, or, in other words,
are defined on objects, and can be called on objects. E.g. you have seen the
method `downcase` which is defined on every string.

However, Ruby also knows methods that are not defined on any of these objects.
They're sort of "stand alone" methods.

For example, you can try this in `irb`:

```ruby
$ irb
> is_a?(Object)
true
```

We'll use this type of methods in this chapter because we want to focus on the
characteristics of methods. If you're curious what's up with them have a look
at the bonus chapter about the [top-level object](bonus/top_level.html). Later
when you learn how to define your own classes we also look at defining methods
for these.

Ok, let's get started.

Suppose we need to define a simple method that takes a number, adds the number
`2` to it, and returns the result. Here's how we can do that:

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
is also referred to as the *method body*. In our case that's just one single
line because the operation that our method encapsulates is very simple. Other
methods (think of `sort`, defined on Arrays) would require more code, and are
longer.

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
