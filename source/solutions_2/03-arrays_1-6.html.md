```ruby
numbers = [1, 2, 3, 4, 5, 6]
numbers = [numbers[1], numbers[3], numbers[5]]
p numbers

# This solution isn't terribly elegant, but at least it shows how
# you can use the value returned from an array lookup, and create
# a new array from it right away.
#
# Also possible, but not much better:

second = numbers[1]
fourth = numbers[3]
sixth  = numbers[4]
numbers = [second, fourth, sixth]

# In case you're curious, a way more elegant (and better) solution
# to this would be the following:

numbers = numbers.select { |number| number.even? }

# However, we'll need to learn more about methods and blocks before
# we'll be able to fully understand it.
```
