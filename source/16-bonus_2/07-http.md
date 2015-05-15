# Bonus: HTTP

When computers talk to each other all they do is send around messages. You can
think of these as simple text messages, most of the time. They may be
encrypted, they may have some binary content attached to them (such as an
image, or a movie), but essentially they're just text messages.

When you open your browser, type a URL into the addressbar, and hit return,
your browser will send a text message to another computer, which is associated
with the hostname that is part of your URL. The computer on the other side
will receive this message (called the request), and send another message back
(called the response).

For example, when you go to
<a href="http://rubymonstas.org/location.html">http://rubymonstas.org/location.html</a>
this is (a simplified version of) the request that is going to be sent by your
browser:

```http
GET /location.html HTTP/1.1
Host: rubymonstas.org
User-Agent: Mozilla/5.0
```

The webserver that hosts our homepage then looks up the content of that web
page, and sends another message back to your browser, containing this content:

```http
HTTP/1.1 200 OK
Content-Type: text/html

<html>
  </head>
    <title>Ruby Monstas - Where we meet</title>
  <head>
  ...
</html>
```

That's it, essentially. Your browser will extract the HTML that is sent as the
body of the message, and display it.

Let's look at the request and response in more detail. What does all of this
stuff mean, exactly?

HTTP defines that the first line of a request must contain three bits: a
**verb**, a **resource**, and the version of the protocol. Out of these, we
only really care about the first two bits, the version is only relevant in way
more advanced contexts.

The **verb**, also called the "method", defines an operation. `GET` of course
means just that: *"Get me this thing, please."* The "thing" we're looking for
is defined by the second bit on this line: the **resource**, also called the
path. In our case that's a web page, i.e. some HTML.

Other common verbs are <a href="#footnote-1">[1]</a>

* `POST` means (in modern web applications, such as Rails applications):
  *"Create a new instance of the resource, using this data."* (E.g. `POST` to
  `/users` means: create a new user.)
* `PUT` means: update the instance with this new data. E.g. `PUT` to `/users/1`
  means: for the user (with the id) `1`, update their attributes with the given
  data.
* And `DELETE` means what you think it does. E.g. `DELETE` to `/users/1` means:
  Delete the user (with the id) `1`.

HTTP also defines that after this first line there may come any number of
headers, i.e. key/value pairs, containing meta information about the request.
In our example these are the hostname that was used in the URL, and the
(simplified) name of the browser that was used to send the request. Both of
these actually are mostly for information, and not a core part of the request.

Now, let's have a look at the response.

Again, HTTP defines that on the first line there need to be three bits of
information: The HTTP version number, a status code number, and a status
description. And again, we can just ignore the version number.

The status code is a way for the responding server to tell our browser what
*type of response* this is. Here are some common examples:

* `200 OK` means: Everything's cool, here's the thing you were looking for.
* `301 Moved Permanently` means: The thing you are looking for does not exist
  here any more. Here's the place where it has been moved to, look over there.
* `404 Not Found` means: Dunno, this thing does not exist.
* `500 Internal Server Error` means: Ouch, I have run into an internal error on
   my side.

There are lots of other status codes that servers can respond with, here's
<a href="http://en.wikipedia.org/wiki/List_of_HTTP_status_codes">a list</a>.
Many of them are very rarely used, and maybe the funniest one is `418 I'm a
teapot`.

Anyhow. The status code indicates the type of response, and most of the time,
for most `GET` requests, it will be `200 OK`.

On the following lines, again, there can be key/value pairs that contain
meta information about the response. In our case it says that the content
type of the body is `text/html` (which just means it's HTML).

Now, when there's a body on a request (sometimes requests come with a body,
too) or response (as in our example), then it needs to be separated from
the header with an extra, blank line. This tells the browser that we're
done with the headers, and the rest of the message is the response body
(the actual content).

To summarize:

* A request has, on its first line, a verb (method) and a resource (path). A
  response has, on its first line, a status code and description.
* Both requests and responses can have any number of header key/value pairs
  that contain meta information.
* And both requests and responses can include a body, which needs to be
  separated from the headers with an extra, blank line.

There is, of course, a *lot* more to say about HTTP, but these are the
essentials of how computers talk to each other when they speak HTTP, as
browsers and webservers do. And these also are the basics of what you need
to know in order to build a simple web application, receive requests, and
send back responses.

If you are interested in more details, here is a
<a href="https://speakerdeck.com/rkh/http-rubymonsters-edition">presentation</a>
that Konstantin Haase, maintainer of Sinatra, gave for Ruby Monstas in early
2015. Also, the
<a href="http://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol">Wikipedia page about HTTP</a>
is an interesting read.

Footnotes:

<a name="footnote-1">[1]</a> There's a lot more to be said about HTTP verbs than
this, and some developers might argue that these explanations are wrong. Let's
say these verbs mean these things in applications like Rails applications.
The HTTP standard defines these verbs in more abstract, and generic terms,
while Rails has its own, and more practical definition of these HTTP verbs.

E.g. `POST` actually means more "do whatevery you think is right" in terms
of the HTTP specification, while in the context of Rails it means "create this
thing".

For us, in praxis, for the time being, it is enough to remember that `GET`
means "get", `POST` means "create", `PUT` means "update", and `DELETE` means
"delete".

