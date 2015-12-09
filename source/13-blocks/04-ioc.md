# Inversion of control

In Ruby there are a lot more methods that accept blocks, and they do very
different things. However, they have one thing in common:

By accepting a block, from you as a programmer, the method can pass control to
you.

This design is an example for the principle of *inversion of control*, and
it's the real reason why Rubyists love blocks so much.

What does that mean?

In short it means that Matz, the creator of Ruby, put a tool in place that can
be used to allow methods to pass control to its users (i.e. you as a
programmer).

"Control" in this context refers to the question who gets to decide how things
work.

In older languages, where there was no such tool, people either had to
implement lots of very specific methods, and *guess* what users might need in
the future. Or they'd decide to just not implement any of these methods at all.

For example, in Ruby, we don't have to define lots of methods like `select_odd`,
`select_even`, `select_lesser_than`, `select_greater_than` and so on, ... where
each of these methods would be useful for one very specific usecase.

Instead, the class `Array` only has to implement one single, very generic
method for arrays: `select`. Since Ruby has blocks, the method can allow you
(as a programmer) to specify the criterion yourself: by passing a piece of
code, in the form of block to the method.

That way Ruby lets you, as a programmer, take over control, and specify what is
used as a criterion to select elements.

One of the reasons we mention this is because we think this is a nice example
of a pretty abstract principle applied to software design. There are lots of
other principles like these, and they'll make more and more sense to you over
time. Programming languages and code, from this perspective, is a subject of
design, and thus art, as well as social and cultural questions ... much rather
than strictly logical or technical ones.
