# Defining classes

Let's start by creating a class `Calculator`, and adding some methods to it,
step by step.

In Ruby, you define a class like this:

```ruby
class Calculator
end
```

That's all. It's not a very useful class, since it's completely empty, but
it's a class.

<p class="hint">
A class is defined using the keyword <code>class</code>, a name, and the
keyword <code>end</code>.
</p>

Also, you see that the class has the name `Calculator`, which starts with an
uppercase letter. In Ruby, this is required, and you'd get an error if you
tried to define a class `calculator`.

Also, for class names that consist of several words the Ruby community has the
convention to separate these words by uppercase letters, as in
`RubyStudyGroup`.  This is called CamelCase, because of the humps. Whereas for
variable and method names we use underscores, and keep everything lowercase:
`local_variable` and `method_name`. This is called snake_case.

<p class="hint">
Class names must start with an uppercase letter, and should use CamelCase.
Variable and methods names should use snake_case.
</p>

Ok, back to our class `Calculator`.

Since we've defined a full, valid class, we can now already use it to create a
new, concrete calculator instance, an object from it.

You can think about the instance as the concrete calculator object that you can
hold in your hands, and use to do actual calculations. The class on the other
hand is more like the idea or concept of a calculator, like the idea of it that
you have when you order a calculator online.

Ok, here's how to do create a new, concrete instance from our class:

```ruby
Calculator.new
```

That's right. `new` is a method, and it is defined on the class itself (which,
as you might remember, is also an object, so it can have methods). This method
creates a new instance of the class, and returns it.

<p class="hint">
The method <code>new</code> is defined on every class, and returns a new
instance of the class.
</p>

Cool. Let's have a look at that object:

```ruby
p Calculator.new
```

The output will seem a little bit weird, and technical at first:

```
#<Calculator:0x007fb2fbe50910>
```

The format `#<...>` tells you that this object is not a simple thing like a
number, string, or array. Instead, it just tells you the name of the class,
`Calculator`, and the internal id that Ruby has assigned to this object.

Every object has its own, unique, internal object id, and when I ran this code
on my computer, Ruby assigned the id `0x007fb2fbe50910`. If you run it,
you'll get a different one. In practice, most of the time, you can simply ignore
this id.

Also, we can check that our new calculator instance indeed is an instance of
the class `Calculator`:

```ruby
$ irb
> class Calculator
> end
> calculator = Calculator.new
> calculator.class
=> Calculator
> calculator.is_a?(Calculator)
=> true
```
