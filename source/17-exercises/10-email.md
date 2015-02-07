# The Email Class

## Exercise 10.1

In a new file `10-email-1.rb` write a class `Email` that has a `subject`,
`date`, and `from` attribute. Make it so that these attributes can be populated
through `new` and `initialize`.

The following code

```ruby
class Email
  # fill in this class body
end

email = Email.new("Homework this week", "2014-12-01", "Ferdous")

puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"
```

should then output the following:

```
Date:    2014-12-01
From:    Ferdous
Subject: Homework this week
```

<a href="/solutions/10-email-1.rb" class="solution">Show solution</a>

## Exercise 10.2

Once you have this class, copy your file to `09-2_email.rb`.

Change your class so that the `initialize` method now takes a `subject` string,
and a `headers` hash. This is then more in line with how actual emails are
stored in the real world: the values `date` and `from` are stored on a hash,
which is called the "email headers".

Doing so, in the code above the only line you should change is the one that
instantiates the email object, which should now read:

```ruby
email = Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Ferdous" })
```

Your program should now still produce the same output.

<a href="/solutions/10-email-2.rb" class="solution">Show solution</a>
