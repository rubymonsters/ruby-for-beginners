# Working with Arrays (1)

Before you get started, make sure you have your text editor and terminal open,
and you have navigated to your exercises directory in the terminal. E.g. `cd
~/ruby-for-beginners/exercises`.

## Exercise 3.1

Create a new, empty file. Save it as `03-arrays_1-1.rb`. Fill in the following
line:

```ruby
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# your code goes here
```

So that, when you run your code (run `ruby 03-arrays_1-1.rb`), you get the
following output:

```ruby
5
```

## Exercise 3.2

Copy your file to a new file: `cp 03-arrays_1-1.rb 03-arrays_1-2.rb`, then open this
new file.

Add another line before the line that you just added, so that, when you run
your code, you get the following output:

```ruby
6
```

## Exercise 3.3

Make a new file `03-arrays_1-3.rb`, and fill in the following line:

```ruby
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# your code goes here
p numbers
```

So that you get the following output:

```ruby
[2, 4, 6, 8, 10]
```

Hint: Read the documentation for the method `select` that you can use on arrays
on the [Ruby documentation](http://www.ruby-doc.org/core-2.2.0/Array.html#method-i-select).

## Exercise 3.4

Again, copy your last file to a new file: `cp 03-arrays_1-3.rb 03-arrays_1-4.rb`,
then open this new file.

Now change the code that you just added so that you get the following output:

```ruby
[10, 8, 6, 4, 2]
```

Hint: The method `select` that you used in the last exercise returns an array.
On this array (the return value) you can use another method, by, again, just
appending a dot `.` and the method name to it, i.e., to the end of the line.

Hint: There is another method that reverses the order of the array. You can
find it by googling for "ruby array reverse".

## Exercise 3.5

Again, copy your last file to a new file: `cp 03-arrays_1-4.rb 03-arrays_1-5.rb`,
then open this new file.

Now change your code so that you get the following output:

```ruby
[10, 8, 4, 2]
```

Bonus: Find at least three different solutions for this last change.



