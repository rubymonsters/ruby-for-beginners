# Writing Methods

*A named block of code that takes input and returns output*

Everything in programming is about data, and doing interesting things with it.
If you think about Twitter, it essentially takes 140 characters of text
(which is data) from their users and displays it to others.

You have already learned about the most important primitive (simple) types of
data in Ruby: numbers, strings, true, false and nil. And we've had a look at
the two most common data structures, Arrays and Hashes.

All of this is about the *data* part. Methods on the other hand are about the
*doing interesting things* part.

In this chapter we'll have a closer look at the anatomy of a method, and you'll
learn how to implement, and use, your own methods.

## Methods define behaviour

Methods are all about defining *behaviour*, so that they can be applied to
different bits of data in different contexts easily.

For example, there are methods that do things like: transforming a String,
sorting a list, reading a CSV or Excel file, sending an email, signing in to
Facebook, sending a Tweet.

Another way of putting this is: Methods are a way of assigning a name to a
certain piece of code. Just like a variable allows to "look up" or refer to
the object that the name was assigned to ... methods allow to execute their
code.

<p class="hint">
Variables name things, methods name behaviour (code).
</p>

Methods make code re-usable, by the way of packaging ("encapsulating") code and
sticking a name on it.

As you have seen Ruby comes with lots of methods predefined - written by
experienced programmers. So, unless you're studying computer science and you're
faced with the exercise of implementing your own, complicated sorting
algorithms for data collections, ... you'll just use the method `sort` that
already comes defined for Arrays in Ruby out of the box.

Ok, let's see what makes up a method, and how we can define our own ones.

