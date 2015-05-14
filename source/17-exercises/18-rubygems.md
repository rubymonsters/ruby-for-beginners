# Using Rubygems

A data format is a way to represent rich data types (such as Strings, Numbers,
Arrays, Hashes, and so on) in form of a simple text document that can be stored
on the local file system, or transferred over the internet.

<a href="http://en.wikipedia.org/wiki/JSON">JSON</a> is a data format that is
very common in modern web application development, and it is useful for
computers to talk to each other, and pass around data. JSON is human readable,
and pretty similar to, for example, Javascript and Ruby code.

For example, this is a valid piece of JSON:

```json
{
  "emails": [
    {
      "subject": "Hi there, Ruby Monstas!",
      "date": "2015-01-02",
      "from": "Ferdous"
    },
    {
      "subject": "Keep on coding!",
      "date": "2015-01-03",
      "from": "Dajana"
    }
  ]
}
```

As you can see the syntax is similar to Ruby hashes and arrays: There is an
outer hash that has a single key `"emails"`, which is a string. This key's
value is an array that has two elements, each of which is another hash with the
keys `"subject"`, `"date"`, and `"from"`.

So, this piece of JSON represents data for a collection of two emails.

In order to read (we say "parse") this piece of JSON data in a Ruby application
we can use the `json` gem. (You can find it on
<a href="https://rubygems.org/gems/json">Rubygems.org</a>, too).

You can run `gem list json` in order to check if this gem is already installed
on your system. `gem install json` will install it, and `gem update json` will
look for a newer version and install that one if there's one.

Make a new file `libraries-1.rb`, and add the following lines:

```ruby
require "json"

data = '{
  "emails": [
    {
      "subject": "Hi there, Ruby Monstas!",
      "date": "2015-01-02",
      "from": "Ferdous"
    },
    {
      "subject": "Keep on coding!",
      "date": "2015-01-03",
      "from": "Dajana"
    }
  ]
}'
data = JSON.parse(data)

p data.keys

```

If you then run `ruby libaries-1.rb` you'll see that the method `JSON.parse` converts
the string that is stored in the variable `data` to a Ruby hash, so we can call `keys`
on it, and it will output an array with the single key defined on the outer hash:

```ruby
["emails"]
```

Likewise, if you add another line at the end, as follows:

```ruby
p data["emails"].first["subject"]

```

You see that `data["emails"]` returns the array stored on that key, so we can call `first`
on it, which returns the first hash in that array, and we can finally fetch the value
for the key `"subject"` stored on that hash.

So this prints out `"Hi there, Ruby Monstas!"`.

By the way, if you've read the bonus chapter on
<a href="/bonus_1/alternative-syntax.html">Alternative Syntax</a> then you may
have notices that we also have a perfect example of a usecase for the `%(..)`
string syntax here:

JSON data will often contain double quotes (for any string), and often contain
single quotes. Since JSON data, as a whole, needs to be a plain Ruby string
when defined inside of your Ruby code, this is a great usecase for this syntax.

Like this:

```ruby
require "json"

data = %({
  "emails": [
    {
      "subject": "Here's this week's homework!!",
      "date": "2015-01-04",
      "from": "Ariane"
    }
  ]
})
data = JSON.parse(data)

p data["emails"].first["subject"]
```
