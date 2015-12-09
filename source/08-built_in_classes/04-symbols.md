# Symbols

*Symbols are like strings, except they are code.*

Symbols are a rather strange concept to be honest, and we only introduce them
because symbols are used so often and widely that you'll very likely find them
used in code elsewhere. For your first steps in learning programming we would
not necessarily need them.

A symbol is written like this: `:something`

I.e. there is a word that is preceded by a colon. This means that normally
symbols do not contain spaces. Instead, if we have symbols that consist of
multiple words we would concatenate them with underscores, like so:
`:another_funny_symbol`

<p class="hint">
A symbol is created by adding a colon in front of a word.
</p>

So when to use strings, and when to use symbols?

There's actually no perfectly clear line or simple definition.

* One rule of thumb is that if the text at hand is "data", then use a string.
  If it's *code*, then use a symbol, especially when used as keys in hashes (see
  below).

* Another way of looking at symbols is that they aren't really text, even though
  they read well. Instead they are *unique identifiers*, like numbers, or bar
  codes. While strings represent data that can change, symbols represent unique
  values, which are static.

* And more technically, if you use strings that contain the same text in your
  code multiple times, then a new string object will be created every time. E.g.
  if you do `puts "Hello!"` 10 times then 10 actual string objects will be
  created (and then discarded, because they're not being used any longer). On the
  other hand, if you'd use a symbol for this and do `puts :hello` 10 times, then
  only *one single object* will be created, and *re-used*.

<p class="hint">
Symbols are unique identifiers that are considered code, not data.
</p>

If you find all of this confusing, don't worry, many people do. You'll
understand symbols better once you get to use some of them in your code. For
now you can think of them as a special, limited variation of Strings (text).

<p class="hint">
Symbols are a special, limited variation of Strings.
</p>

## The technical difference

Skip the following unless you're really curious about the underlying technical
difference between Strings and Symbols.

Try this in IRB:

```ruby
$ irb
> "a string".object_id
=> 70358630335100
> "a string".object_id
=> 70358640625960
> "a string".object_id
=> 70358644379620
```

As you can see, even though the 3 Strings created are exactly the same, every
new String created has a different `object_id`: They're actually different
objects, even though they contain the same text.

With Symbols however:

```ruby
$ irb
> :a_symbol.object_id
=> 1086748
> :a_symbol.object_id
=> 1086748
> :a_symbol.object_id
=> 1086748
```

We now get the same `object_id` for each of the Symbols, meaning they're
referring to the exact same object.

The `object_id` is a unique id that Ruby uses internally in order to keep track
of all the objects that are flying around in the universe that makes up your
program. E.g. Ruby needs to know which objects are still being useful, and
which ones can be cleaned up and thrown away. The `object_id` is a way to
identify each and any object by a unique id.

By `true`, `false`, and `nil` (as well as all numbers) also behave this way:
Whenever you use these in your code you'll get the same object. Try it in IRB
and check their `object_id`.

Let's move on though.

