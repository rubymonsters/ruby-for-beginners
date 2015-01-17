# Numbers

Numbers are simply numbers. You create one by writing it: `12.34` is Ruby code
and it represents the number twelve-point-three-four.

Under the hood, for reasons that are mostly technical, there are actually
different kinds of numbers:

For example there are integer numbers (those without a comma and decimal
places), and depending on their size there are two kinds of them. For floating
point numbers there are even more. Unless you are super curious, you can
perfectly ignore all of that for now, and just think of numbers as numbers.

However, when you do calculations with numbers, keep in mind that integer
numbers ("integers") and floating point numbers ("floats") are different.

If you do a calculation that starts with an integer you'll eventually always
get an integer back:

```ruby
$ irb
> 1 + 2.0
3
```

And if you start the expression with a float then you'll get a float back:

```ruby
$ irb
> 1.0 + 2
3.0
```

This is important when you do a division:

```ruby
$irb
> 3 / 2
1
```

As you can see any decimal places will be just cut off, since the result needs
to be an integer number.

However, if you start with a float:

```ruby
$irb
> 3.0 / 2
1.5
```
