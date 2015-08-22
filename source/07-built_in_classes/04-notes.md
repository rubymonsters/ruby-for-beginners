<!---
For example, remember our code example from the chapter about [Arrays](/more_built_in_classes/arrays.html):

```ruby
$ irb
> words = ["one", "two", "three"]
> words[0]
=> "one"
> words[1]
=> "two"
```

This lookups return `"one"`, and `"two"`, because the array contains elements
on these positions.

What if we print out the element on `3` (the fourth position) though, or `4`,
which do not exist not exist?

Right, we get back `nil`, meaning "nothing":

```ruby
> words = ["one", "two", "three"]
> words[3]
=> nil
> words[4]
=> nil
```

You'll learn later that every operation ("method") in Ruby always returns
exactly one thing (i.e. one object), and that's why there needs to be a
"thing" that represents "nothing".

This will start to feel pretty natural to you pretty soon.
-->
