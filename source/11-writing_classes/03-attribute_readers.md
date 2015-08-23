# Attribute readers

*Asking for information*

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

Before we discuss what this does, let's look at how we can use our new method.
We can now call the method on the person object, like this:

```ruby
person = Person.new("Ada")
puts person.name
```

So this prints the name `Ada`, and that's what we want: we can create a new
person object, passing a name to it. Once that person has been created we are
able to ask for its name, and we'll get the name back.

How does this work, exactly, under the microscope?

Let's walk through it, step by step:

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
variable with the same name are very common.

In fact they are so common that there's a word for them: they are called
"attribute readers". By "attribute" the Ruby community means an instance
variable, so an attribute reader is a method that reads an instance variable.

<p class="hint">
An attribute reader returns the value of an instance variable.
</p>

Another way of looking at this is that an attribute reader is a method that
"exposes" an instance variable. It makes it accessible for others. I.e. it
allows you to ask for the value of an instance variable with the same name, and
does nothing but return its value. Once defined others can ask this object for
knowledge that otherwise would be private, and unaccessible.

In our case the attribute reader `name` exposes the instance variable `@name`,
so others can ask for it.

<p class="hint">
An attribute reader exposes an instance variable.
</p>

We don't know why the community has chosen to use the term "attribute" here:
It would be much less confusing to use the term "instance variable reader"
instead. Maybe the simple reason is that programmers don't like to type more
than necessary, and this saves 8 characters. Who knows :)
