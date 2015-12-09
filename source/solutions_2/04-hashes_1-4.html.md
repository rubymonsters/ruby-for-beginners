```ruby
dictionary = { :one => 'uno', :two => 'dos', :three => 'tres' }
p dictionary.key?(:one)

# There's also the method has_key?, but key? is more common:

p dictionary.has_key?(:one)
```
