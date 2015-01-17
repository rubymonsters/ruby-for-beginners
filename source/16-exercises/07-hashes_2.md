# Working with hashes (2)

## Exercise 7.1

Make a new file `7_1-hashes.rb`, and dd the following lines:

```ruby
languages = {
  :de => 'German',
  :en => 'English',
  :es => 'Spanish',
}
dictionary = {
  :de => { :one => 'eins', :two => 'zwei', :three => 'drei' },
  :en => { :one => 'one', :two => 'two', :three => 'three' },
  :es => { :one => 'uno', :two => 'dos', :three => 'tres' }
}
```

Now, at the end of the file, add code that prints out the following:

```
In German eins means one, zwei means two, drei means three.
In Italian uno means one, duo means two, tres means three.
```

## Exercise 7.2

Now, in a new file `7_2-hashes.rb`, with the same hashes from above, add code
that prints out the following table:

```
de eins zwei drei
en one two three
es uno dos tres
```

## Exercise 7.3

Copy your file to a new file `cp 7_2-hashes.rb 7_3-hashes.rb` and change your
code so that it aligns the table columns:

```
de eins zwei drei
en one  two  three
es uno  dos  tres
```

## Exercise 7.4

Copy your file to a new file `cp 7_3-hashes.rb 7_4-hashes.rb` and change your
code so that it adds delimiters:

```
de | eins | zwei | drei
en | one  | two  | three
es | uno  | dos  | tres
```
