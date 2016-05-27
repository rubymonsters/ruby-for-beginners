# Nothingness and the truth

Now is a good time to talk about the concepts of nothingness and truth in Ruby.

#### Nil

We have briefly mentioned that in Ruby there is an object that represents
"nothing": the object `nil`.

That's right. "Nothing" is a thing in Ruby (as well as in many other
languages), albeit a very special one. We could ramble on the philosophical
implications of this, but instead we'll just look at how this is used in
practice:

Remember how we can receive a value associated with a key from a hash?

```ruby
dictionary = { :one => "eins", :two => "zwei", :three => "drei" }
p dictionary[:one]
```

This will print out `"eins"`. However, what happens if we try to receive
the value for a key that has not been defined on the hash?

```ruby
dictionary = { :one => "eins", :two => "zwei", :three => "drei" }
p dictionary[:four]
```

This will print out `nil`. Remember that every method call always will return
*some* value? In cases where there's nothing to return, it will return `nil`,
which represents nothing :)

In Ruby, `nil`, nothing, is something else than, for example, `0`, which
represents *something*. An empty string `""`, an empty array `[]`, or empty
Hash `{}` also all represent *something*. So they're not `nil`.


#### True and false

We have also discussed that in order to represent truth, and the opposite of
it, Ruby also knows the values `true` and `false`.

You have seen them when we tried some of the methods on numbers, strings and
arrays, like `3.odd?`, `"a string".start_with?("a")`, or `[1, 2, 3].include?(2)`.

These so called predicate methods always return either `true` or `false`.

<p class="hint">
Predicate methods end with a question mark, and return <code>true</code> or
<code>false</code>.
</p>

The objects `nil`, `true`, and `false` also have classes, and you can check
that in IRB yourself: `nil.class`, `true.class` and `false.class`.

For a reason that we don't know Matz (the creator of Ruby) has decided to call
these classes `NilClass`, `TrueClass` and `FalseClass`, instead of just `Nil`,
`True` and `False`. If you ever meet him at a conference you can ask him :)


#### Truthiness and falsiness

Now, when we talked about `if` statements we used methods that actually return
`true` and `false` values, like the `odd?` method on numbers does. Comparison
operators like `==`, `<` and `>` also return `true` and `false`, as in:

```ruby
number = 3
if number >= 5
  puts "The number #{number} is greater than 5, or equal to 5"
else
  puts "The number #{number} is less than 5"
end
```

However, what happens when we use methods as conditions that do not return
`true` or `false`, but something else, for example a string, number, or `nil`?

For example, consider the following:

```ruby
dictionary = { :one => "eins", :two => "zwei", :three => "drei" }
key = :four

if dictionary[key]
  puts "The dictionary defines a value for the key #{key}."
else
  puts "The dictionary does not define a value for the key #{key}."
end
```

As we saw before `dictionary[:four]` will return `nil` because this key is
not defined. Is `nil` equivalent to `true` or `false`? Or will this raise
an error?

If you run the code above then you see that Ruby will execute the `else`
branch. That means Ruby actually considers `nil` to be equivalent to `not
true`, that is, `false`.

Now, lets use a key that actually is defined:

```ruby
dictionary = { :one => "eins", :two => "zwei", :three => "drei" }
key = :one

if dictionary[key]
  puts "The dictionary defines a value for the key #{key}."
else
  puts "The dictionary does not define a value for the key #{key}."
end
```

As you saw before `dictionary[:one]` will return `"eins"`, because that's the
value associated with the key `:one`. Again, do you think `"eins"` is
equivalent to `true` or `false`? Or will this raise an error instead?

If you run the code then you'll see that Ruby now executes the `if` branch, and
considers the condition (i.e. the string `"eins"`) to be equivalent to `true`.

Think about this for second: Ruby considers *everything* to be equivalent to
`true` that is *not* `false` or `nil`. Or put the other way around, Ruby only
considers `nil` to be equivalent to `false`.

Because "is equivalent to true" or "is equivalent to false" is quite a clunky
thing to repeat so often the programming community has come up with terms for
this: truthiness and falsiness. So we can say that the string `"eins"` is
truthy. And `nil` is the only other thing that is falsy in Ruby, except
`false` itself.

To sum this up, `if` and `unless` look at the truthiness of a the value
that is returned by the condition. Everything except `false` and `nil` is
truthy, including strings, numbers, arrays, hashes, and every other object.

This also includes the number `0`, empty strings `""`, arrays `[]` and hashes
`{}`. These aren't nothing (`nil`), instead they're something, and therefore,
in Ruby, truthy.

Here's a pattern that you  might see used when you look at other people's code:

```ruby
dictionary = { :one => "eins", :two => "zwei", :three => "drei" }
key = :one
translation = dictionary[key]

if translation
  puts "The translation for #{key} is: #{translation}."
else
  puts "The dictionary does not define a translation for the key #{key}."
end
```

If you read this out loud, does it make sense to you?

The code first looks up the translation from the `dictionary` hash. And then it
says *If there's a translation, then use it. Otherwise do something else.*

Ruby's concept of truthiness allows us to write our code in this concise way
that almost reads like English. And that's one reason why many people love Ruby
so much.


