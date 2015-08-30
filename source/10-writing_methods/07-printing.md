# Printing things

Many of the exercises that you do while doing your first steps with Ruby
basics include running a short Ruby program that outputs something to the
terminal.

So far, we have mostly used the method `puts` to do that.

However, there's another method that is even more useful when we are trying
to figure out what a program is doing, why it is doing it, and what a certain
error might be about.

This method is the method `p`. In order to understand `p` better, we want to
look at another method first, which is the method `inspect`.

The method `inspect` is available on any object in Ruby. It returns a string
that is a representation of the object itself: a representation that is as
close as possible to the code that you use to create the object. So `inspect`
is useful to inspect objects, duh :)

This becomes more clear when you try it in IRB:

```ruby
$ irb
> puts 5.inspect
5

> puts "A string".inspect
"A string"

> puts [1, 2, 3].inspect
[1, 2, 3]
```

As you can see the string returned from `inspect` is exactly the same as the
Ruby code that we used to create the object. That is really convenient.

However, typing `puts something.inspect` is quite a bit of work to do. That's
12 characters to type next to the object itself!

Therefore Ruby has a method to make our lifes easier, and does this work for us.
That's the method `p`.

This method is implemented like so:

```ruby
def p(object)
  puts object.inspect
end
```

Whenever you are trying to figure out what a certain line of code does, what's
assigned to a variable, or what a method call returns, we recommend to use `p`
because it tells you exactly what the thing that you are looking at is.

`puts` on the other hand tries to be smart.

For example when you pass an array to `puts` then it will output each of the
objects on a separate line:

```ruby
$ irb
> something = [1, 2, 3]
> puts something
1
2
3
```

Also, the output for numbers and strings that contain numbers is exactly the
same when you use `puts`:

```ruby
$ irb
> puts 123
123
> puts "123"
123
```

From the output of `puts` it often is not clear whether the object that you are
looking it is an array that contains numbers, or an array that contains
strings, or just a long string that contains linebreaks.

In short, `puts` is useful when you are writing a program that is supposed to
actually output something to the screen. Like, this could be a command line
tool that you write in order to make your own life easier at your job, and that
is helpful at automating some repetitive work. Or it is useful in Ruby
programming exercises :)

On the other hand `p` is useful when you are trying to understand what your
code does, e.g. when you are trying to figure out a certain error.

