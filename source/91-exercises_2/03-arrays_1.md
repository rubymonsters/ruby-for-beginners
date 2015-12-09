# Working with Arrays (1)

In order to do these exercises you should have read at least the chapter about
[built_in_classes/arrays.html].

<p class="hint">
Make sure you have your text editor and terminal open, and you have navigated
to your exercises directory in the terminal. E.g. <code>cd ~/ruby-for-beginners/exercises</code>.
</p>

## Exercise 3.1

In the Array `[1, 2, 3, 4, 5]`, what's the index of the number `4`?

<a href="/solutions_2/arrays_1-1.html" class="solution">Show solution</a>

## Exercise 3.2

In `irb`, how can you ask the Array, and check if your previous answer was correct?

<a href="/solutions_2/arrays_1-2.html" class="solution">Show solution</a>

## Exercise 3.3

In `irb`, how can you ask the Array for the number of elements it contains?

<a href="/solutions_2/arrays_1-3.html" class="solution">Show solution</a>

## Exercise 3.1

Create a new, empty file. Save it as `arrays_1-1.rb`. Fill in the following
line:

```ruby
numbers = [1, 2, 3, 4, 5, 6]
# your code goes here
```

... so that, when you run your code (run `ruby arrays_1-1.rb`), you get the
following output:

```ruby
5
```

<a href="/solutions_2/arrays_1-4.html" class="solution">Show solution</a>

## Exercise 3.2

Copy your file to a new file: `cp arrays_1-1.rb arrays_1-2.rb`, then open this
new file.

Add another line *before the line that you just added*, so that, when you run
your code, you get the following output:

```ruby
99
```

<a href="/solutions_2/arrays_1-5.html" class="solution">Show solution</a>

## Exercise 3.3

Make a new file `arrays_1-3.rb`, and fill in the following line:

```ruby
numbers = [1, 2, 3, 4, 5, 6]
# your code goes here
p numbers
```

... so that you get the following output:

```ruby
[2, 4, 6]
```

<p class="hint">
You know how to get the individual numbers. And you know that you can list
things separated by comma, and enclosed with square brackets in order to get a
new Array. Try combining this, and "listing" the code that gets a number
from the array.
</p>

<a href="/solutions_2/arrays_1-6.html" class="solution">Show solution</a>

## Exercise 3.4

Again, copy your last file to a new file: `cp arrays_1-3.rb arrays_1-4.rb`,
then open this new file.

Now add *another* line after the one that you just added (i.e. before you
finally output the array using `p`).

Try to figure out how to transform your Array so you get the following output:

```ruby
[6, 4, 2]
```

<p class="hint">
Before you do anything else, try describing the problem in English. What
verb do you use to describe this transformation?
</p>

<p class="hint">
Look through the methods listed on the left side of the
<a href="http://ruby-doc.org/core-2.1.5/Array.html">documentation for Arrays</a>.
to see if any of these describes what you're looking for.
</p>

<a href="/solutions_2/arrays_1-7.html" class="solution">Show solution</a>

