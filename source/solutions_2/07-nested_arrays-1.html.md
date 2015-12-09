```ruby
numbers = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

sums = numbers.map do |row|
  sum = 0
  row.each { |number| sum = sum + number }
  sum
end

p sums

# Using inject is a better, because more succinct:
#
# sums = numbers.map do |row|
#   row.inject(0) { |sum, number| sum + number }
# end
#
# And you can even do:
#
# sums = numbers.map { |row| row.inject(&:+) }
#
# This last solution is pretty "magical", and hard to explain at this point.
# But we thought we'd show it :)
```
