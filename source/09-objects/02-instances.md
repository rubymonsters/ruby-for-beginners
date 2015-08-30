# Classes create objects

*Objects are instances of classes.*

Classes are kind of blue prints for the concrete objects. Every time a concrete
object (such as the String `"one string"`, the String `"another string"`, the
String `"yet another string"`, and so on ...) is created:

We say that the class is *instantiated*: an object is created from it.

What does that mean?

Classes have a bunch of characteristics, but most importantly, every class
defines a number of methods, which are specific to this type of thing (e.g. a
String).

Now, every time a new object is created ("instantiated") from this class this
new object get ("inherits") all of these methods.

<p class="note">
Objects inherit methods from their classes.
</p>

That's right. Objects have their own methods attached to them.

We'll explain more about methods that belong to objects in the next chapter.
And you'll see how you can define methods to your own classes, so they're then
available on your objects when we start defining our
[first, own class](/writing_classes).

But for now we can already point out that all concrete Strings that you use in
your code will all have the same methods defined (attached to them) ... because
they're all created (instantiated) from the the same class.

You can have a look at all the methods that the class `String` defines on
Ruby's [documentation page](http://ruby-doc.org/core-2.2.0/String.html) for this
class.

Let's see how we can use these methods.

