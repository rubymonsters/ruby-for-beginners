```ruby
words = ["one", "two", "three", "four", "five"]
words = words.select.with_index { |word, ix| ix.even? }
words = words.map { |word| word.capitalize }

word = words.max_by { |word| word.length }
width = word.length

words = words.map.with_index do |word, ix|
  hearts = "<3" * (ix + 1)
  "#{word.ljust(width)} #{hearts}"
end

puts words.join("\n")
```
