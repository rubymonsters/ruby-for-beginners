```ruby
def leap_year?(year)
  year % 4 == 0
end

# Bonus:

def leap_year?(year)
  year % 400 == 0 or year % 100 != 0 and year % 4 == 0
end
```
