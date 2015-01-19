# Working with Arrays (2)

Note: At the moment these exercises require reading up until "Block return values".
You should know how to use the method `collect` on arrays.

Before you get started, make sure you have your text editor and terminal open, and
you have navigated to your exercises directory in the terminal. E.g. `cd
~/ruby-for-beginners/exercises`.


## Exercise 5.1

Create a new, empty file. Save it as `05-arrays_2-1.rb`. Fill in the following line:

```ruby
words = ["one", "two", "three", "four", "five"]
# your code goes here
p words
```

So that you get the following output:

```ruby
["one", "three", "five"]
```

<a href="/solutions/05-arrays_2-1.rb" class="solution">Show solution</a>


## Exercise 5.2

Copy your file to a new file: `cp 05-arrays_2-1.rb 05-arrays_2-2.rb`, then open this
new file.

Now change your code so that you get the following output:

```ruby
["One", "Three", "Five"]
```

Hint: Google for `ruby string uppercase first letter`

<a href="/solutions/05-arrays_2-2.rb" class="solution">Show solution</a>


## Exercise 5.3

Copy your file to a new file: `cp 05-arrays_2-2.rb 05-arrays_2-3.rb`, then open this
new file.

Now change your code so that you get the following output:

```ruby
["One <3", "Three <3", "Five <3"]
```

Hint: Use string interpolation for this.

<a href="/solutions/05-arrays_2-3.rb" class="solution">Show solution</a>


## Exercise 5.4

Copy your file to a new file: `cp 05-arrays_2-3.rb 05-arrays_2-4.rb`, then open this
new file.

Now change your code so that you get the following output:

```ruby
["One <3", "Three <3<3<3", "Five <3<3<3<3<3"]
```

<a href="/solutions/05-arrays_2-4.rb" class="solution">Show solution</a>


## Exercise 5.5

Copy your file to a new file: `cp 05-arrays_2-4.rb 05-arrays_2-5.rb`, then open this
new file.

Now change your code so that you get the following output (hint: again, that's
now a string, not an array):

```
One <3, Three <3<3<3, Five <3<3<3<3<3
```

<a href="/solutions/05-arrays_2-5.rb" class="solution">Show solution</a>


## Exercise 5.6

Copy your file to a new file: `cp 05-arrays_2-5.rb 05-arrays_2-6.rb`, then open this
new file.

Now change your code so that you get the following output, using the newline
character `"\n"`:

```
One <3
Three <3<3<3
Five <3<3<3<3<3
```

<a href="/solutions/05-arrays_2-6.rb" class="solution">Show solution</a>


## Exercise 5.7

Copy your file to a new file: `cp 05-arrays_2-6.rb 05-arrays_2-7.rb`, then open this
new file.

Now change your code so that you get the following output, aligning the second
column:

```
One   <3
Three <3<3<3
Five  <3<3<3<3<3
```

Hint: As you may guess, strings have a method that is helpful for this. Ask
Google: "ruby string align".

<a href="/solutions/05-arrays_2-7.rb" class="solution">Show solution</a>
