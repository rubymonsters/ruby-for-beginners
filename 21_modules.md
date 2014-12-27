# Modules

We have created our first, little class. While we're at this, we'd also like to
introduce another language feature that Ruby has, and that is somewhat similar
to clases: modules.

In Ruby, a module is something that holds methods, just like classes do. However
modules can not be instantiated (i.e. it is not possible to create objects from
it, and modules, other than classes, do not have the method `new`).

So, what is this useful for? Modules can be included into classes, which then
makes their methods available on the class, just as if we'd copy and paste them
over to the class definition. This is useful if we have methods that we want to
reuse in many classes, but we want to keep them in a central place.

Let's have a look at this pretty artificial code:

```
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
and class that makes more sense than this, and we fully admit that this is code
rather stupid. It's good enough to quickly explain how moduls work though :)

If you run this code it will output `true`. Why is that?

The method `cream?` is defined on the module `Cream`, and all it does is always
return the value `true`. Now, this module is included into the class `Cookie`.
So, if we now instantiate a cookie, we can call the method `cream?` on it,
and it will return the value `true`.

Let's move on, and use this for our `Person` class, which then hopefully will
make more sense.

Let's assume that our application has other classes that need to encrypt things.
And we want to keep the exact way *how* we encrypt things in one place. Why?

* One reason could be that, when we want to use a different way of encrypting
  things (maybe use a stronger encryption algorithm), just change it in this
  one place, and we'll be done with it.
* Another reason could be that the encryption algorithm used can be somehow
  configured, for example via a configuration file that our application reads.
  This would then require additional logic, that we would not want to duplicate
  across all the places where we need to encrypt something.
* Another, much simpler, but sometimes valid reason could be that we simply
  want to remove the clutter to another file, so we can focus on what our
  `Person` class does, instead of having to look at the nitty-gritty details
  of how exactly encrypts things.

Anyhow. Here's how we can create a meaningful module for our application,
and use it in the class `Person`:

```
require 'digest'

module Encryption
  def encrypt(string)
    Digest::SHA2.hexdigest(string)
  end
end

class Person
  inclue Encryption

  # ...

  def password=(password)
    @password = password
  end

  def encrypted_password
    encrypt(@password)
  end
end

person = Person.new("Ada")
person.password = "super secret"
puts person.encrypted_password
```

Again, if you run this code, it will print out the encrypted version of the
password.

We have moved the noisy details of the encryption to a module, and then
included the module to the class `Person`.  This, at the very least, makes the
method `encrypted_password` much easier to read. Doesn't it?

However, there's one thing we still want to improve about this.
