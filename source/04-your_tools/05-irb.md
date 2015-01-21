# Interactive Ruby

One other tool that is worth mentioning, and that comes with your Ruby runtime,
is `irb`. You can start it by typing `irb` in your shell and hitting enter.

Its name is short for "Interactive Ruby Shell", and yes, it is another kind of
shell: Just like the shell running in your terminal `irb` is also a program
that interactively waits for you to type something, and hit enter. However,
since this is a Ruby shell, it will expect that you type Ruby code instead of
system commands.

IRB is pretty handy for quickly trying something out, and it is a great tool
for exploring the language Ruby, and things that come built in.

For example:

```ruby
$ irb
> puts "Hello world!"
Hello world!
=> nil
>
```

The first line starts the IRB program. Notice how the "prompt" indicator
changes. The prompt will look a little different depending on your system and
shell configuration, but often `$` is used to indicate that this is a
system shell prompt, while `>` is used by IRB to indicate that this is an
interactive Ruby shell.

The second line is a piece of Ruby code. When you type this line and hit enter
then Ruby will execute the code, and print out the text "Hello world!".

It will then also print out the return value for this statement, which in this
case is `nil`. This is something that you can simply ignore for the time being.

On the last line you see IRB again waiting for input with a prompt.

You can exit the IRB session, and get back to your system shell, by typing
`exit` and hitting enter. Or you can also just hit `ctrl-d`, which does the
same thing.
