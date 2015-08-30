# Top-level object

So, we've learned that objects come with lots of methods attached to them.  And
we've seen how we can use them to do interesting things with the object, by the
way of calling these methods.

Now, if you pop into `irb`, or if you write the following code into an otherwise
empty Ruby file, this works:

```ruby
$ irb
> is_a?(Object)
true
> methods
[:to_s, :inspect, ... ]
```

So, as you can see we can use some methods in Ruby without even defining an
object at all: They're already there. And the method `is_a?` tells us that this
already is an object ... whatever "this" is.

What's up with that?

This is something that pretty much blows some people's minds, confuses the heck
out of others, while yet others don't even notice or think about it at all. It
is also something, that, when you ask around on your local Ruby meetup, very
few people can explain in a satisfying, and clear way. And neither do we, yet.

Let's still try.

Whenever you open IRB and it presents that prompt to you, or when you create a
new, empty Ruby file ... Ruby will not only execute your code: Before she does
she first creates an empty, anonymous Object, and kind of places you inside of
it.

This empty Object kind of seems invisible, and it seems that those methods
that we can define in this scope (space) were somehow "standing alone". In fact
they aren't. They're defined on this empty, anonymous Object that we usually
don't see.

This Object often is referred to as the *top-level scope* in Ruby.

<p class="hint">
The top-level scope is an empty, anonymous object. All Ruby code starts in here.
</p>

Confusing? Yeah. Don't worry. This is something many Ruby programmers do and
use everyday without ever asking the question why it works, exactly.

Hopefully some of this will become more clear once you've written your
own methods and classes.
