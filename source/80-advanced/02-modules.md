# Modules

It now makes sense to introduce another language feature in Ruby: modules.

In Ruby, modules are somewhat similar to classes: they are things that hold
methods, just like classes do. However, modules can not be instantiated. I.e.,
it is not possible to create objects from a module. And modules, unlike classes,
therefore do not have a method `new`.

So, what are modules useful for?

With modules you can share methods between classes: Modules can be included
into classes, and this makes their methods available on the class, just as if
we'd copied and pasted these methods over to the class definition.

This is useful if we have methods that we want to reuse in certain classes, but
also want to keep them in a central place, so we do not have to repeat them
everywhere.

Let's have a look at this pretty contrived code:

```ruby
module Cream
  def cream?
    true
  end
end

class Cookie
  include Cream
end

cookie = Cookie.new
p cookie.cream?
```

We still haven't been able to come up with a better minimal example of a module
and class that makes more sense than this. And we fully admit that this code
is rather weird. However, it's good enough to quickly explain how modules work :)

If you run this code it will output `true`. Why is that?

The method `cream?` is defined on the module `Cream`, and all it does is always
return the value `true`. Now, this module is included into the class `Cookie`.
So, if we now instantiate a cookie, we can call the method `cream?` on it,
and it will return the value `true`.

Cool. Let's move on and use this for our `Person` class, which will hopefully
then make more sense.

Let's assume that our application has other classes that need to encrypt things.
And we want to keep the exact way of *how* we encrypt things, the *implementation*
in one single place.

Why would we want to do that?

* One reason could be that when we want to switch to a different way of
  encrypting things (maybe use a stronger encryption algorithm), we would then
  only need to change it in this one place, in our module, and be done with it.
* Another reason could be that we want the encryption algorithm to be somehow
  configurable, for example in a configuration file that our application reads.
  This would then require additional logic that we would not want to duplicate
  across all the places where we need to encrypt something: we'd want all this
  to be kept in a central place.
* Another, much simpler, but sometimes also valid reason could be that we
  simply want to move some clutter out of sight, and hide it away in another
  file: so we can focus on what our `Person` class does, instead of having to
  look at the nitty-gritty details of how exactly we encrypt things.

Anyhow. Here's how we can create a meaningful module for our application,
and then use it in the class `Person`:

```ruby
require 'digest'

module Encryption
  def encrypt(string)
    Digest::SHA2.hexdigest(string)
  end
end

class Person
  include Encryption

  # ...

  def encrypted_password
    encrypt(@password)
  end
end

person = Person.new("Ada")
person.password = "super secret"
puts person.encrypted_password
```

If you run this code, it will print out the same, encrypted version of the
password: cool, that's what we want.

We have moved the noisy details of the encryption algorithm to a module, and
then included the module to the class `Person`. This, at the very least, makes
the method `encrypted_password` much easier to read. Doesn't it?

We refer to the process of moving some logic (code) from one method to another
new method as "extracting a method". In our case we have extracted the method
`encrypt` from the method `encrypt_password`. When we do this, methods usually become
shorter and more readable.
