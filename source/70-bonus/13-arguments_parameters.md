# Terminology: Arguments vs Parameters

We should mention that we are slightly simplifying terminology here. We
conflate two terms that normally would be defined separately: We simply use the
term "argument" for both the variable names that are defined in the arguments
list of the method definition, and the value that is passed as part of the
method call.

In programming, normally the "argument list" is called a "parameter list"
instead, and a single name on it is called a "parameter". On the other hand,
only the objects passed when calling the method are referred to as "arguments".

E.g. in the code ...

```ruby
def add_two(number)
  number + 2
end

puts add_two(3)
```

... the word `number` in the first line is a "parameter", whereas `3` in the
last line is an "argument".

We found making this distinction in our beginners classes unnecessarily
confusing, and thus ignore it. We simply call both these things "arguments",
and point out that they create a local variable inside of the method body.

So, now you know :)
