# Writing classes

*Finally, our first own class*

Since in Ruby "everything is an object", we have worked with objects quite a
bit already.

We've created numbers, Strings, and seen objects like `true`, `false`, and
`nil`. We have also looked at their class names by calling, e.g. `"a
string".class`, and we have explored some other methods that these objects
have. We have also talked about how you can define your own methods, and how
you can call them, passing arguments as required.

That means we now have all the tools that we need to finally learn how to
define and use your own classes. And this is where things suddenly become even
more fun!

You can think of objects as having two things: They know *stuff*, and they can
*do something* with stuff (their own stuff, as well as the stuff that gets
passed to them).

Imagine you were an object that is an instance of the class `Person`. Well, in
a certain way, you actually are :)

Since you are a `Person`, you are able to remember your own name. And you are
able to do something with it: When asked, you can tell your name to others,
that is, you can return it to the "caller", to whoever asked.

We'll define this exact class in just a few chapters. However, before we do
that, we'll first look at how to define the method `add_two` to a class
`Calculator` ... just because we can, and because you're already familiar with
these methods.

