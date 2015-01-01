# Exercise: Working with hashes (2)

With the following hashes:

```ruby
languages = {
  :de => 'German',
  :en => 'English',
  :it => 'Italian',
}
dictionary = {
  :de => { :one => 'eins', :two => 'zwei', :three => 'drei' },
  :en => { :one => 'one', :two => 'two', :three => 'three' },
  :it => { :one => 'uno', :two => 'duo', :three => 'tres' }
}
```

Add code that prints out the following:

```
In German eins means one, zwei means two, drei means three.
In Italian uno means one, duo means two, tres means three.
```

Now, with the same hashes, add code that prints out the following table:

```
en one two three
de eins zwei drei
it uno duo tres
```

Now, change your code so that it aligns the table columns:

```
en one  two  three
de eins zwei drei
it uno  duo  tres
```

Now, change your code so that it adds delimiters:

```
en | one  | two  | three
de | eins | zwei | drei
it | uno  | duo  | tres
```
