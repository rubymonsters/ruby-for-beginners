# Parentheses

If you have read carefully, you may have noticed that we said on the line
`puts number` above `puts` is a method call. And then later we've enclosed the
value `5` by parentheses when calling the method `add_two(3)`.

That's right: In Ruby, when you call (use) a method, you can omit the parentheses.

So these lines do exactly the same:

```ruby
puts "Hello!"
puts("Hello!")
```

And so do these:

```ruby
add_two 2
add_two(2)
```

And all of these:

```ruby
puts add_two 2
puts add_two(2)
puts(add_two 2)
puts(add_two(2))
```

So when do you use parentheses, and when do you omit them?

There is no clear rule about this, but there are some conventions. For now,
you can just stick with the convention we are using at our study groups, which
is:

Use parentheses for all method calls that take arguments, except for the
methods `puts` and `p` (and later: `require` and `include`). Also: if a method
does not take any arguments, then do not add empty parenthese, omit them.

So the idiomatic way to write the line above is:

```ruby
puts add_two(2)
```

