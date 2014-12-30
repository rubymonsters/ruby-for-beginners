# Classes and objects

*State (data) + behaviour (methods)*

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

In order to make our class a little bit more useful, we want to be able to give
it some initial data. In our case, we want the person to know it's own name.

We can do this like so:

```ruby
class Person
  def initialize(name)
  end
end
```

Now, there are a couple of things going on here. Let's go through them one by
one.

You see that we add a method called `initialize` to the class, and this method
accepts a single argument, which is called `name`. At the moment, this method
is still empty. We'll add some code to it in a bit.

On formatting: the method definition is indented by one level, that is, 2
spaces. We do this in order to signalize that the method `initialize` belongs
to the class `Person`. Everything between the line `class Person` and the
final line `end` is called the "class body", and just like method bodies, and
bodies of `if` and `else` branches we indent them by one more level.

The important bit to learn for you about the method `initialize` is that it is
a special method with a special meaning in Ruby:

Whenever you call the method `new` on a class, as in `Person.new`, this class
will create a new instance of itself. It will then, internally, call the method
`initialize` on the new object. Doing so it will simply pass all the arguments
that you passed to `new` on to the method `initialize`.

So we can now create a new person instance by calling:

```ruby
Person.new("Ada")
```

The name `'Ada'` of course refers to Ada Lovelace, the worlds [first computer
programmer](http://en.wikipedia.org/wiki/Ada_Lovelace) :)

To recap, when you call `new` on the class `Person`, and pass the string
`"Ada"` then the method `new` will create a new instance of the class, and call
`initialize` on it, passing the same argument list, which in our case is the
single string `"Ada"`, as in `object.initialize("Ada")`.

When we create a new instance of a class by the way of calling the method `new`
on that class, we also say that we "instantiate" that object: By calling
`Person.new` we instantiate a new person object.

So, now that you understand how the string that we pass to the method `new`
ends up being passed to the new object's `initialize` method, we can start
improving `initialize`, so it actually does something with the string:

```ruby
class Person
  def initialize(name)
    @name = name
  end
end
```

Again, this introduces a new concept: `@name` is a new type of variable, called
an "instance variable". The body of the `initialize` method now does nothing
else but assign the value of the local variable `name` to an instance variable
`@name`.

You remember how we said that each method has it's own local scope, which is
created when the method is called, and populated with local variables from the
arguments list. You have also learned that this scope is erased, and thrown
away when Ruby exits and returns from the method. And local variables that are
visible in one method are not visible in other methods: they are local.

Now, every *object* also has its own scope.

An object's scope is populated with instance variables, in the moment we assign
something to them. And they are visible *everywhere* in the object, that is, in
every method that the object has.

You can think of the object's scope as your own knowledge, or memories. For
example, you know your name, your email address, and your email password.
You keep this knowledge around, and you can use it. Likewise, an object keeps
its instance variables around, as long as they exist.

On top of this, the object's scope also contains the object's method names.
That is to say, the object knows about its own methods, and it can call them,
internally from other methods, if that's useful.

If you now create, and output a person instance, you'll see that Ruby now
prints out the instance variable, too:

```ruby
person = Person.new("Ada")
p person
```

The first line creates a new instance of the class `Person`, passing the string
`"Ada"`, and assign this new object to the variable `person`. The second line
will then print it out:

```
#<Person:0x007fd8947aa868 @name="Ada">
```

As you can see that includes the instance variable `@name` with the value
`"Ada"`.

You can think of this as that you, as a programmer, create this new person, and
in the moment of its creation, its birth, you also give it a name. Which kind
of is, how it works with real people, too, isn't it?

Remember how we initially said that people have the ability to remember their
name, and tell it, when asked?

We've already implemented the first part of this. Our person instance now
knows her name "Ada".

Let's look at the second part. You also remember that methods are either
questions or commands. We want to add a method that implements answering
the question "What's your name?".

And it is as simple as this:

```ruby
class Person
  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end
```

Before we discuss what this does, let's look at how we can use our new method:

```ruby
person = Person.new("Ada")
puts person.name
```

So this prints the name `Ada`, that's what we want: we can now create a new
person object, passing a name to it. Once that person has been created we are
able to ask for its name, and we'll get the name back.

How does this work, exactly? Let's walk through it, step by step:

* On the first line, the object that ends up being assigned to the variable
  `person` is an initialized, new instance of the class `Person`. By
  "intialized" we mean that the method `initialize` has already been called,
  and it already has assigned the string `"Ada"` to the instance variable
  `@name`.

* Now this person object has the method `name`, as defined in the class
  definition of `Person` above, and in the second line we call this method:
  `person.name`.

* When the method `name` is called, it does nothing else but evaluate the
  instance variable `@name` from the object scope. Because this has previously
  been set to `"Ada"` it will return this string. And because this is the last
  line in the method `name` the method also will return this string.

* For that reason the method call `person.name` returns the string `"Ada"`,
  which is then passed to `puts`, which prints it out.

Methods that do nothing else but return a value assigned to an instance
variable with the same name are very common. In fact they are so common that
there's a word for them: they are called "attribute readers". By "attribute"
the Ruby community means an instance variable, so an attribute reader is a
method that reads an instance variable.

We don't know why the community has chosen to use the term "attribute" here:
It would be much less confusing to use the term "instance variable reader"
instead. Mabye the simple reason is that programmers don't like to type more
than necessary, and this spares 8 characters. Who knows :)

Anyhow, imagine in our application a person not only needs a name, but also a
password. However, let's also imagine that, at the time of the creation of a
new person object, this password is not yet known. (Who would give a toddler an
email password anyway?) Instead we want to be able to tell the person object
about its email password later.

We can do this like so:

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

As you can see, the method `password=` does nothing else, but take a single
argument (called `password`) and assign the value of this local variable to the
instance variable `@password`.

This method's structure looks exactly the same as the method `initialize`,
doesn't it? Execpt that `initialize` is called whenever you call `new` on the
class. Our new method `password=` needs to be called on the object itself,
once it has been created, and returned from `new`.

That's right. Again, because this kind of method is used so often, there's
another name for it: it's an attribute writer. (And again, we think it should
have been called an "instance variable writer" instead.)

Now, we can use the attribute writer like so:

```ruby
person = Person.new("Ada")
person.password=("super secret password")
p person
```

If you execute this, then it will print out:

```
#<Person:0x007fb61c1edcf8 @name="Ada", @password="super secret password">
```

Hmmm, that method call looks a little weird though, doesn't it?

Remember what we've said above about the syntax sugar that Ruby adds for the
assignment operator `=`? Exactly the same works for attribute writers, that
is, methods that end with an equals sign `=`.

So we can also write this instead:

```ruby
person = Person.new("Ada")
person.password = "super secret password"
```

And this reads much better, doesn't it?

Just remember that, under the hood, when running your code, Ruby translates the
line `person.password = "something"` to `person.password=("something")`, and
this simply calls the method `password=`, passing the value on the right hand
side as an argument: it's just another method :)

We think this is pretty cool.

But hold on. Lets have another look the class definition that we have so far:

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
