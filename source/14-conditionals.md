# Conditionals

*If this is true, then do that. Otherwise do something else.*

Often we want to check for a certain condition, and then based on it, do
either one thing or another. Or we want to do something only if a condition is
true.

All practical programming languages have some way of expressing this, and in
Ruby it looks like so:

```ruby
number = 5

if number.between?(1, 10)
  puts "The number is between 1 and 10"
elsif number.between?(11, 20)
  puts "The number is between 11 and 20"
else
  puts "The number is bigger than 20"
end
```

You can probably guess what it does, and how it works, can't you?

Let's walk through it one by one:

* If you run this code it will print out `The number is between 1 and 10`,
  because the number assigned to the variable `number` on the first line is
  `5`, and for this number the method call `number.between?(1, 10)` returns
  `true`. Ruby will therefore execute the code in the `if` branch: The `if`
  branch is the block of code that comes after the line with the `if`
  statement, and that is indented by two spaces. Once it is done executing
  the `if` branch Ruby will simply ignore the rest of the statement.

* If you change the number `5` on the first line to `15`, and run the code
  again, then it will print out `The number is between 11 and 20`. In this
  case Ruby will, again, first check the first condition `number.between?(1,
  10)`, but this time this method call returns `false`. Therefore, Ruby will
  ignore the `if` branch, and check the next condition on the `elsif` line:
  `number.between?(11, 20)`. Now, this method call returns true, because `5` is
  between `11` and `20`. Ruby will therefore execute the `elsif` branch, and
  print out this message. Again, once it is done executing the `elsif` branch
  Ruby will ignore the rest of the statement.

* If you now change the number `15` to `25`, and run the code again, then it
  will print out `The number is bigger than 20`. Again, Ruby will first check
  the first condition, and find it returns `false`. It will check the second
  condition, which now also returns `false`. Therefore Ruby will then execute
  the `else` branch, and print out that message.

The `elsif` and `else` statements and branches are optional: you don't need to
have them. You can have an `if` statement without `elsif` or `else` branches,
an `if` statement only with an `else`, or you could have an `if` statement with
one or more `elsif` statements. Or combine all of them together:

* There *must* be an `if` statement and branch.
* There *can* be many `elsif` statements and branches.
* There *can* be one `else` statement and branch.

