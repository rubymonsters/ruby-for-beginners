# Using Bundler

Imagine you'd want, for some reason, use an older version of a particular gem,
rather than the latest one.

Maybe the authors of this gem have made a change that breaks your application.
Of course they'd normally try to avoid this at all costs, but sometimes it
still happens. (Another, maybe more common, case is that you are working on a
Rails application that has been started a year ago, or is even older than that.
Now a new major version of Rails comes out, and ships lots of changes that
would break this application. So you want to stick to the older version of
Rails until you get around making it ready for the newer one.)

One way to use an older version of a particular gem is to simply uninstall
any newer versions from your system. E.g. you could run:

```
gem uninstall rails
gem install rails --version '~> 3'
```

This would uninstall all rails gems, and then install the latest version of
Rails that still starts with a `3` (i.e. ignoring all the newer versions that,
as time of this writing, start with a `4`).

However, this is quite cumbersome. You'd need to figure out what versions of
all the gems that you want to use are compatible with each other. And if you
ever switch from one application to another you'd have to uninstall and
reinstall all those gems over and over.

Instead, Bundler provides a much better way of picking certain gem versions
out of the plethora of gems that might be installed on your computer.

In this example we are going to use the Chronic gem, which provides a great
way to convert natural language date formats to Ruby `Time` objects.

Inside a new directory `chronic` create a file `Gemfile`, and add the following
lines:

```
source "https://rubygems.org"

gem "chronic", "~> 0.9.0"
```

The `source` directive says that we'd like to use the standard RubyGems.org
as a source for our gems. There are other sources, such as private Rubygems
servers run by companies to host their own, internal gems, or Rubygems servers
that people run in order to sell paid versions of their gems.

The `gem` directive declares that we'd like to use the gem `chronic`, and
we'd like to use any version that starts with `0.9` (for whatever reason).

Now, make sure you have `cd`ed to that directory, and run:

```
bundle install
```

You'll see that Bundler first fetches some meta data from RubyGems.org. This
means it checks what versions of the Chronic gem are available, what dependencies
it has, and what dependencies these might have.

In our case Chronic doesn't have any other dependencies, and so Bundler just
installs it. You will see that it installs a version starting with `0.9` (as
time of this writing that would be `0.9.1`).

In order to check what gems are part of your bundle you can run `bundle show`.
You can also open the file `Gemfile.lock` that Bundler has created.

With this we've created a little gems sandbox that makes, no matter what other
gems are available on your system, just two gems available to our Ruby code:
Chronic, and Bundler itself.

Lets have a look at the load path to confirm that:

```
bundle exec ruby -e 'puts $LOAD_PATH'
```

You'll se a bunch of directories that belong to your Ruby installation, and make
its standard library available. But you'll also see two directories that end with
something similar to this:

```
gems/chronic-0.9.1/lib
gems/bundler-1.9.6/lib
```

This means that any code that we run using our bundle (i.e. standing in this
directory, and using `bundle exec` as a prefix) will be able to require, and
use the Chronic library.

Let's try that. Create a new file `19-bundler.rb` in this directory, and add the
following lines:

```ruby
require "chronic"

time = Chronic.parse('tomorrow')
p time.class
p time
```

This will output something like this:

```
Time
2015-05-15 12:00:00 +0200
```

You can see that the method `parse` takes a natural language string, and converts
it into an instance of the Ruby class `Time` (see here for the
<a href="http://ruby-doc.org/core-2.2.0/Time.html">documentation</a>), so we can
now use this object's methods to do more interesting stuff. E.g. let's look up
which month that is:

```ruby
require "chronic"

time = Chronic.parse('tomorrow')
puts time.month
```

Let's say for some reason we'd now want to upgrade the Chronic gem, and use the
latest version in the newer `0.10` series. Maybe the authors have added some
new functionality that we'd like to use, or they've fixed a certain bug.

In order to do this we need to allow Bundler using the `0.10` series of versions.
So in your Gemfile change `~> 0.9.0` to `~> 0.10.0`.

If you now run:

```
bundle udpate chronic
```

You'll see that it now installs a newer version of this gem. Also, it has changed
the version number in the `Gemfile.lock` file.

Bundler is a really cool piece of software. It is one of those things that,
once you've used it for a while, wonder how life was possible before it existed
(*"How on earth did people meet before there were cellphones?!?"*). If you ask
any seasoned Ruby developer how their life was before Bundler, they'll probably
respond *"Quite miserable"*, or maybe give you a blank stare and say *"Ummm, I
forgot"*.

