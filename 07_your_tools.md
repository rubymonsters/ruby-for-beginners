# Your tools

When you start learning programming in Ruby you'll need three tools: A text
editor, a terminal, and a Ruby runtime.

As a programmer you'll spend tons of time working with your text editor and
terminal (or "in" them, as we say). It makes sense for you to learn how to use
them, and how to customize them so you they fit your taste.

There are also text editors that can integrate a terminal window, so you don't
have to switch between applications. And there are online services that even
integrate all of this as a web application, with a nice interface in your
browser.

Feel free to try all these things out, and play with them as much as you like.
However, for our study groups, we have found that using the simplest tools
possible, at least for a while, works best: It reduces the amount of things
people need to learn in the beginning, and everyone learns the same few basic
things that are required to run a Ruby program in this environment.

#### Text editor

For our study groups we recommend using Sublime Text as a text editor, which
you can download and run on Mac OSX, Ubuntu, or Windows. This is an editor that
has been specifically designed for writing code, comes with a lot of great
tools, and it can be customized easily.

Other text editors that might be worth looking at are Atom, Textmate 2, and, if
you like to use some of the powerful oldschool tools from the early times of
Unix, VIM and Emacs. These are all great editors to use.

Whatever editor you use, you want it to insert 2 spaces when you hit the "tab"
key. Make sure your editor is configured to do this.

For Sublime Text you can do the following: In the menu item "Sublime Text" go
to "Preferences" and select "Settings - User". This opens up a configuration
file, that you can edit just like any other file. Make sure it looks like this:

```
{
  "tab_size": 2,
  "translate_tabs_to_spaces": true
}
```

#### Terminal

Every operating system comes with some kind of terminal application built in,
and they'll be fine to use for us.

A terminal is an application that doesn't do much more but provide a window
to run another program, a shell. A shell is a text based program, so it does
not have a window, and thus needs a terminal to be run on your graphical user
interface.

A shell is an interactive program that waits for you to type a command and hit
enter (or "return"). It will then run the command, display any output, and then
sit and wait for you to type the next command.

This is how working with computers was done in early times before there was the
idea of a graphical user interface that has things like clickable icons,
windows, and a mouse in order to use them. Instead, everything was done by the
way of typing commands.

While this might take a little while for you to get used to, you'll discover
why many programmers feel that working with the shell helps them be so much
more productive and get simple things done so much quicker than using a mouse
and a graphical interface.

The default settings for most terminal applications that come built in to
operating systems are quite poor, unfortunately. For example the Terminal.app
on Mac OSX opens a tiny little mini window with a very small font. You want
make sure to make the window much (much!) bigger, and find the settings to pick
a bigger font size. As a programmer, the terminal (along with your editor) is
your new home. You want to be as comfortable reading and writing in your
terminal as in any other application.

Once you have started the terminal program you will see your shell's prompt,
and can start typing commands. You'll want to learn at least the command `cd`
which allows you to navigate to a particular directory (where you have stored
your code), and the command `ls` which lists the contents of a directory.

#### Ruby runtime

The last tool you need is a Ruby runtime. This is a program that can execute
Ruby code, and it is a program that can be run in your shell (much like `cd`
and `ls`).

If you have some code in a file with the name `hello.rb`, and you have
navigated to the directory where the file is saved, then you can type the
following and hit enter, in order to execute the code:

```
ruby hello.rb
```

This will tell the `ruby` runtime to interpret the content of the file
`hello.rb` as Ruby code, and execute it.

#### Programming workflow

In order to do programming excercises on your computer, play around with things
you learned, and write actual, useful programs you want to learn the following
workflow:

* Write some code in your text editor.
* Save the code to a file in a particular directory. The filename should end
  with `.rb`.
* Open your terminal.
* Navigate to that directory using `cd`.
* Execute the file using `ruby`.
* Switch back and forth between the text editor and terminal, so you
  can make small changes in your code, and then run it through `ruby` to see
  what it does.

In order to switch back and forth between apps quickly you can use the keyboard
shortcut `cmd-tab` on Mac OSX, and `alt-tab` on Ubuntu and Windows.

In your shell you can use the "cursor up" key to go through your last used
commands: you don't have to type `ruby hello.rb` again. Just hit "cursor up"
and then enter to run it again.

#### IRB

One other tool that is worth mentioning, and that comes with your Ruby runtime
is `irb`. You can start it by typing `irb` in your shell and hitting enter.

Its name abbreviates "Interactive Ruby Shell", and yes, it is another kind of
shell: Just like the shell running in your terminal `irb` is also a program
that interactively waits for you to type something, and hit enter. However,
since this is a Ruby shell, it will expect that you type Ruby code instead of
system commands.

IRB is pretty handy for quickly trying something out, and it is a great tool
for exploring the language Ruby and things that come built in.

For example:

```
$ irb
> puts "Hello world!"
Hello world!
=> nil
>
```

The first line starts the IRB program. Notice how the "prompt" indicator
changes. The prompt will look a little different depending on your system and
shell configuration, but often times `$` is used to indicate that this is a
system shell prompt, while `>` is used by IRB to indicate that this is an
interactive Ruby shell.

The second line is a piece of Ruby code. When you type this line and hit enter
then Ruby will execute the code, and print out the text "Hello world!".

It will then also print out the return value for this statement, which, in this
case is `nil`. This is something that you can simply ignore for the time being.

On the last line you see IRB again waiting for input with a prompt.

You can exit the IRB session, and get back to your system shell, by typing
`exit` and hitting enter. Or you can also just hit `ctrl-d`, which does the
same thing.
