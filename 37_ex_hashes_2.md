# Exercise: Working with hashes (2)

With the following hashes:

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

Add code that prints out the following:

```
In German eins means one, zwei means two, drei means three.
In Italian uno means one, duo means two, tres means three.
```

Now, with the same hashes, add code that prints out the following table:

```
de eins zwei drei
en one two three
es uno dos tres
```

Now, change your code so that it aligns the table columns:

```
de eins zwei drei
en one  two  three
es uno  dos  tres
```

Now, change your code so that it adds delimiters:

```
de | eins | zwei | drei
en | one  | two  | three
es | uno  | dos  | tres
```
