# Object-oriented programming

*Classes and objects*

Ruby is, like many other popular languages, an object-oriented programming
language. Other object-oriented languages that you might have heard of, are
C++, Java, Python, PHP, and Javascript. At some point in the 1990s this
paradigm started to become more and more popular and nowadays it is the
most prevalent one.

One reason for this is that object-oriented programming very much fits the way
we perceive and think about the world, at least in occidental culture.
Our way of thinking was, historically, very much influenced by Plato,
and the philosophers who followed him:

We somehow tend to think about the world as if there are abstract "ideas" (or
concepts) and concrete "things", which are entities of the ideas, or
implementations of the concepts. So, "ideas" are like blueprints for "things".
For example there's the idea of a human being, and then there are actual human
beings: you, and me. Our idea of a human being includes the ability to, for
example, remember our own name, and tell it to others when asked. We know
that we can ask people for their name, and they'll know it.

Now, object-oriented programming languages allow you to describe things exactly
this way: In object-oriented programming languages "ideas" are called classes.
And actual "things" are called objects. As a programmer you would define
classes, like a class "User" and a class "Tweet", and then create actual
instances of these classes: an actual concrete user with a name, email
address, a password and actual tweets. You would also define that users have
the ability to remember their own name, and the ability to tell it to others
when asked.

Every object-oriented programming language comes with some "ideas", that is,
classes, already baked in, and so does Ruby. For example Ruby has classes for
numbers, strings (text), and other useful things. You therefore can, without any
further effort, do number calculations, or text transformations.

In your first excercises you will do just that. Later on you will learn to
define your own "ideas" as classes, and then use them by the way of creating
actual instances or objects, from these classes, and then make them interact with
each other and do interesting stuff.

Here is a quote from a book titled [The Early History Of Smalltalk](http://worrydream.com/EarlyHistoryOfSmalltalk/)
from 1993. It has been written by Alan C. Kay, one of the designers of
[Smalltalk](https://en.wikipedia.org/wiki/Smalltalk), which was created in the
1970s, and can be considered the first fully object oriented programming
language:

"[Smalltalk's] way of making objects is quite Platonic in that some of them act
as idealizations of concepts—Ideas—from which manifestations can be created.
That the Ideas are themselves manifestations (of the Idea-Idea) and that the
Idea-Idea is a-kind-of Manifestation-Idea—which is a-kind-of itself, so that
the system is completely self-describing— would have been appreciated by Plato
as an extremely practical joke." -- Alan C. Kay

(There is, today, some debate about the paradigm of object-oriented
programming, and whether we should move on to another one, called "functional
programming". You might hear about this if you talk to developers. Some
functional languages are Haskell, Go, and Clojure, and they have recently
started gaining some traction. Don't let yourself be distracted by this too
much, unless you really want to. Ruby is a very good language to start learning
programming for lots of reasons.)
