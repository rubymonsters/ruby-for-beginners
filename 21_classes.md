# Classes

*Finally, our first own class*

Since in Ruby "everything is an object", we have worked with objects quite a
bit already. We've created numbers, strings, arrays, and hashes. We have also
looked at their class names by calling, e.g. `"a string".class`, and we have
explored some other methods that these objects have. We have also talked about
how you can define your own methods, and how you can call them, passing
arguments, and blocks.

That means we now have all the tools that we need to finally learn how to
define and use your own classes. And this is where things suddenly become even
more fun!

You can think of objects as having two things: They know "stuff", and they can
"do something" with stuff (their own stuff, as well as the stuff that gets
passed to them).

Imagine you were an object that is an instance of the class `Person`. Well, in
a certain way, you actually are :)

Since you are a `Person`, you are able to remember your own name. And you are
able to do something with it: When asked, you can tell your name to others,
that is, you can return it to the "caller", to whoever asked.

Let's start creating this class, step by step.

In Ruby, you define a class like this:

```ruby
class Person
end
```

That's all. It's not a very useful class, since it's completely empty, but
it's a class.

Also, you see that the class has the name `Person`, which starts with an
uppercase letter. In Ruby, this is required, and you'd get an error if you
tried to define a class `person`.

Also, for class names that consist of several words the Ruby community has the
convention to separate these words by uppercase letters, as in
`RubyStudyGroup`.  This is called CamelCase, because of the humps. Whereas for
variable and method names we use underscores, and keep everything lowercase:
`local_variable` and `method_name`. This is called snake_case.

Ok, back to our class `Person`.

Since we've define a full, valid class, we can now already use it to create a
new, concrete person instance, an object from it. Like so:

```ruby
Person.new
```

That's right. `new` is a method, and it is defined on the *class* itself
(which, as you might remember, is also an object). This method creates a new
instance of the class, and returns it.

Let's have a look at that object:

```ruby
p Person.new
```

The output will seem a little bit weird, and technical at first:

```
#<Person:0x007fb2fbe50910>
```

The format `#<...>` tells you that this object is not a simple thing like a
number, string, or array. Instead, it just tells you the name of the class,
`Person`, and the internal id that Ruby has assigned to this object. Every
object has its own, unique, internal object id, and when I ran this code on
my computer, Ruby has assigned the id `0x007fb2fbe50910`. If you run it, you'll
get a different one. In praxis, most of the time, you can simply ignore this
id.

