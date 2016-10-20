# Numbers

Numbers are simply numbers.

You can create one by writing it: `123` is Ruby code and it represents the
number one-hundred-twenty-three.

Negative numbers are created by prepending a minus `-`: This is the number
minus-ninety-nine: `-99`.

And of course there are decimal numbers, too. Again, you create one by writing
it: `12.34`.

You can also use an underscore to separate thousands places: E.g. `1_234.56` is the
number one-thousand-two-hundred-thirty-four-point-five-six.  However, this is
optional. This is the exact same number in Ruby: `1234.56`.

<p class="hint">
A number is defined by a series of digits, using a dot as a decimal mark, and
optinally an underscore as a thousands separator.
</p>

Note that different countries use different punctuation for decimal and
thousands separators. Ruby is using the same notation used in the USA, which
happens to be the exact opposite of what's used in Germany.

## Kinds of numbers

Under the hood, for reasons that are mostly technical, there are actually
different kinds of numbers:

For example there are integer numbers (those without a fraction, i.e. a dot and
decimal places), and depending on their size there are two kinds of them. For
floating point numbers there are even more. Unless you are super curious, you
can perfectly ignore all of that for now, and just think of numbers as numbers.

However, when you do calculations with numbers, keep in mind that integer
numbers ("integers") and decimal point numbers (floating point numbers, aka
"floats") are different.

If you do a calculation that uses integer number you'll always
get an integer back:

```ruby
$ irb
> 1 + 2
=> 3
```

However, if any of the numbers involved is a float, then you'll get a float back:

```ruby
$ irb
> 1.0 + 2
=> 3.0
> 1 + 2.0
=> 3.0
```

<p class="hint">
Mathematical operations result in a floating point number except if all numbers used are integer numbers.
</p>

This is, for example, important when you do a division (`/` means "divide by"):

```ruby
$ irb
> 3 / 2
=> 1
```

As you can see any decimal places will be just cut off, since the result needs
to be an integer number.

However, if you use floats:

```ruby
$ irb
> 3.0 / 2
=> 1.5
> 3 / 2.0
=> 1.5
```

<p class="hint">
Use floating point (decimal) numbers when doing devisions.
</p>

Exercises: How about doing some of the [exercises on numbers](/exercises/numbers.html)
next?
