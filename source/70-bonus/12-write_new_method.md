# Writing a new method

As programmers we like to split up our tasks, and do one thing after another.
This allows us to focus on one small task, and once we've solved it, we move on
to the next one.

When you need to add some new functionality to your program you'll often
find yourself thinking "I should add a method for this": methods add behaviour.

Now, the first thing you should ask yourself is: "What is it that this method
should do?" The answer to this gives you a hint for a good method name.

Let's say you are working on an application that deals with emails, and the
thing you are trying to accomplish is formatting an email. So your method name
can be `format_email`.

With this first task solved, knowing the method name, you can already go ahead
and write down the method definition:

```ruby
def format_email
end
```

While this is a pretty useless method, since it does nothing at all, it already
*is* a valid method. So that's good progress already: you've made the first
step.

The next question to ask is: "Does this method need to be given any information
in order to do its thing?" The answer to this question specifies the method's
arguments list.

In our example, the answer probably is that, in order to format an email, it
needs the email.

So you can now add the argument list to the method:

```ruby
def format_email(email)
end
```

With these two things solved you can now start thinking about implementing
the method body. How can you transform the email into some formatted text?

You'd add a new line between `def` and `end`, and make sure it's indented by
two spaces (hit `tab`, unless your editor does it for you), and start focussing
on the code that makes up the method body:

```ruby
def format_email(email)
  ...
end
```

You see how we've split up the task of writing a new method into three smaller
tasks, and worked on each one of them after another.

Even though this might seem trivial at first, we recommend you get into this
habit, too.

Btw, good editors help you format things. For example, when you are on a
line that starts with `def something`, and at the end of the line hit return,
Sublime will already indent the next line for you by 2 spaces. If you now type
`end`, then Sublime will notice that you are closing the method, and outdent
it again, so `def` and `end` sit on the same level. Smart, isn't it?

Also, you'll notice that when you type an opening parenthesis `(`, then Sublime
will add a closing one `)` too, but keep your cursor placed between them, so
you can type the argument list where it belongs.


Exercises: Now would be a good time to do some of the [exercises on
methods](/exercises/methods_1.html).
