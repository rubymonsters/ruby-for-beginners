# Bonus: Rack

<a href="http://rack.github.io/">Rack</a> is the most basic way to build a very
simple web application in Ruby, and we are going to start with it. In praxis
you may never build an application with Rack directly, but you'll use it when
you work on Sinatra or Rails applications, since these use Rack under the hood.

Let's jump right in.

In a new directory `rack` create a file `config.ru` with the following content:

```ruby
class Application
  def call(env)
    [200, { "Content-Type" => "text/html" }, ["Yay, your first web application! <3"]]
  end
end

run Application.new
```

Now, make sure you have the gem Rack installed: In your terminal check `gem
list rack`. Does that show something like `rack (1.6.1)` (or any other version
number)? If it doesn't, install Rack with the command `gem install rack`.

This gem comes with a little executable (command line program) called `rackup`.
This command looks for a file `config.ru` in the current directory, and starts
a web server using it.

Make sure you have `cd`ed to your `rack` directory, and then run `rackup`. You
should see something like:

```
$ rackup
[2015-05-15 18:37:42] INFO  WEBrick 1.3.1
[2015-05-15 18:37:42] INFO  ruby 2.2.1 (2015-02-26) [x86_64-darwin14]
[2015-05-15 18:37:42] INFO  WEBrick::HTTPServer#start: pid=17588 port=9292
```

Of course the version numbers may be different, but the important bit that
you want to look for is the port.

Now your web application has started you can point your browser to
<a href="http://localhost:9292">http://localhost:9292</a>. You should see
something like this:

<img src="/assets/images/08-rack_1.png">

Pretty cool, isn't it? With just a few lines of plain Ruby code you have
just written an actual web application.

Now, let's have a closer look at the code.

We define a class `Application`, and, on the last line, create an instance
of it, which we pass to the method `run`. The method `run` is defined by
Rack, and expects to be passed something that responds to the method `call`.

That's why we defined a method `call` on our class. This method takes one
argument `env`. It does not use the `env` (whatever that is), yet, but instead
just returns the same static array whenever it is called.

This array contains 3 things:

* The number 200, which represents the status code,
* a hash that contains a single header (the content type), and
* an array containing a single string, which is the body.

So the method `call` returns what represents a response in Rack!

Rack makes it so that whenever there's a request coming in (on the computer
that is `localhost`, i.e. your own, local computer, and on the port 9292),
it will turn this request into a hash that is passed to the method `call`.
I.e. the argument `env` contains the request information. We'll have a look
at that in a minute.

Rack then expects that you return an array containing those three elements:

* The HTTP response code
* A hash of headers
* The response body, which must respond to each (i.e. we can just use an array)

Once it got these three things back from our method `call` it will create
the respective response (text) message out of it, and send it back to the
browser.

Let's have a look at the `env` data that is passed along with the request.
Let's just print it out to the terminal as follows:

```
  def call(env)
    p env
    [200, { "Content-Type" => "text/html" }, ["Yay, your first web application! <3"]]
  end
```

In order for the server to pick up this change we need to restart it. Go to
your terminal window where `rackup` (WEBrick) is running our app, and hit
`ctrl-c`.  Then hit `cursor-up` to get the last command back (or type
`rackup`), and hit `return`.

If you now refresh the page in your browser (hit `cmd-r` or `ctrl-r` depending
on your operating system) you should then see ... wow, quite a bit of messy
output in the logs in your terminal. For me it looks like this (some less
interesting bits removed):

```
{"GATEWAY_INTERFACE"=>"CGI/1.1", "PATH_INFO"=>"/", "QUERY_STRING"=>"", "REMOTE_ADDR"=>"127.0.0.1", "REM
OTE_HOST"=>"localhost", "REQUEST_METHOD"=>"GET", "REQUEST_URI"=>"http://localhost:9292/", "SCRIPT_NAME"
=>"", "SERVER_NAME"=>"localhost", "SERVER_PORT"=>"9292", "SERVER_PROTOCOL"=>"HTTP/1.1", "SERVER_SOFTWAR
E"=>"WEBrick/1.3.1 (Ruby/2.2.1/2015-02-26)", "HTTP_HOST"=>"localhost:9292", "HTTP_ACCEPT_LANGUAGE"=>"en
-US,en;q=0.8,de;q=0.6", "HTTP_CACHE_CONTROL"=>"max-age=0", "HTTP_ACCEPT_ENCODING"=>"gzip", "HTTP_ACCEPT
"=>"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8", "HTTP_USER_AGENT"=>"Mo
zilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.1
35 Safari/537.36", "rack.version"=>[1, 3], "rack.url_scheme"=>"http", "HTTP_VERSION"=>"HTTP/1.1", "REQU
EST_PATH"=>"/"}
```

What does all of this stuff mean?

First of all, you can see that it's a Ruby hash with lots of keys that are all
strings. Then, most of these strings are all upper case with an underscore `_`
as a word separator. Some of these start with `HTTP_`, while others don't.
However, there also are some keys that start with `rack`, and are all
lowercase.

Rack uses a simple convention for these keys:

* All headers that have been part of the actual HTTP request are prefixed with
  `HTTP` and uppercased. For example the request header `host: localhost:9292`
  will be translated to the hash key `HTTP_HOST` with the value `localhost:9292`.
* All other uppercase keys represent additional information that has been
  passed (added) from the webserver that has received the request (in this case
  WEBRick, which runs our little Rack application). For example, WEBRick adds
  the key `PATH_INFO` with the resource (path), as well as the key
  `REQUEST_METHOD` with the verb (method) from the HTTP request. These weren't
  headers in the request, but obvioulsy part of it. On top of this, WEBRick
  also adds other things, such as the `SERVER_SOFTWARE` key (telling us which
  WEBRick and Ruby version we are using), and so on.
* All keys that are prefixed with `rack.` represent internal additions that
  Rack adds.

Let's write a little bit of code to make this more easy for us to inspect:

```ruby
class Application
  def call(env)
    puts inspect_env(env)
    [200, { "Content-Type" => "text/html" }, ["Yay, your first web application! <3"]]
  end

  def inspect_env(env)
    puts [request_headers(env), server_info(env), rack_info(env)]
  end

  def request_headers(env)
    pairs = env.select { |key, value| key.include?('HTTP_') }
    format('Request headers', pairs)
  end

  def server_info(env)
    pairs = env.reject { |key, value| key.include?('HTTP_') || key.include?('rack.') }
    format('Server info', pairs)
  end

  def rack_info(env)
    pairs = env.select { |key, value| key.include?('rack.') }
    format('Rack info', pairs)
  end

  def format(heading, pairs)
    pairs = pairs.map { |key, value| '  ' + [key, value.inspect].join(': ') }
    [heading, "", pairs, "\n"].join("\n")
  end
end
```

Again, after changing your code, you'll need to restart your server application.

For me this outputs the following (again, stripping some of the less interesting bits):

```
Request headers

  HTTP_HOST: "localhost:9292"
  HTTP_REFERER: "http://localhost:9292/"
  HTTP_ACCEPT_LANGUAGE: "en-US,en;q=0.8,de;q=0.6"
  HTTP_ACCEPT_ENCODING: "gzip"
  HTTP_USER_AGENT: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36"
  HTTP_ACCEPT: "*/*"
  HTTP_VERSION: "HTTP/1.1"

Server info

  GATEWAY_INTERFACE: "CGI/1.1"
  PATH_INFO: "/favicon.ico"
  QUERY_STRING: ""
  REMOTE_ADDR: "127.0.0.1"
  REMOTE_HOST: "localhost"
  REQUEST_METHOD: "GET"
  REQUEST_URI: "http://localhost:9292/"
  SCRIPT_NAME: ""
  SERVER_NAME: "localhost"
  SERVER_PORT: "9292"
  SERVER_PROTOCOL: "HTTP/1.1"
  SERVER_SOFTWARE: "WEBrick/1.3.1 (Ruby/2.2.1/2015-02-26)"
  REQUEST_PATH: "/"

Rack info

  rack.version: [1, 3]
  rack.url_scheme: "http"
```

Now, that's way easier to read, right?

Out of all of this the most interesting keys for us are `REQUEST_METHOD` and
`REQUEST_PATH`.

Let's modify our app a little so we can make use of it:

```ruby
class Application
  def call(env)
    # puts inspect_env(env)
    handle_request(env['REQUEST_METHOD'], env['REQUEST_PATH'])
  end

  def handle_request(method, path)
    if method == "GET"
      get(path)
    else
      method_not_allowed(method)
    end
  end

  def get(path)
    [200, { "Content-Type" => "text/html" }, ["You have requested the path #{path}, using GET"]]
  end

  def method_not_allowed(method)
    [405, {}, ["Method not allowed: #{method}"]]
  end

  # ...
end
```

If you restart your server, and point your browser to
<a href="http://localhost:9292/ruby/monstas">http://localhost:9292/ruby/monstas</a>
you should now see something like this:

<img src="/assets/images/08-rack_2.png">

If you read the code above closely, do you understand what it does, and why?

We have changed the method `call` to extract the two pieces of information that
are most interesting to us from the `env` hash: these are the values for the
keys `REQUEST_METHOD` and `REQUEST_PATH`.

We then pass these two values to a new method `handle_request`, which checks
the `method`:

* If it's a `GET` request, then we call another method `get`, passing the `path`.
  The method `get` complies with Rack's convention for returning a response: It
  returns an array that has the response status, headers, and a body. We've
  changed the body a little bit so it displays the `path` that was requested.

* If it's not a `GET` request, then we call another method `method_not_allowed`.
  This method also complies with Rack's convention, but returns a different
  response. This time we use the status code `405` which means exactly this:
  *"Method Not Allowed"*. Our little application just does not support any other
  methods.

Because these response arrays are the return values of these two methods,
they'll also be the return value of the method `handle_request`, and it turn
the method `call`. So they'll be passed back to Rack, and turned into the
actual HTTP response that is returned to your browser.

Congratulations!

You have just written your first web application, and it responds to different
requests with (albeit only slightly) different responses.

Imagine working on this application more, and returning different HTML pages
based on the `path` that is part of the request: You could use the ERB
rendering method from the <a href="/bonus_2/erb.html">previous chapter about
ERB</a> in order to render different ERB templates.

And guess what, this is exactly what Sinatra makes super easy :)


