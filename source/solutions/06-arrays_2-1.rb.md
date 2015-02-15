```ruby
words = ["one", "two", "three", "four", "five"]
words.delete("two")
words.delete("four")

# better solutions:
# words = words.reject { |word| word == "two" or word == "four" }
# words = words.select.with_index { |word, ix| ix.even? }

p words
```
