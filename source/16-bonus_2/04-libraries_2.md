# Bonus: Using Libraries (2)

Being able to stand on the shoulder of giants is one of the great advantages
when we pick a programming language that has a great ecosystem, and an even
more awesome community:

Being faced with a certain task that we want to accomplish we can often look
for other people's solutions, and simply re-use and build on their code.

In the chapter <a href="/bonus_2/libraries.html">Using Libraries</a> you have
learned that Ruby comes with lots of things available as soon as your program
starts, but others need to be loaded using the method `require`. For example
we `require "digest"` and from then on there's a class `Digest::Sha2` defined,
which provides handy tools (methods) that we wouldn't want to write ourselves.

But how exactly does that work?

In order to understand how external code is loaded in maybe 99% of all Ruby
applications out there nowadays you'll need to understand the following concepts
which we'll walk through:

* The Ruby Standard Library
* Rubygems and Bundler
* The Ruby load path

## The Ruby Standard Library

Basically every programming language that you'll use in praxis has some kind
of standard library that is shipped with the language itself. When you install
Ruby on your computer this will also install the
<a href="http://ruby-doc.org/stdlib-2.2.2/">Ruby Standard Library</a>.

It's documentation isn't the most pretty website on earth, but if you look at
the "package" (library) names on the left you see things mentioned like:

* benchmark: tools to test how performant your code is
* debug: tools to make debugging code easier
* digest, openssl, securerandom: tools for encryption and security
* erb: Ruby's standard templating system (used in one of our exercises)
* net/imap, net/pop, net/smtp: stuff for sending and receiving emails
* zlib: tools for compressing files (you know `zip` files, don't you?)

And a lot of other things. These are fairly low-level tools, of course. You do
not see a library for "logging in via Twitter or Google". They're more like
nuts and bolts, rather than bicycles or cars, but they're super useful
nonetheless.

In order to make one of these libraries available in your code you don't have
to do anything else than use `require`. E.g. `require "zlib"` would make the
<a href="http://ruby-doc.org/stdlib-2.2.2/libdoc/zlib/rdoc/Zlib.html">zlib
library</a> available, which means you could now use the methods `deflate` and
`inflate` in order to compress and decompress files.

## Rubygems

Rubygems is Ruby's package manager. A gem is a library that has been prepared
in a way so it can be distributed (published and downloaded) via the internet.
Such libraries are commonly refered to as "packages", and there are many different
package managers for different purposes. You can think of it as an app store
that can be used to download specific versions of libraries, which you can then
use.

In order to do that Ruby has a built-in command line tool `gem`, which also is
installed alongside your Ruby installation.

When you run `gem --list` in your terminal you should see a list of all the
gems that are installed on your computer (for the currently selected Ruby
version if you use a Ruby version manager, such as RVM).

In order to install a certain gem you can type `gem install [the-gem-name]`.
E.g. `gem install middleman` would install the
<a href="https://middlemanapp.com/">Middleman</a> library, which is a super
handy tool for generating static web pages. This book is published using
Middleman.

Where does `gem` fetch all these gems (packages) from though?

Ruby gems are centrally hosted on <a href="https://rubygems.org">RubyGems.org</a>,
and Middleman, for example, has
<a href="https://rubygems.org/gems/middleman">entry on this site</a>, too.
You can see the latest version number of this gem (which is `4.0.0.beta.2` as
of this writing), who the authors are, useful links to their homepage, source
code, documentation, and so on.

You can also see that the gem middleman depends on a variety of other gems,
such as coffee-script, compass, execjs, and haml. This means that the authors
of Middleman themselves make use of code which in turn is packages as other
gems. This is very common. We say "Middlemans dependencies are coffee-script,
compass, ...".

When you run `gem install middleman` you'll see that this not only installs
the Middleman gem, but also all of its dependencies, and all dependencies
that any of the dependencies might have. This means, when you install one
gem you'll get all the other stuff that this gem needs, too.

Also, each of these dependencies comes with a specification of a version number
or range of version numbers. For example `~> 2.2.0` means "allow any version
of this gem that starts with 2.2".

Once installed on your computer you can use a gem in your code in just the same
way as you use something from the Ruby Standard Library. You `require` it.
For example, in order to configure Middleman to generate this book we require
a gem called `middleman-toc`
<a href="https://github.com/rubymonsters/ruby-for-beginners/blob/master/config.rb#L1">here</a>.
This is an extension to Middleman that allows to add a table of contents, and
we need to `require` it before Middleman can use it.

## Bundler

Consider an application that relies on lots and lots of gems. For example,
a new, generated Rails application comes with a whopping 42 gems, and this
number usually grows pretty quickly with typical Rails applications.

Imagine working on an application like this over years, and there are new
versions of gems being published all the time. Often they'll update the version
numbers of their dependencies when new versions come out, or add new gems as
dependencies, and remove old ones.

How likely do you think it is that any of the version number ranges specified
for all of these gems would conflict with any other version number range? In
praxis it is very likely. Rubygems itself (the library `rubygems` that is part
of your Ruby installation) is not very smart at figuring out which versions
of certain gems play well with each other.

On top of this, with plain Ruby and Rubygems, when you `require` any gem in your
code, you'll simply get the latest version of this gem that is already installed
on your computer. Assuming these versions do not conflict with each other, you
still don't know if these are the exact same versions as the ones your
co-workers have installed. And in praxis, again, this is pretty unlikely. This
can be a source of many, often subtle, bugs that you don't really want to deal
with.

This is where Bundler comes into play.

Bundler allows you to define which gems your application depends on (in a file
called `Gemfile`), and then run `bundle install`. This will figure out which
gem versions work well with each other (a task that Bundler is *great* at), and
store the solution to this riddle to a separate file (called `Gemfile.lock`).

These files are part of your code, and can be shared with other developers.
When they now run `bundle install` themselves they'll get exactly the same gem
versions that you also have.

You can think of Rubygems of a tool to install gems on your computer. Over time
this may result in a collection of lots and lots of gems in various versions
that all sit somewhere on your filesystem.

Bundler on the other hand is a tool for picking *some* of these gem versions,
and restricting access to only these. You can think of it as a sandbox of the
few gems that your application really should use. Like a looking glass that
restricts the vision of your application to only see these few gem versions,
even though there maybe tons of other gem versions installed on your computer.

In order to use your application with Bundler you'd prepend the command `bundle
exec` to whatever other command you execute in your terminal, as follows.

Imagine you'd normally execute your program like this:

```
ruby my_amazing_app.rb
```

In order to use it with Bundler, and restrict the visible gem versions to the
ones defined in your `Gemfile.lock` file you would run this instead:

```
bundle exec ruby my_amazing_app.rb
```

(For Rails applications, btw, you do not have to prepend `bundle exec` by the
way. Rails does all of this itself, under the hood.)

## The Ruby load path

Ruby is software, and software stores things somewhere on your file system.
In order to define places on your computer, where interesting stuff is stored
software often has the concept of a "load path".

If you are using a Unix based operating system, such as Linux or Mac OSX you
may have seen the environment variable `$PATH` in installation instructions.
This variable defines all the directories where executable files are stored.

Ruby has a load path, too. Inside your Ruby program you can print it out using:

```ruby
puts $LOAD_PATH
```

This will print out the array that is defined as the `$LOAD_PATH` when Ruby
starts your program. `puts` is smart enough to put each string in that array
on a separate line.

Each of these lines represents a directory on your computer where Ruby files
are stored. If you use `require` anywhere in your application (e.g. `ruby
"digest"`) then Ruby will look for a Ruby file with the same name (e.g.
`digest.rb`) in each of these directories. It will load the first file with
this name that it can find.

Would now be a good time to do a few exercises on
<a href="/exercises/rubygems.html">Rubygems</a> and
<a href="/exercises/bundler.html">Bundler</a>?
