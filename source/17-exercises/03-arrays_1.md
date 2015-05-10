# Working with Arrays (1)

Before you get started, make sure you have your text editor and terminal open,
and you have navigated to your exercises directory in the terminal. E.g. `cd
~/ruby-for-beginners/exercises`.

## Exercise 3.1

Create a new, empty file. Save it as `arrays_1-1.rb`. Fill in the following
line:

```ruby
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# your code goes here
```

So that, when you run your code (run `ruby arrays_1-1.rb`), you get the
following output:

```ruby
5
```

<a href="/solutions/arrays_1-1.html" class="solution">Show solution</a>

## Exercise 3.2

Copy your file to a new file: `cp arrays_1-1.rb arrays_1-2.rb`, then open this
new file.

Add another line *before the line that you just added*, so that, when you run
your code, you get the following output:

```ruby
99
```

<a href="/solutions/arrays_1-2.html" class="solution">Show solution</a>

## Exercise 3.3

Make a new file `arrays_1-3.rb`, and fill in the following line:

```ruby
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# your code goes here
p numbers
```

So that you get the following output:

```ruby
[2, 4, 6, 8, 10]
```

<p class="hint">
Read the documentation for the method <code>select</code> that you can use on arrays
on the <a href="http://www.ruby-doc.org/core-2.2.0/Array.html#method-i-select">Ruby documentation</a>
</p>

<a href="/solutions/arrays_1-3.html" class="solution">Show solution</a>

## Exercise 3.4

Again, copy your last file to a new file: `cp arrays_1-3.rb arrays_1-4.rb`,
then open this new file.

Now change the code that you just added so that you get the following output:

```ruby
[10, 8, 6, 4, 2]
```

<p class="hint">
The method <code>select</code> that you used in the last exercise returns an array.
On this array (the return value) you can use another method, by, again, just
appending a dot <code>.</code> and the method name to it, i.e., to the end of the line.
</p>

<p class="hint">
There is another method that reverses the order of the array. You can
find it by googling for "ruby array reverse".
</p>

<a href="/solutions/arrays_1-4.html" class="solution">Show solution</a>

## Exercise 3.5

Again, copy your last file to a new file: `cp arrays_1-4.rb arrays_1-5.rb`,
then open this new file.

Now change your code so that you get the following output:

```ruby
[10, 8, 4, 2]
```

Bonus: Find at least three different solutions for this last change.

<a href="/solutions/arrays_1-5.html" class="solution">Show solution</a>


