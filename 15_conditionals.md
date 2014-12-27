# Conditionals

*If this is true, then do that. Otherwise do something else.*

Often times we want to check for a certain condition, and then based on it, do
either one thing or another. Or we want to do something only if a condition is
true.

All practical programming languages have some way of expressing this, and in
Ruby it looks like so:

```
number = 5

if number.between?(1, 10)
  puts "The number is between 1 and 10."
elsif number.between?(11, 20)
  puts "The number is between 11 and 20."
else
  puts "The number is bigger than 20."
end
```

You can probably guess how this works, and what it does, but let's walk through
it one by one:

* If you run this code it will print out `The number is between 1 and 10.`, because
  the number assigned to the variable `number` on the first line is `5`, and for
  this number the method call `number.between?(1, 10)` returns `true`. Ruby therefor
  will execute the code in the `if` branch. (The `if` branch is the code that
  comes after the line with the `if` statement, and that is indented by two
  spaces).

* If you change the number `5` to `15`, and run the code again, then it will print
  out `The number is between 11 and 20.`. In this case, again, Ruby will first
  check the first condition `number.between?(1, 10)`, but this time this method
  call returns `false`. Therefor, Ruby will ignore the `if` branch, and check
  the next condition on the `elsif` line: `number.between?(11, 20)`. Now, this
  method call returns true, because `5` is between `11` and `20`. Ruby will
  therefor execute the `elsif` branch, and print out this message.

* If you now change the number `15` to `25`, and run the code again, then it will
  print out `The number is bigger than 20.`. Again, Ruby will first check the first
  condition, and find it returns `false`. It will check the second condition, which
  also returns `false` in this case. Therefor Ruby will then execute the `else`
  branch, and print out that message.

The `elsif` and `else` statements and branches are optional: you don't need to
have them. You can have an `if` statement without `elsif` or `else` branches,
an `if` statement only with an `else`, or you could have an `if` statement with
one or more `elsif` statements. Or combine all of them together.

There *must* be an `if` branch, there *can* be many `elsif` branches, and there
*can* be a single `else` branch.

##### Trailing if

One particularly nice feature in Ruby is that we can append the `if` statement
to the code on the `if` branch if it's just a single line. So instead of this:

```
if number.odd?
  puts "The number is odd."
end
```

we can also write:

```
puts "The number is odd." if number.odd?
```

which not only saves us two lines of space, but also reads great!

##### Unless

Also, next to `if` Ruby also knows a statement `unless` for when we want to do
something if the condition does *not* evaluate to true. And again, we can also
append the `unless` statement to the end of the line, so these two are the same:

```
unless number.odd?
  puts "The number is not odd."
end

puts "The number is not odd." unless number.odd?
```

##### Conditionals return values

Another extremely useful aspect about `if` and `unless` statements in Ruby is
that they, just like methods, return values. Yes, that is true.

An `if` statement, with all of its branches, as a whole, also evaluates to the
value returned by the statement that was last evaluated.

For example, instead of this:

```
if number.even?
  puts "The number is even."
else
  puts "The number is odd."
end
```

we can also assign the return value of the `if` statement to a variable, and
then output it:

```
message = if number.even?
  "The number is even."
else
  "The number is odd."
end

puts message
```

Also, for the same reason, if we define a method that contains nothing but a
single `if`/`else` statement, the method will, again, return the last statement
evaluated:

```
def message(number)
  if number.even?
    "The number is even."
  else
    "The number is odd."
  end
end

puts message(2)
puts message(3)
```

The first method call `message(2)` will output `The number is even.`, and the
second one `message(3)` will output `The number is odd.`
