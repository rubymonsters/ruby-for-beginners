# Working with Arrays (2)

Note: At the moment these exercises require reading up until "Block return values".

Before you get started, make sure you have your text editor and terminal open, and
you have navigated to your exercises directory in the terminal. E.g. `cd
~/ruby-for-beginners/exercises`.

## Exercise 2.1

Create a new, empty file. Save it as `arrays_1_2.rb`. Fill in the following line:

```ruby
words = ["one", "two", "three", "four", "five"]
# ...
p words
```

So that you get the following output:

```ruby
["one", "three", "five"]
```

## Exercise 2.2

Copy your file to a new file: `cp arrays_2_1.rb arrays_2_2.rb`, then open this
new file.

Now change your code so that you get the following output:

```ruby
["One", "Three", "Five"]
```

## Exercise 2.3

Copy your file to a new file: `cp arrays_2_2.rb arrays_2_3.rb`, then open this
new file.

Now change your code so that you get the following output:

```ruby
["One <3", "Three <3", "Five <3"]
```

## Exercise 2.4

Copy your file to a new file: `cp arrays_2_3.rb arrays_2_4.rb`, then open this
new file.

Now change your code so that you get the following output:

```ruby
["One <3", "Three <3<3<3", "Five <3<3<3<3<3"]
```

Now change your code so that you get the following output (hint: again, that's
now a string, not an array):

```
One <3, Three <3<3<3, Five <3<3<3<3<3
```

Now change your code so that you get the following output, using the newline
character `"\n"`:

```
One <3
Three <3<3<3
Five <3<3<3<3<3
```

Now change your code so that you get the following output, aligning the second
column:

```
One   <3
Three <3<3<3
Five  <3<3<3<3<3
```

Tip: As you may guess, strings have a method that is helpful for this. Ask
Google: "ruby string align".
