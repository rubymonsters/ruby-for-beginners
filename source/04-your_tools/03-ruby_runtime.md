# Ruby runtime

The last tool you need is a Ruby runtime. This is a program that can execute
Ruby code, and it is a program that can be run in your shell (much like `cd`
and `ls`).

If you have some code in a file with the name `hello.rb`, and you have
navigated to the directory where the file is saved, then you can type the
following and hit enter, in order to execute the code:

```
ruby hello.rb
```

This will tell the `ruby` runtime to interpret the contents of the file
`hello.rb` as Ruby code, and execute it.

One can also use this program to do other things. You probably won't need
these a lot, but we think it's good to know. You can try these by typing
these commands in your terminal.

E.g. you can print out the version of the program:

```
ruby --version
```

Or execute Ruby code without storing it to a file:

```
ruby -e 'puts 123'
```
