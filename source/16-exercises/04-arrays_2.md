# Working with Arrays (2)

Note: At the moment these exercises require reading up until "Block return values".
You should know how to use the method `collect` on arrays.

Before you get started, make sure you have your text editor and terminal open, and
you have navigated to your exercises directory in the terminal. E.g. `cd
~/ruby-for-beginners/exercises`.

## Exercise 4.1

Create a new, empty file. Save it as `04_1-arrays.rb`. Fill in the following line:

```ruby
words = ["one", "two", "three", "four", "five"]
# ...
p words
```

So that you get the following output:

```ruby
["one", "three", "five"]
```

## Exercise 4.2

Copy your file to a new file: `cp 04_1-arrays.rb 04_2-arrays.rb`, then open this
new file.

Now change your code so that you get the following output:

```ruby
["One", "Three", "Five"]
```

Hint: Google for `ruby string uppercase first letter`

## Exercise 4.3

Copy your file to a new file: `cp 04_2-arrays.rb 04_3-arrays.rb`, then open this
new file.

Now change your code so that you get the following output:

```ruby
["One <3", "Three <3", "Five <3"]
```

Hint: Use string interpolation for this.

## Exercise 4.4

Copy your file to a new file: `cp 04_3-arrays.rb 04_4-arrays.rb`, then open this
new file.

Now change your code so that you get the following output:

```ruby
["One <3", "Three <3<3<3", "Five <3<3<3<3<3"]
```

Hint:

## Exercise 4.5

Copy your file to a new file: `cp 04_4-arrays.rb 04_5-arrays.rb`, then open this
new file.

Now change your code so that you get the following output (hint: again, that's
now a string, not an array):

```
One <3, Three <3<3<3, Five <3<3<3<3<3
```

## Exercise 4.6

Copy your file to a new file: `cp 04_5-arrays.rb 04_6-arrays.rb`, then open this
new file.

Now change your code so that you get the following output, using the newline
character `"\n"`:

```
One <3
Three <3<3<3
Five <3<3<3<3<3
```

## Exercise 4.7

Copy your file to a new file: `cp 04_6-arrays.rb 04_7-arrays.rb`, then open this
new file.

Now change your code so that you get the following output, aligning the second
column:

```
One   <3
Three <3<3<3
Five  <3<3<3<3<3
```

Tip: As you may guess, strings have a method that is helpful for this. Ask
Google: "ruby string align".
