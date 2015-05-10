# Storing our HTML to a File

## Exercise 14.1

In this exercise our goal is to store the generated HTML for our mailbox to a
file, so that we can finally view it in an actual browser.

Your objective is to write a file (using Ruby) that contains all the HTML
from the last exercise.

Building on the last exercise, copy your file to a new file `cp mailbox_html-1.rb
mailbox_file-1.rb`  and change the last line:

Instead of passing the HTML to `puts` you should be passing it to a different
method, so that running your program writes the HTML file that we are after.
In order to find that method try googling for "ruby write file". Call this
file `emails.html`.

When you open this file in a text editor you should see the same HTML from
the last exercise. When you open it in your browser it should look like this:

![image](https://cloud.githubusercontent.com/assets/2208/5602614/5ac2058c-935a-11e4-9c01-7ff9ec3b66cb.png)

<a href="/solutions/mailbox_file-1.html" class="solution">Show solution</a>
