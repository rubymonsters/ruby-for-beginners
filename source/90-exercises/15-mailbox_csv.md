# Reading from a CSV File

So far our program has all the email data *hardcoded*: All the data is baked
right into our code. Everytime you run it, it will display all the same emails.
Obviously that's not a very useful for a real world program.

Let's change this to read our data from an external data source instead.

One very simple and pretty popular way to store data to files is using the
format CSV. This stands for "comma separated values" (although, often times
semicolons are used as a separator instead of commas), and it is something that
spreadsheets can read and export. Being able to work with CSV can be pretty
handy: just write a little Ruby script, and filter that data, or work with it
otherwise.

The first line in the code below `require "csv"` makes Ruby's CSV library
available to your program so that you can then use the class `CSV`.

## Exercise 15.1

Building on the same code from the last exercises, your objective is to
read the email data from a file `emails.csv`. This file should be stored
in the same directory as your Ruby program, and contain the following data:

```csv
Date,From,Subject
2014-12-01,Ferdous,Homework this week
2014-12-01,Dajana,Keep on coding! :)
2014-12-02,Ariane,Re: Homework this week
2014-12-11,Maria,I'm back in Berlin
```

You can create that file by copying the four lines from above to your editor.

In order to complete this exercise you'll need to find out how to:

* Read the contents of a file to Ruby, as a string
* Parse this string as CSV (google for "ruby csv" and/or look at the documentation)
* For each of the rows, ignoring the header line, create an `Email` instance

In other words, you should replace the following lines of code:

```ruby
emails = [
  Email.new("Homework this week", { :from => "Ferdous", :date => "2014-12-01" }),
  Email.new("Keep on coding! :)", { :from => "Dajana", :date => "2014-12-01" }),
  Email.new("Re: Homework this week", { :from => "Ariane", :date => "2014-12-02" })
]
```

Once you have figured out how to read and parse the CSV file, and create an
array of `Email` instances out of that data, your next task is to encapsulate
all of that into a class `EmailsCsvStore`. This class should take a filename,
and have a method `read`, which returns the emails array.

In the end that part of the code should read:

```ruby
require "csv"

class Email
  # your class from the last exercise
end

class Mailbox
  # your class from the last exercise
end

class MailboxHtmlFormatter
  # your class from the last exercise
end

class EmailsCsvStore
  def initialize(filename)
    # fill in this method
  end

  def read
    # fill in this method
  end
end

store = EmailsCsvStore.new('emails.csv')
emails = store.read
mailbox = Mailbox.new("Ruby Study Group", emails)
formatter = MailboxHtmlFormatter.new(mailbox)

# your code from the last exercise, writing the file
```

<a href="/solutions/mailbox_csv-1.html" class="solution">Show solution</a>
