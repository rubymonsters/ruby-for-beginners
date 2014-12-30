# State and behaviour

*Data and methods*

Lets have another look our class definition for `Person`:

```ruby
class Person
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def password=(password)
    @password = password
  end
end
```

Notice something?

The class that we now have demonstrates an important thing about objects:
There's a way to ask a person for its `name`, but no way to set a new name. On
the other hand there's a way to set a new password to the person, but no way to
ask for it.

If you think about it, that makes sense, doesn't it?

If join our Ruby beginners study group for the first time, and we ask you for
your name, you'll happily tell it. But if I ask for your Gmail password, you
will probably just laugh at us, or stare us me puzzled, or show some other
error message :) In any case, you won't tell us your email password, because
that's private information.

The same is also true for objects. Every object has their own object scope that
holds a bunch of instance variables. These are private to the object. Our
person object knows its password, once it has been given to it. But from then
on, it won't it tell anyone, because there's no method for that. On the other
hand, there's a method `name`, which is an attribute reader, so we can ask our
person object for its name. But there's no way for others to give a new name
to the person, because there's no method for that, no attribute writer `name=`.

This concept is called encapsulation, and it is one of the main motivations
behind the whole paradigm of object oriented programing: We can say that an
object encapsulates state, which is private to the object, and exposes
behaviour by the way of having publicly accessible methods.

So, we have now created our first, little class. Congratulations for making it
this far!

With this you now have all the knowledge that you need in order to write your
own Ruby programs or tools in an object oriented way.
