# The Mailbox Html Formatter

## Separation of concerns

One question that may have come up while working on the mailbox text formatter
exercise is:

Why would we have a separate class for formatting the ASCII table (that is, a
plain text table that uses characters like `+`, `-`, and `|`)?

The reason is: We want each one of our classes to encapsulate one concept that
is useful in our application. We also say: each one of our classes should be
*concerned* with one responsibility.

An email vaguely resembles the concept of an analog letter, written on paper:
some message is being sent from one person to another. Nowadays everyone knows
what an email is: it stores all information about this particular message. The
same is true for mailboxes, which are used to store a bunch of emails.
Formatting a number of emails in order to be displayed on a text based terminal
is a very different concept, and concern.

Therefore it makes a lot of sense to have three different classes implement each
one of these concepts, or concerns. And it even makes *so* much sense that it is
called a design principle in programming: The principle of [separation of
concerns](http://www.wikiwand.com/en/Separation_of_concerns).

Aside from being comprehensible and mapping to concepts that we already know,
one other advantage is: We can now easily implement other formatter classes
that format our emails in a different way, suitable to be displayed in other
media.

And that's what this exercise is about: We want to display our mailbox contents
in HTML, the format that browsers like to use. If you are unfamiliar with what
HTML is, and how it looks like, you can read up on it
[here](http://webapps-for-beginners.rubymonstas.org/html.html).
This will be our first step towards learning how to build a web application.

## Model, View, Controller

Before we get to that, we'd like to point out one other aspect, that you'll
remember when we get to talk about the architecture that Rails use to structure
and separate concerns, called "model, view, controller".

* The two classes `Email` and `Mailbox` in your application are *models*: they
  are concerned with modelling those "real-world" things that your users are
  interested in: they want to work with emails.
* The class `MailboxTextFormatter` on the other hand is a *view*: It is used in
  order to generate a certain representation, in a format that is suitable to a
  certain medium (the terminal, in our case).
* You don't have a *controller* class so far, but the little bit of code at the
  end of the file does what a controller usually would do: it generates some
  models (the emails, and the mailbox objects) and passes them to the view (the
  formatter) in order to be rendered into something that can then be returned
  and displayed.

If this doesn't make a whole lot of sense to you at the moment, don't worry.
You'll understand it more once we build our first Rails application.

## Exercise 13.1

Ok, now to our exercise. We will  start over with the same code again, except
that our formatter class now will be called `MailboxHtmlFormatter`.

Copy your file `mailbox_text-1.rb` to `mailbox_html-1.rb` and change it
like so. Then fill in the `MailboxHtmlFormatter` class.

```ruby
class Email
  # your class from the last exercise
end

class Mailbox
  # your class from the last exercise
end

class MailboxHtmlFormatter
  # fill in this class body
end

emails = [
  Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
  Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
  Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]
mailbox = Mailbox.new("Ruby Study Group", emails)
formatter = MailboxHtmlFormatter.new(mailbox)

puts formatter.format
```

Your goal is to complete the code in a way so it outputs the following:

```html
<html>
  <head>
    <style>
      table {
        border-collapse: collapse;
      }
      td, th {
        border: 1px solid black;
        padding: 1em;
      }
    </style>
  </head>
  <body>
    <h1>Ruby Study Group</h1>
    <table>
      <thead>
        <tr>
          <th>Date</th>
          <th>From</th>
          <th>Subject</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>2014-12-01</td>
          <td>Ferdous</td>
          <td>Homework this week</td>
        </tr>
        <tr>
          <td>2014-12-01</td>
          <td>Dajana</td>
          <td>Keep on coding! :)</td>
        </tr>
        <tr>
          <td>2014-12-02</td>
          <td>Ariane</td>
          <td>Re: Homework this week</td>
        </tr>
      </tbody>
    </table>
  </body>
</html>
```

Does that look scary? A little bit, maybe. It's probably fair
to say that manually writing HTML isn't very popular amongst most programmers.
Therefore there are quite a few tools that make our lives easier. And your task
is to write such a tool.

Also, this exercise should actually be easier for you to complete than the
previous one. You already have a bunch of practice in iterating over emails,
and working with arrays and strings. And this time, you don't need to deal with
the maximum length of strings per column. You can just interpolate things
together.

<a href="/solutions/mailbox_html-1.html" class="solution">Show solution</a>

