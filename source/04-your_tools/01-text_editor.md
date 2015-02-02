# Text Editor

For our study groups we recommend using [Sublime Text](http://www.sublimetext.com)
as a text editor, which you can download and run on Mac OSX, Ubuntu, or
Windows. This is an editor that has been specifically designed for writing
code, comes with a lot of great tools, and can be easily customized.

Other text editors that might be worth looking at are Atom, Textmate 2, and, if
you like to use some of the powerful oldschool tools from the early times of
Unix, VIM and Emacs. These are all great editors to use.

Whatever editor you use, you want it to insert 2 spaces when you hit the "tab"
key, i.e. when you want to indent your code. Make sure your editor is
configured to do this.

For Sublime Text you can do the following: In the menu item "Sublime Text" go
to "Preferences" and select "Settings - User". This opens up a configuration
file that you can edit just like any other file. Make sure it looks like this:

```json
{
  "tab_size": 2,
  "translate_tabs_to_spaces": true
}
```

Also, we recommend enabling auto-saving your files. This will automatically
save your changes when you switch to another application (like your terminal),
and protect you from the mistake of forgetting to save:

```json
{
  "tab_size": 2,
  "translate_tabs_to_spaces": true,
  "save_on_focus_lost": true
}
```

Whenever you open a new file, make sure to save it with a filename that ends
with `.rb` first. This will tell the editor that you want this to be a Ruby
file. Your editor will start highlighting your code as Ruby code, and enable other
Ruby specific editor features. Alternatively, select "Ruby" in the extensions
menu at the bottom right.

Some keyboard shortcuts that are extremely useful to know are:

* In order to indent or unindent a single, or multiple lines of code, select
  them and hit `tab` or `shift-tab` respectively.
* In order to comment single, or multiple lines of code, select them, and
  hit `cmd-/` on Mac OSX, or `ctrl-/` on Linux/Windows.
* Cut out code with `cmd-x`, copy code with `cmd-c`, and paste it with
  `cmd-v` on Mac OSX, on Linux/Windows use the `ctrl` key instead.

