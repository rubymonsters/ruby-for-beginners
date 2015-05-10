# Working with Arrays (2)

Note: At the moment these exercises require reading up until "Block return values".
You should know how to use the method `collect` on arrays.

Before you get started, make sure you have your text editor and terminal open, and
you have navigated to your exercises directory in the terminal. E.g. `cd
~/ruby-for-beginners/exercises`.


## Exercise 6.1

Create a new, empty file. Save it as `arrays_2-1.rb`. Fill in the following line:

```ruby
words = ["one", "two", "three", "four", "five"]
# your code goes here
p words
```

So that you get the following output:

```ruby
["one", "three", "five"]
```

<a href="/solutions/arrays_2-1.html" class="solution">Show solution</a>


## Exercise 6.2

Copy your file to a new file: `cp arrays_2-1.rb arrays_2-2.rb`, then open this
new file.

Now change your code so that you get the following output:

```ruby
["One", "Three", "Five"]
```

<p class="hint">
Google for <code>ruby string uppercase first letter</code>.
</p>

<a href="/solutions/arrays_2-2.html" class="solution">Show solution</a>


## Exercise 6.3

Copy your file to a new file: `cp arrays_2-2.rb arrays_2-3.rb`, then open this
new file.

Now change your code so that you get the following output:

```ruby
["One <3", "Three <3", "Five <3"]
```

<p class="hint">
Use string interpolation for this.
</p>

<a href="/solutions/arrays_2-3.html" class="solution">Show solution</a>


## Exercise 6.4

Copy your file to a new file: `cp arrays_2-3.rb arrays_2-4.rb`, then open this
new file.

Now change your code so that you get the following output:

```ruby
["One <3", "Three <3<3<3", "Five <3<3<3<3<3"]
```

<a href="/solutions/arrays_2-4.html" class="solution">Show solution</a>


## Exercise 6.5

Copy your file to a new file: `cp arrays_2-4.rb arrays_2-5.rb`, then open this
new file.

Now change your code so that you get the following output (hint: again, that's
now a string, not an array):

```
One <3, Three <3<3<3, Five <3<3<3<3<3
```

<a href="/solutions/arrays_2-5.html" class="solution">Show solution</a>


## Exercise 6.6

Copy your file to a new file: `cp arrays_2-5.rb arrays_2-6.rb`, then open this
new file.

Now change your code so that you get the following output, using the newline
character `"\n"`:

```
One <3
Three <3<3<3
Five <3<3<3<3<3
```

<a href="/solutions/arrays_2-6.html" class="solution">Show solution</a>


## Exercise 6.7

Copy your file to a new file: `cp arrays_2-6.rb arrays_2-7.rb`, then open this
new file.

Now change your code so that you get the following output, aligning the second
column:

```
One   <3
Three <3<3<3
Five  <3<3<3<3<3
```

<p class="hint">
As you may guess, strings have a method that is helpful for this. Ask
Google: "ruby string align".
</p>

<a href="/solutions/arrays_2-7.html" class="solution">Show solution</a>
