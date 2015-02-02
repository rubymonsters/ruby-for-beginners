# Symbols

*Symbols are like strings, except they are code.*

Symbols are a rather strange concept to be honest, and we only introduce them
this early because symbols are used so often and widely that you'll very likely
find them used in code elsewhere. For your first steps in learning programming
we won't necessarily need them.

Symbols are written like this: `:something`

i.e. there is a word that is preceded by a colon. This means that normally
symbols do not contain spaces. Instead, if we have symbols that consist of
multiple words we would concatenate them with underscores, like so:
`:another_funny_symbol`

So when to use strings, and when to use symbols?

There's actually no perfectly clear line or simple definition. One rule of
thumb is that if the text at hand is "data", then use a string. If it's code,
then use a symbol, especially when used as keys in hashes (see below).

Another way of looking at symbols is that they aren't really text, even though
they read well. Instead they are unique identifiers, like numbers, or bar
codes. While strings represent data that can change, symbols represent unique
values, which are static.

And more technically, if you use strings that contain the same text in your
code multiple times, then a new string object will be created every time. E.g.
if you do `puts "Hello!"` 10 times then 10 actual string objects will be
created (and then discarded, because they're not being used any longer). On the
other hand, if you'd use symbols for this and do `puts :hello` 10 times, then
only one single symbol will be created, and re-used.

If you find this confusing, don't worry. You'll understand symbols better once
you get to use some of them in your code.
