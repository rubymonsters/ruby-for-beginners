# Combining Methods

We've discussed how to define a method, and how to call (use) it.

What if one method is not enough?

We can, of course, call methods from other methods.

For example, we could re-implement our method `add_two` using another method
`add_one`, and simply call it twice:

```ruby
def add_one(number)
  number + 1
end

def add_two(number)
  number = add_one(number)
  add_one(number)
end

puts add_two(3)
```

This would output `5` just like our previous examples. Do you understand how it
works?


