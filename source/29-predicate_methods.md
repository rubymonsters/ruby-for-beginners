# Predicate methods

In the list of method names for numbers you have seen that in Ruby we can have
methods that end with a question mark `?`. This makes them read like a question.

For example, we can ask a number if it is even or odd:

```ruby
$ irb
> 5.odd?
=> true

> 5.even?
=> false
```

Or you can ask the number if it's between two other numbers:

```ruby
> 5.between?(1, 10)
=> true

> 5.between?(11, 20)
=> false
```

Methods that end with a question mark are called "predicate methods". And they
return either `true` or `false`.

