# Our Roadmap

Ok, let's get started.

Here's a rough overview of the road that lies in front of us, and topics that
we'll cover.

This curriculumn is built on top of two main ideas:

* We introduce one concept after another. Doing so we try to make sure not to
  assume any knowledge but things that already were explained.
* We get you to a point where you can create your own classes, objects, and
  methods as quickly as possible: We found that's the point where it starts to
  be most fun for most people.

Of course you don't have to follow exactly this path. For example, if you're
curious, after we've introduced the most basic built-in types of things in
Ruby, numbers and Strings (text), you might find there's another chapter
about more such types. Feel free to skip ahead, and read it. Just be aware
that you might find this chapter assume a couple more things.

So, here's our roadmap:

### 1. Object Oriented Programming

We'll look at the main idea (concept, paradigm) behind programming in Ruby
from a little bit of a philosophical perspective. We do this to set a little
bit of a context for the terms *object*, *class*, and *method* which will
be used quite frequently from then on.

### 2. Variables

In order to do things with objects, and form readable sentences (code) we
need to be able to assign names to them.

This chapter explains variables in Ruby.

### 3. Built-In Data Types

Ruby comes with lots of batteries included. Things that are built-in, and
ready for you to be used when you open an empty Ruby file, or IRB.

We'll look the two most basic, and most widely used ones:

Numbers, and Strings (text). These will be good enough for us to introduce
other concepts without spending too much time on talking about all the other
things that Ruby has built-in (we'll look at the most important ones later).

We'll quickly mention 3 primitive things that are widely used in Ruby: `true`,
`false`, and `nil`, so you've already heard of them when we come across them
later.

Then we discuss Arrays and Hashes, which are data structures. I.e. these are
things that you can use to store other things. They're pretty powerful, and
widely used.

Symbols are quite an odd beast, and you normally wouldn't even need to know
them in order to write your own, working code. However, they're very widely
used and many (many!) examples out there use them. So we introduce them
briefly, too.

### 4. Objects, Classes, Methods

This chapter discusses how objects and classes relate to each other, how
methods can be called on objects, and explores a number of different methods.
It also has a quick look to see what's up with that magic, so-called top-level
object in Ruby.

### 5. Writing Methods

While variables give names to things, methods give names to behaviour.  Methods
are like the swiss-army knife of programming.  We'll have a look at the anatomy
of a method, and learn how we can define our own ones.

### 6. Writing Classes

With this knowledge at hand we can now go ahead and define our first class
(kind of thing) ourselves: We'll define the class `Person`, create some
"people" (objects), and let them interact. We'll learn how to make our objects
"know" things, and how to give them "behaviour".

### 7. Blocks

Blocks are a super powerful feature in Ruby. We love them, and use them
everywhere. Many built-in methods use them, too. So it's good to introduce
them now.

Blocks are like methods that don't have a name, and they are passed when
calling actual methods. We'll discuss why this is cool, and how it works.

### 8. Conditionals, Truthiness, and Nothing

Sometimes you want to run some part of your code only if a certain condition
applies (e.g. you only want to allow users to login if the supplied password
is correct).

Conditionals allow you to do that. Ruby comes with some pretty cool features
included, and we'll quickly look at them.

### 9. Operators

There are lots of different operators built into Ruby, and at this point
you've already used a number of them (such as the arithmetical operator `+`,
and the assignment operator `=`).

We'll look at a few more, and also reveal that operators, in fact, are ...
methods in disguise!

### Bonus and advanced topics

This concludes the core of our "Ruby For Beginners" curriculum. With this
knowledge you'll have all the tools you need in order to play with things, read
(most of) other people's code, and write your own useful things.

There are a couple bonus chapters that you might want to skim through. Some of
these are still waiting to find their place somewhere else in the book. Some
will probably be marked as optional.

Also there are some extra chapters about advanced topics, some of which are
relevant to the more advanced exercises, and for the next curriculum about
[building your own web applications](http://webapps-for-beginners.rubymonstas.org/).
