# Truthiness

## Exercise 9.1

Make a new file `truthiness-1.rb`, and add the following lines:

This exercise is about validating what we've learned about truthiness.

You have the following array:

```ruby
objects = [true, false, 0, 1, "", [], Object.new, Class.new, Module.new]
```

Add some code that outputs the following table. The last column should be
filled in with by either `true` or `false` depending what the operation
`!!object``, which is the same as `not not object` for each of the objects
returns:

```
object                     | !!object
true                       | [true|false]
false                      | [true|false]
nil                        | [true|false]
0                          | [true|false]
1                          | [true|false]
""                         | [true|false]
[]                         | [true|false]
#<Object:0x007fb3dc0ea1b8> | [true|false]
#<Class:0x007fb3dc0e2cd8>  | [true|false]
#<Module:0x007fb3dc0d9ea8> | [true|false]
```

You can use the method `inspect` in order to, for each of the values, get a
representation that looks like the code.

Of course you will get different object ids for the object, class, and module
instances everytime you run your code.

So let's prettify this table by removing the object ids. You can do this
calling `sub(/:.*>/, ">")` on whatever `inspect` returns.

Your table should now look like this:

```
object    | !!object
true      | true
false     | false
nil       | false
0         | true
1         | true
""        | true
[]        | true
#<Object> | true
#<Class>  | true
#<Module> | true
```

<a href="/solutions/truthiness-1.html" class="solution">Show solution</a>


## Bonus: Exercise 9.2

Copy your file to a new file `truthiness-2.rb`, and change your code so that
it outputs the following table. Fill each cell with the result that `==`
returns for each combination.

```
          | true      | false      | 0          | 1          | ""         | []         | #<Object> | #<Class>  | #<Module>
true      |           |            |            |            |            |            |           |           |
false     |           |            |            |            |            |            |           |           |
0         |           |            |            |            |            |            |           |           |
1         |           |            |            |            |            |            |           |           |
""        |           |            |            |            |            |            |           |           |
[]        |           |            |            |            |            |            |           |           |
#<Object> |           |            |            |            |            |            |           |           |
#<Class>  |           |            |            |            |            |            |           |           |
#<Module> |           |            |            |            |            |            |           |           |
```

Tip: Break this up in sub-tasks:

1. Write some code that collects an array of arrays containing all rows: An
   array `rows` that has many arrays, each of which holds 9 results (cells).
2. Add the value's representation to the beginning to the row. If you don't
   know how, google for "ruby array add to beginning"
3. Make sure each of the cells is 9 characters wide.
4. Join each of the row with the string `" | "`.
5. Add the table headers row.
6. Join all rows with the string `"\n"` (newline), and output the result.

<a href="/solutions/truthiness-2.html" class="solution">Show solution</a>

