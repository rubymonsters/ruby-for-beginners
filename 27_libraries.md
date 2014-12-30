#### Bonus: Using Libraries

Our `Person` class does not define an attribute accessor method for its
password, and thus, others cannot ask and retrieve it.

However, our person object could freely give them an encrypted version of it.

Actually, this is pretty similar to how authentication often times works:
Applications do not store your actual password in plain text (hopefully!). That
way, if, for some reason, they get hacked, attackers wouldn't have your actual
password. Instead they store an ecrypted version of the password.

Anyhow, we now want to add a method `encrypted_password` to the `Person` class,
which should return an *encrypted version* of the password that is stored in
the instance variable `@password`.

Encryption is one of the things in programming that require very deep knowledge,
and it is one of the things we definitely wouldn't want to implement ourselves.

So far, all the Ruby features and methods that we have used are available right
when the Ruby runtime `ruby` executes your code. However, Ruby also comes with
a ton of functionality that is not loaded (available) right away. Instead it
is stored in so called libraries (which are just Ruby files, too), and we can
to load them manually, in order to use them.

To do this, we use the method `require`, and pass it the name of the library:

```ruby
require 'digest'
```

Normally `require` statements should be placed at the very top of the file, so
it is easy to see what libraries a particular piece of code (class) uses.

(We are going to omit the `initialize` and `name` methods here, indicate the
omission with the comment `# ...`, and just keep the `password=` attribute
writer. In order to run this code make sure you keep all the methods.)

```ruby
require 'digest'

class Person
  # ...

  def password=(password)
    @password = password
  end

  def encrypted_password
    Digest::SHA2.hexdigest(@password)
  end
end
```

The library `digest` that we have now loaded, includes a something called
`Digest::SHA2`. In programming a "digest" is an algorithm to convert one string
into another string in way so the original string cannot be recovered any more.
However digesting the same string will always result in the same other, unique
string. There are a good bunch of algorithms that do this, and "sha2" is the
name of one of them.

Ok. For our example, here, we only need to understand that, once we have
required the library `digest`, we can use the method `Digest::SHA2.hexdigest`,
and it will encrypt ("digest") the string that we pass to it.

If now run the following code:

```ruby
person = Person.new("Ada")
person.password = "super secret"
puts person.encrypted_password
```

it will output

```
eabd522910ccdd77aef079feff0c7bb6486f6ab207ae6d3ed9e671208c92ab0f
```

which is the digested form of the password `super secret`. Every time you run
the program you will see the same, unique string.
