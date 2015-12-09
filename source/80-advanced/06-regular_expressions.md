# Regular Expressions

*Some people, when confronted with a problem, think "I know, I'll use regular
expressions."<br> Now they have two problems.*

That's a pretty famous joke, and it refers to the fact that
[regular expressions](http://en.wikipedia.org/wiki/Regular_expression)
can be quite a pain to figure out.

However, once you know some basics about them, they're also extremely powerful,
and you can do amazing things with them, not only in Ruby, but also, for
example, in your editor, and command line tools.

Regular expressions are sort of a swiss army knife for finding things in
strings (text), extracting parts of them, or mass replacing certain bits with
something else.

E.g. you could do:

* Extract area codes from phone numbers.
* Validate the format of an email address.
* For a list of files `a-01.mpeg`, `b-02.mpeg`, `c-03.mpeg`, change their
  names to `01-a.mpeg`, `02-b.mpeg`, `03-c.mpeg`.

Regular expressions are a language to describe patterns of text. Wikipedia
says: *a sequence of characters that define a search pattern*.

For example the pattern `[0-9]+!` means: There needs to be at least one digit,
and it needs to be followed by an exclamation mark. The pattern
`([\w]+)-([\d]+)\.mpeg`

Does this stuff look scary and cryptic? You bet. That's why regular expressions
have kind of a strange reputation in programming. They're super powerful, but
they're also kind of a pain: Like black magic, this power comes at a price.

The main reason why the language that is defined as regular expressions is so
hard to read is that it dates back [as far as 1956](http://en.wikipedia.org/wiki/Regular_expression#History),
and their first implementations in programming came up in the late 1960s. Back
then every single character of your code was kinda worth its weight in gold.
Memory was extremely limited, and code had to be as terse as possible.

Now, the most commonly used features of this language are the following:

* String literals: find a particular piece of text
* Anchors: the beginning and the end of the string, or a word
* Character classes: define a set of allowed characters
* Quantifiers: define how often a chacter is expected to occur
* Captures: once found, capture a particular part of the text, so we can use it

## String literals

Let's walk through some examples, to make this more practical. Let's say we
have the following text:

```ruby
text = "A regular expression is a sequence of characters that define a search pattern."
```

... and we are interested to know if it contains the words `character` and
`sentence`. In Ruby, we could use a regular expression like so:

```ruby
matches = text.match(/character/)
p matches
```

This will return an instance of the class `MatchData`. Whereas, when we look
for `sentence` we'll get `nil`:

```ruby
matches = text.match(/sentence/)
p matches
```

Note how in Ruby one can define a regular expression by enclosing it with
slashes `/`. There are other ways to define regular expressions, too, but
this is the most common one.

But that's kinda boring, right? We could just use the method `include?` for
strings, which lets us figure out the same thing. Let's spice this up a little.

## Anchors (boundaries)

The most commonly used *anchors* are: Beginning or end of the string, beginning
or end of a line, beginning or end of a word.

For example:

```ruby
text = "A regular expression is a sequence of characters that define a search pattern."

puts 'Found "A" at the beginning of the string.' if text.match(/^A/)
puts 'Found "O" at the beginning of the string.' if text.match(/^O/)

puts 'Found the string "character".' if text.match(/character/)
puts 'Found the word "character".' if text.match(/character\b/)
```

This will output:

```
Found "A" at the beginning of the string.
Found the string "character".
```

So it finds the string "character", but not the word "character". This is
because the regular expression `/character\b/` requires a *word boundary* to be
found after the *string literal* (i.e. the literal piece of text) "character".
Since in our example the text "character" is followed by another "s", the
regular expression won't match.

## Character classes

Let's say we want to find all the words that start with a vowel. For that
we can use a *character class*, i.e. a set of allowed characters. Again,
we use the anchor *word boundary* `\b`, this time to express that the vowel
needs to be at the beginning of the word.

While the method `match` returns an object (i.e. something "truthy") when the
pattern matches (and `nil` when it doesn't), the method `scan` returns an array
with all the occurances of text that match the pattern.

So let's use it:

```ruby
text = "A regular expression is a sequence of characters that define a search pattern."

p text.scan(/\b[aeiou][a-z]*\b/)

```

This will output:

```ruby
["expression", "is", "a", "of", "a"]
```

Our regular expression defines that we're looking for a piece of text that

* starts with a word boundary,
* followed by a character that is either "a", "e", "i", "o", or "u",
* and potentially (`*`) followed by any character between "a" and "z", and
* finally ends with a word boundary.

We'll explain the star `*` quantifier in a bit.

Notice something though?

Regular expressions are case sensitive. I.e. our piece of code did not match
the word "A" in the beginning of the string. In order to fix that we need
to allow uppercase letters as well:

```ruby
p text.scan(/\b[AEIOUaeiou][a-z]*\b/)
```

Our output will include the capital "A" at the beginning of the string as well:

```ruby
["A", "expression", "is", "a", "of", "a"]
```

This example also demostrates the difference between a *word boundary* and
*whitespace*.  A single space would count as whitespace, and we could use it to
match our words, too.  However, that would not work at the beginning and end of
a string. And it would not work when our word is followed by punctuation, such
as a comma or fullstop. The word boundary `\b` allows all of these, too.

So, what about the star `*` in the expression above?

## Quantifiers

This is a quantifier. It means "allow the stuff defined before zero, or any
number of times".

In our case it means that we're looking for a single vowel, followed by either
nothing, or one or many characters between "a" and "z". This means we match
both the words "A" and "a" (not followed by anything before the word boundary),
as well as the words "is", "of", and "expression" (which are followed by one or
many characters).

Does that make sense?

Let's say we want to omit single character words, but we do want to allow all
words longer than one character. For that we could change the "none, one, or
many" quantifier `*` to another quantifier `+` meaning "at least one, or many":

```ruby
p text.scan(/\b[AEIOUaeiou][a-z]+\b/)
```

This won't match the words "A" and "a", and instead output the following:

```ruby
["expression", "is", "of"]
```

What if we are looking for words that start with a vowel, and are no more than
2 characters long? We could use the quantifier `?` which means "none, or
exactly one":

```ruby
p text.scan(/\b[AEIOUaeiou][a-z]?\b/)
```

This will output:

```ruby
["A", "is", "a", "of", "a"]
```

If we remove the quantifier entirely, then the regular expression will look for
a word that starts with a vowel, followed by exactly one character:

```ruby
p text.scan(/\b[AEIOUaeiou][a-z]\b/)
```

```ruby
["is", "of"]
```

## Captures

Using the method `scan` with regular expressions like this is quite useful in
many situations. But sometimes, we need something more powerful.

Imagine we need to find all words that are followed by a word that starts with
a vowel.

Let's try using `scan` for that:

```ruby
p text.scan(/\b[A-Za-z]+\b +\b[AEIOUaeiou][a-z]*\b/)
```

The second part of this regular expression is just the same as above: Any word
that starts with a vowel, and that is one or many characters long.

Can you figure out the first part?

It also says: Match something that starts at a word boundary, then has one or
many characters between "A" and "Z" or "a" and "z" (that bit is new: you can
combine ranges as character classes), and that is followed by at least one
space.

If you run this you'll get the following output:

```ruby
["regular expression", "is a", "sequence of", "define a"]
```

Looks alright, doesn't it?

However, we were only interested in words that are immediately followed by a
word starting with a vowel. Our strings contain two words.

So either we'd have to work on these strings more (e.g. use `split` to split
off the second word). Or there's a smarter way of doing the same.

Enter captures.

In regular expressions one can "mark" certain parts of a patterns, saying:
"Give me the bits that match this stuff here". In order to mark a part of
the pattern to be *captured* you'd enclose it with parenthese, like so:

```ruby
/\b([A-Za-z]+)\b +\b[AEIOUaeiou][a-z]*\b/
```

Note how we've enclosed the first part of the pattern with parentheses.
This means "match the full pattern, but only capture the parts that
we've marked as interesting".

```ruby
p text.scan(/\b([A-Za-z]+)\b +\b[AEIOUaeiou][a-z]*\b/)
```

This returns a nested array like this:

```ruby
[["regular"], ["is"], ["sequence"], ["define"]]
```

Awesome! We get all the words that we were interested in.

But why is this a nested array? The method `scan` looks for each bit of text
that matches the given pattern (regular expression). It then extracts all the
"marked" (captured) parts from it, and keeps these as an array. As there can be
many occurances that match the pattern, and each of them can have many
captures, we get back a nested array.

Let's capture the second word (starting with a vowel) as well to demonstrate
this:

```ruby
p text.scan(/\b([A-Za-z]+)\b +\b([AEIOUaeiou][a-z]*)\b/)
```

This will return:

```ruby
[["regular", "expression"], ["is", "a"], ["sequence", "of"], ["define", "a"]]
```

## More on character classes

So far we have used character classes like `[aeiou]` (listing all allowed
characters literally), and `[a-z]` (specifying a range of characters).

There's more to these.

One can negate classes by prepending a "not" character `^` inside the square
brackets. E.g. `[^AEIOUaeiou]` allows every character that is not a vowel.
So we can find all words that do *not* start with a vowel like so:

```ruby
p text.scan(/\b[^AEIOUaeiou ][^ ]*\b/)
```

This means: Start at a word boundary, and allow everything that is not a vowel
or a space as a first character, when it is optionally followed by one or many
characters that are not a space, followed by a word boundary.

This will output:

```ruby
["regular", "sequence", "characters", "that", "define", "search", "pattern"]
```

Also, regular expressions come with "baked-in", predefined classes. For example
`\d` means "any digit". Here's a list of common classes:

* `\d` is the same as `[0-9]` (any digit)
* `\D` is the same as `[^0-9]` (everything except digits)
* `\w` is the same as `[A-Za-z_\-]`, called *word character* (i.e. this
  allows all lowercase and uppercase latin letters, as well as underscores and
  dashes)
* `\W` is the same as `[^A-Za-z_\-]` (everything that is not a word character)
* `\s` means "any whitespace", including spaces, tabs, and linebreaks
* `\S` everything that is not whitespace

That means we could refine our expression from above:

```ruby
/\b[A-Za-z]+\b +\b[AEIOUaeiou][a-z]*\b/
```

Like so:

```ruby
/\b\w+\b +\b[AEIOUaeiou]\w*\b/
```

This might yield slightly different results if we have words that contained
dashes or underscores, but it is same in our case:

```ruby
["regular expression", "is a", "sequence of", "define a"]
```

One can also combine these predefined classes with each other, and literal
charachters. For example `[\w!?]+` would find a sequence of at one or many
characters that is a word character, an exclamation or a question mark.

## Anything

Finally, there's one special character that matches anything: the dot `.`.

I.e. the regular expression `.*` matches "any character, zero, or any number of
times". This may be useful if you are looking, for example, for whatever text
is enclosed in parentheses:

```ruby
text = "Regular expressions are powerful (and sometimes confusing, even to experienced developers)."
p text.scan(/\(.*\)/)
```

Notice the backslashes before the opening and closing parentheses? We want to
match these literal characters, and not use them with their special meaning of
capturing their content here. Therefore we need to escape them to tell Ruby:
Yep, we really mean a parenthesis here.

By the way this will output the following:

```ruby
["(and sometimes confusing, even to experienced developers)"]
```

Whoops. Maybe we actually also do want to capture a part or this, and omit the
actual parentheses from the result. We can do that by placing an extra pair
of un-escaped (capturing) parentheses inside the escaped (literal) ones:

```ruby
p text.scan(/\((.*)\)/)
```

And now we'll get this result, which has the parentheses stripped off:

```ruby
[["and sometimes confusing, even to experienced developers"]]
```

## Rubular

Confused? Don't worry. We all are.

Try to remember some of the most basic, simple stuff. Then try using it, maybe
in your text editor, when you search for a certain phrase. Over time you'll remember
a few more things, bit by bit, and things will become a little less confusing.
Writing a long, complicated regular expression, that actually works, without
thinking, trying, and re-trying a lot is something that only few developers
actually can do - and the author of this book isn't one of them.

If you cannot figure out a certain regular expression, or if you want to
experiment with something then [Rubular](http://rubular.com) is a great tool
for that. Enter some text to the "test string" text area, and then start
writing a regular expression, one bit after another. The app will display the
parts that match, and your captures if you define some.
