## Conditionals return values

Another extremely useful aspect about `if` and `unless` statements in Ruby is
that they return values.

Yes, that's right:

An `if` statement, with all of its branches, as a whole, evaluates to the value
returned by the statement that was last evaluated, just like a method does.

For example, instead of this:

```ruby
if number.even?
  puts "The number is even"
else
  puts "The number is odd"
end
```

we can also assign the return value of the `if` statement to a variable, and
then output it:

```ruby
message = if number.even?
  "The number is even"
else
  "The number is odd"
end

puts message
```

Also, for the same reason, if we define a method that contains nothing but a
single `if`/`else` statement, the method will, again, return the last statement
evaluated:

```ruby
def message(number)
  if number.even?
    "The number is even"
  else
    "The number is odd"
  end
end

puts message(2)
puts message(3)
```

The first method call `message(2)` will output `The number is even`, and the
second one `message(3)` will output `The number is odd`.
