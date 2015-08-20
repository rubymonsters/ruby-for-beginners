# The Mailbox Class

## Exercise 11.1

In a new file `mailbox-1.rb` Write a class that has a `name` and `emails`
attribute. Make it so that the these attributes can be populated through the
`initialize` method (`name` being a string, and `emails` being an array of
`Email` instances).

The following code

```ruby
class Email
  # your class from the last exercise
end

class Mailbox
  # fill in this class body
end

emails = [
  Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
  Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
  Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]
mailbox = Mailbox.new("Ruby Study Group", emails)

mailbox.emails.each do |email|
  puts "Date:    #{email.date}"
  puts "From:    #{email.from}"
  puts "Subject: #{email.subject}"
  puts
end
```

should then output the following:

```
Date:    2014-12-01
From:    Ferdous
Subject: Homework this week

Date:    2014-12-01
From:    Dajana
Subject: Keep on coding! :)

Date:    2014-12-02
From:    Arianne
Subject: Re: Homework this week
```

<a href="/solutions/mailbox-1.html" class="solution">Show solution</a>
