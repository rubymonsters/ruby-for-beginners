# Don't believe everything we say

While you are learning to program you'll talk to seasoned developers, ask
questions, listen to their advice, tips, and experiences.

That's great! We recommend you listen closely, try to understand, and ask more
questions.

However.

Also always try to put things into perspective. Whatever you hear, try to
understand, compare to other opinions, and judge for yourself.

As in any other field, developers (as much as any other person) will always
give answers based on *their* own perspective, based on *their* own experience,
and based on what *they* think is a helpful answer to you. Now, being a great
Ruby developer ("knowing your stuff") and being a great Ruby coach ("giving the
right advice") are not the same thing.

Developers who have never coached, or are new at coaching, might: overload you
with information. They know all this stuff, and, as said before, they aren't
even fully aware of it. They just *use* the language, and all these features.

Now, when asked, they explain things to you, and may suddenly remember that ...
"Oh, right, and then there's also this other language feature, and that one,
and another one!" They may be excited to explain all the things at once,
without noticing that, at this particular point, you actually wouldn't need to
know them all.

Also, they might present you a conclusion, and omit the learning process. In
programming, as much as in any other field, there's rarely any silver-bullet.
There always are alternative solutions, with different advantages and
downsides. Often times it's hard to fully understand things unless one tries a
particular solution and sticks with it for a while.

On top of this, whatever is considered a "good" solution by the community at
any point of time, always is the conclusion of a decades evolutionary learning
process. Often times it makes sense to start practicing with an older solution
that worked well enough a couple years ago, feel some of the pains that it
caused, and only then try using the latest, more modern solution.

Developers tend to be excited about their preferences, and will happily explain
at lengths why one solution works better for them than another.  Often times
you can learn a lot from listening to these explanations.  However, keep in
mind that this doesn't necessarily mean a tool that's great for day to day work
for an experienced programmer also is a tool that's great for learning to
program.

On top of all this, there's also the problem that the tools that we use, over
time, become more and more optimized for advanced users. New features are being
added that make our day to day work easier, and over the years, up to date
documentation, and tutorials will focus on these features.

While that's great for advanced users, it's actually bad for beginners, as you
now not only need to understand the basic concept, you also need to understand
this additional feature on top of it.

A good coach will try and adjust to these things, but doing so also is a skill
that needs to be learned. Try to give feedback, and help your coaches improve.

Of course, everything said above also applies to ourselves :)

Here are a few examples of decisions we made for our study groups:

* We use the old syntax for hashes in beginners groups. Why? When you first
  learn what a hash is, and how it is used, this is quite a bit of information
  to process. The new hash syntax puts an extra burden on you, and raises extra
  questions that just aren't required to be answered in order to understand
  what a hash, how it can be used, and why it is useful. We do mention the new
  syntax, but we do not use it, and explain why.

* We purposefully ignore tons of language features, such as lambdas, splats,
  class level methods, class variables, and so on in our beginners groups for
  quite a while. Our goal is to get to the point where you can write a simple
  Sinatra application while fully understanding everything you use in terms of
  Ruby language features. We found this is the point where it starts getting
  more and more exciting for most students: You can now build their own web
  applications, and understand what you're doing. For this, many language
  features simply aren't required.

* We use the test framework that is integrated into Ruby on Rails, instead of
  RSpec, another, more modern framework that is preferred by many (but not all)
  Ruby programmers. Why? It is easier to understand: methods are just methods,
  not method calls that generate other methods that magically do things. You
  don't need to learn a lot in order to start writing your first test, and
  there is no additional setup required. Later on, once you've written a good
  bunch of tests, it is a great idea to then learn RSpec, and try that one
  for a while.

