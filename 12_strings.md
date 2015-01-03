# Strings

A string, in programming languages, is text. E.g. your name, represented in
Ruby, is a string. The title of this text is a string, and so is this paragraph,
and the full text in its entirety.

In Ruby there are a couple, flexible ways to create strings, but the most simple,
and most used way is to simply enclose some characters in quotes:

```ruby
"This is one string!"
'And this is another one.'
```

Both of these are good to use. Technically they are almost the same, except for
one important feature called "string interpolation", which we'll explain later.

(The reason why text, in the context of programming languages, is not referred
to as "text", but instead with the slightly odd term "string" is a historical,
and technical one: In early programming languages strings were implemented as
lists of characters, and programmers had to deal with them as such. One had
to take care of nasty things such as manually managing the length of the
character list. Once languages started to make things easier for developers,
and add built-in abstractions for this concept, these were named "string",
resembling the way programmers had thought about text before: as characters
lined up on strings. Nowadays, in Ruby, you can just think about strings as
text.)
