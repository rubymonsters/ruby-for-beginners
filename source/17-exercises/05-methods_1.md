# Defining methods

## Exercise 5.1

Write a method `greet` that takes a name, prepends `"Hello "`, and appends an
exclamation mark `"!"`:

```ruby
def greet(name)
  # your code goes here
end

puts greet("Ada")
```

This should print out `Hello Ada!`.

<a href="/solutions/methods-1.html" class="solution">Show solution</a>


## Exercise 5.2

Once you've implemented the method this should print out: `Hello Ada!`.

Now change your method so that instead of always using `"Hello "` it picks a
random string from the array `["Hello", "Hi", "Ohai", "ZOMG"]`.

Every time you run the program it should print out either `"Hello Ada!"`, `"Hi
Ada!"`, `"Ohai Ada!"`, or `"ZOMG Ada!"`.

<p class="hint">
The method <code>shuffle</code> on arrays does, well, shuffle the array :) That
means it changes the order of the elements in the array in a random way.
</p>

<a href="/solutions/methods-2.html" class="solution">Show solution</a>


## Exercise 5.3

Write a method that converts a distance (a number) from miles to kilometers:

```ruby
def miles_to_kilometers(miles)
  # your code goes here
end

puts miles_to_kilometers(25)
```

This should print out:

```
40.2336
```

<a href="/solutions/methods-3.html" class="solution">Show solution</a>


## Exercise 5.4

Write a method `leap_year?` that takes a year (a number), and calculates if it is a leap year.

```ruby
def leap_year?(year)
  # your code goes here
end

p leap_year?(2012)
p leap_year?(2015)
```

This should print out:

```
true
false
```

Hint: The operator `%` returns the rest of a division. E.g. `14 % 3` returns `2`.

Bonus: Also make it so that the method returns `true` for the year `2000` and
`false` for `1900` ... because that's really the definition of leap years.

<a href="/solutions/methods-4.html" class="solution">Show solution</a>

