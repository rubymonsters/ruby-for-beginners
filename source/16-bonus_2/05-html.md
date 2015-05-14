# Bonus: HTML

<a href="http://en.wikipedia.org/wiki/HTML">HTML</a>, meaning "HyperText Markup
Language", is a document format used for defining the semantic structure of a
single web page.

HTML was first proposed by <a href="http://en.wikipedia.org/wiki/Tim_Berners-Lee">Tim Berners-Lee</a>
in 1989, and layed grounds for the World Wide Web's huge breakthrough during
the 1990s.

The fundamental, primary feature of any web browser, such as Firefox, Chrome,
Safari, is to render (display) HTML documents. Whenever you type a URL into the
browser's address bar (or click a link, such as
<a href="http://rubymonstas.org">http://rubymonstas.org</a>) then the browser
will send a request to this address (i.e. to some application running on some
computer that responds to this address), and it will (in most cases) get an
HTML document back as a response. It will then display this HTML document to
you.

What does "semantic structure" mean?

Maybe it is best to look at an example first. This is a fairly simple HTML
document:

```html
<html>
  <head>
    <title>Ruby Monstas HTML Example</title>
  </head>
  <body>
    <h1>Ruby Monstas HTML Example</h1>
    <p>One paragraph of text.</p>
    <p>Another paragraph of text, containing an emphasized <em>word</em>.</p>
    <h2>A list of items</h2>
    <ul>
      <li>First item</li>
      <li>Second item</li>
      <li>Third item</li>
    </ul>
  </body>
</html>
```

If you look at this document you'll notice the recurring pattern of "tags" that
start with `<something>` and then are closed with `</something>`. E.g. the
entire document starts with an opening `<html>` tag, and ends with a closing
`</html>` tag.

HTML entirely consists of these tags that have a certain meaning, can be nested,
and contain content.

Here's what the HTML tags used in this example mean:

* `<html>...</html>` - the HTML document as a whole
* `<head>...</head>` - the header of the document, containing meta information (i.e. information *about* the document, not *part of* the document itself)
* `<title>...</title>` - an example of one bit of meta information, the title of the page as displayed in your browser history, and the browser window title (or tab)
* `<body>...</body>` - the body of the document itself, i.e. the whole of its content
* `<h1>...</h1>`, `<h2>...</h2>` - a headline level 1, and level 2, containing the headline's text. HTML defines heading levels 1-6, which should be enough to define the structure even of large documents.
* `<p>...</p>` - a single paragraph, containing the paragraph's text.
* `<ul>...</ul>` - an unordered list (i.e. a list that uses bullet points, as opposed to, e.g., a numbered list)
* `<li>...</li>` - a single list item, must be contained in either a `<ul>` or `<ol>` tag

You can read `<html>` as *"Ok, let's start an HTML document!"*.
Then `<head>` says: *"Oh, btw, here's some extra meta information about the document ..."*
and `<title>` says: *"The title of this document is: [...]"*.
`</title>` meaning *"Ok, we're done with the title"*,
just like `</head>` meaning *"Ok, we're done with the meta information part."*

When the browser sees `<body>` it reads that as *"Ok, now here comes the real content part of the document."*

Inside that content section it first finds an `<h1>` tag, and reads *"Aha, the
main headline is [...]"*, so it will display this as a headline to you. It then
finds two `<p>` tags containing a few bits of plain text, so it displays two
paragraphs. The last paragraph has an emphasized word, so it makes that one
cursive (or something else, depending on style definitions defined elsewhere).

Next it finds a 2nd level headline, and then an "unordered list", i.e. a list
with bullet points.

It is important to understand that HTML only defines the **semantic structure**
of a document. It does, as such, say nothing about the visual representation of,
for example, a headline, the spacing between paragraphs, the font family and size
used, any colors, borders, or even element placement: The visual representation
is defined in a different language called <a href="http://en.wikipedia.org/wiki/Cascading_Style_Sheets">CSS</a>
(or by the browser's defaults, should there not be any custom style definition
for this web page, as in our example).

Why is the semantic structure of a document useful at all, even disregarding
its visual styling when presented in the browser window?

Maybe the simplest example is a link. In order to describe a link in text (HTML
is just plain text, too, right?) we'll need to tell three pieces of information
to the browser:

* That we'd like to define a link,
* what text to display for the link, and
* what other web address to link to.

This is a valid example of a link in HTML, using the tag `a` (which means
"anchor"):

```html
<a href="http://rubymonstas.org">Ruby Monstas Homepage</a>
```

This HTML, when rendered in a web browser, looks like this:
<a href="http://rubymonstas.org">Ruby Monstas Homepage</a>, i.e. there's a link
with the text "Ruby Montas Homepage" and it links to the target URL ("href")
http://rubymonstas.org.

Does this make sense?

This is why HTML is called a "markup language". It is a language that "marks
up" certain each part of the content with its structural meaning, such as
*"This is a link, with this target URL"*, or *"This is a heading with this
level"*, *"This is a simple paragraph"*, and so on.

If you think about it, there are lots of useful applications, that leverage
the information that is provided by defining the **semantic structure** of a
document (as opposed to its visual representation).

For example, the entire success of Google as a search engine relied on the fact
that the semantic structure of a document provides clues about the relevance of
certain search terms in this document: If a word is contained in the URL, the
document title, the toplevel headlines, then it's probably important. Even more
so, if other pages link to this document using link texts that also contain
that word, then this adds social proof to the mix, and search results should
probably list this page rather high up on the page.

Another example is that, by inspecting the headline tags in an HTML document,
we can auto-generate a table of contents for this document quite easily,
without having authors to maintain this manually. Many content management
systems (CMS) do this, including Wikipedia.


