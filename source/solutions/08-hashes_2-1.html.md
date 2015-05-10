```ruby
languages = {
  :de => 'German',
  :en => 'English',
  :es => 'Spanish',
}
dictionary = {
  :de => { :one => 'eins', :two => 'zwei', :three => 'drei' },
  :en => { :one => 'one', :two => 'two', :three => 'three' },
  :es => { :one => 'uno', :two => 'dos', :three => 'tres' }
}

selected = languages.select do |key, words|
  key == :de or key == :es
end

lines = selected.map do |key, name|
  words = dictionary[key]
  parts = words.map { |key, word| "#{key} means #{word}" }
  "In #{name}, #{parts.join(", ")}."
end

puts lines.join("\n")
```
