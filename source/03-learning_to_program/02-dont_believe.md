# Don't believe everything we say

While you are learning to program you'll talk to seasoned developers, ask
questions, and listen to their advice, tips, and experiences.

That's great! We recommend you listen closely, try to understand, and ask more
questions.

However...

Always try to put things into perspective. Whatever you hear, try to
understand, compare with other opinions, and judge for yourself.

As in any other field, developers, as much as any other person, will always
give answers based on *their* own perspective, based on *their* own experience,
and based on what *they* think is a helpful answer to you. Now, being a great
Ruby developer ("knowing your stuff") and being a great Ruby coach ("giving the
right advice") are not the same thing.

Developers who have never coached, or are new at coaching, tend to, for
example, overload you with information. They know all this stuff, and, as said
before, they aren't even fully aware of it. They just *use* the language, and
all these features.

Now, when asked to explain things, and may suddenly remember: "Oh, right, and
then there's also this other language feature, and that one, and another one,
and ...!" They may be excited to explain all the things at once, without
realizing that, at this particular point, you actually don't need to know
them all at once.

Also, they might present a conclusion, and omit the learning process. In
programming, as much as in any other field, there's rarely any silver bullet.
There are always alternative solutions, with different advantages and
downsides. Often it's hard to fully understand them unless one tries a
particular solution and sticks with it for a while.

On top of this, whatever is considered a "good" solution by the community at
any point of time, is always the conclusion of a decades-long evolutionary learning
process. Often it makes sense to start practicing with an older and
simpler solution that worked well enough a couple of years ago, and experience some of
the problems it caused, and only then try using the latest, more modern
solution.

Developers often tend to be excited about their current preferences, and 
things they've learned just recently, and will happily explain at length why
one solution works better for them than another. Often you can learn a
lot from listening to these explanations. However, keep in mind that this
doesn't necessarily mean a tool that's great for an experienced programmer 
is also a tool that's great for learning to program.

On top of all this, there's also the problem that the tools we use, over
time, become more and more optimized for advanced users. New features are being
added that make our day to day work easier, and over the years, up-to-date
documentation and tutorials will focus on these features.

While that's great for advanced users, it's sometimes bad for beginners, as you
now not only need to understand the basic concept, you also need to understand
this additional, more abstract feature that sits on top of it.

A good coach will try and adjust to these things, but doing so also is a skill
that needs to be learned. Try to give feedback, and help your coaches improve.

Of course, everything said above also applies to ourselves :)

Here are a few examples of decisions we made for our study groups. Don't worry
if you don't understand what we're talking about at this point. You'll fully
understand them once we get there during study group.

* We use the old syntax for hashes in beginners groups: When you first learn
  what a hash is, and how it is used, this is quite a bit of information to
  process. The new hash syntax puts an extra burden on you, and raises extra
  questions that just aren't required to be answered in order to understand
  what a hash is, how it can be used, and why it is useful. We do mention the
  new syntax, and explain why we do not use it.

* We purposefully ignore tons of language features, such as for and while
  loops, lambdas, splats, class level methods, class variables, and so on. Our
  goal is to get to the point where you can write a simple Sinatra application
  while fully understanding everything you use in terms of Ruby language
  features. We found this is the point where it starts getting more and more
  exciting for most students: You can now build your own web applications, and
  understand what you're doing. For this, many language features simply aren't
  required.

* We use the test framework that is integrated into Ruby on Rails, rather than 
  RSpec, another, more modern framework that is preferred by many (but not all)
  Ruby programmers. Why? It is easier to understand: methods are just methods,
  not method calls that generate other methods that magically do things. You
  don't need to learn a lot in order to start writing your first test, and
  there is no additional setup required. Later on, once you've written a good
  bunch of tests, it is a great idea to then learn RSpec, and try that one
  for a while.

* One example of technology improving, adding features optimized for more
  advanced users, and thus making it harder to understand for newcomers, is the
  aforementioned new hash syntax. Other examples are:
  Rails' `resources` macro in routes (it is much easier to understand the whole
  concept if you type out these 7 routes yourself), and Rails' migrations
  (they've gone, for good reasons, from being numbered to being timestamped,
  making the naming choice `migrate:up` and `migrate:down` harder to
  understand; and they've introduced the method `change`, replacing the methods
  `up` and `down`)
