# Top-level object

So, we've just learned that objects come with lots of methods attached to them.
We've seen how we can use them to do interesting things with the object, by the
way of calling these methods.

But previously we've also learned how to define our own methods (e.g. `add_two`),
and these methods weren't attached to any object, right? We've just hand-wavingly
called them "stand-alone" methods.

On the other hand we've also heard that "In Ruby everything is an object".

So what's up with that?

This is something that pretty much blows some people's minds, confuses the heck
out of others, while yet others don't even notice or think about it at all. It
is also something, that, when you ask around on your local Ruby meetup, very
few people can explain in a satisfying, and clear way. And neither do we, yet.

Let's still try.

Whenever you open IRB and it presents that prompt to you, or when you create a
new, empty Ruby file ... Ruby will not only execute your code. Before she does
that she creates an empty, anonymous Object, and kind of places you inside of
it.

This empty Object therefor seems invisible, and it seems that those methods
that we can define in this scope (space) were somehow "standing alone". In fact
they aren't. They're defined on this empty, anonymous Object that we usually
don't see.

This Object often is referred to as the *top-level scope* in Ruby.

<p class="hint">
The top-level scope is an empty, anonymous object. All Ruby code starts in here.
</p>

Confusing? Yeah. Don't worry. This is something many Ruby programmers do and
use everyday without ever asking the question why it works, exactly.

In practice you can just remember that you can define and use methods, just
like variables in the top-level scope. And methods (as well as variables)
can also be attached to objects, too.

Hopefully some of this will become more clear once you've written your
own classes.

So let's do just that.
