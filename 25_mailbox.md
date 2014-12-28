# The mailbox exercise

The mailbox exercise is a milestone in the beginners group curriculum, and it
may take a little bit longer to complete it.

Fill in and complete the following class definitions.

```ruby
class Email
  def initialize(subject, headers)
    @subject = subject
    @headers = headers
  end
end

class Mailbox
  def initialize(name, emails)
    @name = name
    @emails = emails
  end
end

class MailboxTextFormatter
  def initialize(mailbox)
    @mailbox = mailbox
  end
end

emails = [
  Email.new("Homework this week", { :from => "Ferdous", :date => "2014-12-01" }),
  Email.new("Keep on coding! :)", { :from => "Dajana", :date => "2014-12-01" }),
  Email.new("Re: Homework this week", { :from => "Ariane", :date => "2014-12-02" })
]
mailbox = Mailbox.new("Ruby Study Group", emails)
formatter = MailboxTextFormatter.new(mailbox)

puts formatter.format
```

Your goal is to complete the code in a way so it outputs the following:

```
Mailbox: Ruby Study Group

+------------+---------+------------------------+
| Date       | From    | Subject                |
+------------+---------+------------------------+
| 2014-12-01 | Ferdous | Homework this week     |
| 2014-12-01 | Dajana  | Keep on coding! :)     |
| 2014-12-02 | Ariane  | Re: Homework this week |
+------------+---------+------------------------+
```

You are allowed to add as many methods to the classes `Email`, `Mailbox` and
`MailboxTextFormatter` as you deem useful. In your final solution you are not
allowed to change any of the code outside (after) the class definitions. For
debugging purposes, you can, of course, change all the code you want :)
