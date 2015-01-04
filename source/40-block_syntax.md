# Alternative block syntaxes

Next to the syntax shown before, using `do` and `end`, Ruby comes with an
alternative syntax, which uses curly braces for defining a block.

These two statements do exactly the same:

```ruby
5.times do
  puts "Oh, hello!"
end

5.times { puts "hello!" }
```

Both statements define a block, which is passed to the method `times`. And
both blocks contain a single line of code.

So, when do you use one or the other syntax?

In the Ruby community there's the convention to use curly braces, if you have a
single line block and it fits nicely on the same line (as, in our example, it
does).

Whenever you need to have more than one line in your block, then you use the
syntax using `do` and `end`. Sometimes people also would use the `do` and `end`
syntax when they feel it makes the code more readable.

