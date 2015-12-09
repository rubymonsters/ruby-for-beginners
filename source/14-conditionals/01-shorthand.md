# Shorthand syntax

## Trailing If

One particularly nice feature in Ruby is that we can append the `if` statement
to the code on the `if` branch if it's just a single line. So instead of this:

```ruby
if number.odd?
  puts "The number is odd."
end
```

we can also write this:

```ruby
puts "The number is odd." if number.odd?
```

which not only saves us two lines, it also reads great!

## Unless

Also, as well as `if` Ruby also knows a statement `unless` for when we want to do
something if the condition does *not* apply (evaluate to true). And again, we
can also append the `unless` statement to the end of the line, so these two are
the same:

```ruby
unless number.odd?
  puts "The number is not odd."
end

puts "The number is not odd." unless number.odd?
```

