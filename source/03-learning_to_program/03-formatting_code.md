# Formatting your code

*Keeping things pretty*

By "formatting code" we refer to the way code is indented, or not, where and
how whitespace is being used in order to separate things visually, or not, etc.

For example, even though this code won't mean a lot to you at this point (it
will, in a few chapters), it is formatted well:

```ruby
def widths(row)
  row.map do |cell|
    cell.width
  end
end
```

Even without understanding what these few lines of code do at all, from just
looking at it one can recognize a certain structure: things are somehow
nested, and stuff that sits on the same horizontal indentation relates to
each other visually.

On the other hand the following code also is perfectly valid Ruby code, in the
sense that Ruby will happily run it, and it does exactly the same. However,
it is not formatted very well at all (in fact it's quite a mess, isn't it?):

```ruby
  def widths (     row
)
 row.map do | cell| cell.width
end
     end
```

This *does* the same, technically: Ruby will run it. But it does not *look* and
*read* the same, simply because of the way it is formatted.

## Pattern recognition

When you talk to developers about your code you will probably notice very
quickly that we are all obsessed about how exactly we'd like code to be
formatted.

There's a good reason for that, and you should try hard to learn how to use
your editor in order to format your code properly, so over time, you can become
obsessed, too :)

The reason for this obsession is pattern recognition: The ability of our brain
to help us recognize things subconsciously, from just glancing over them.

Imagine you are driving a car, and there's a kid playing with a ball on the
sidewalk. Even if you only see the kid from the corner of your eye your brain
will immediately process this information and even assign a meaning to it.
You'll start paying attention, and maybe lower your speed immediately.

Often when you search for something online, and look at a couple of
websites, your brain will help you recognize things that you are looking
for without consciously thinking about the structure of the site.

In the same way, as a programmer, when you look at code, you will immediately
recognize some of its structure, and thereby understand it, without reading it
thoroughly. This allows you to to grasp the overall picture of what you're
looking at, and quickly find something that you're looking for, in order to
then read this particular part of the code more carefully.

As you can imagine, in order for this kind of pattern recognition to kick in,
code needs to be formatted consistently and carefully.

Another aspect of this is that looking at "badly" formatted code causes
discomfort to an extent that it is described as causing physical pain. While
this might seem like an exaggeration, there's something important to it.

Because of how pattern recognition works, as a programmer, whenever there's
a small issue with the formatting of some code, you will immediately notice
it, and distract yourself from other thoughts. You'll need to re-focus on what
you were trying to accomplish, and whenever you come back to the code it will
distract you again.

That's why developers often feel the urge to fix even small formatting
mistakes immediately. People might outright refuse to talk about your actual
code, and any questions that you have, before you've added this one extra space
here, and indented that other single line there.

(One certain aspect of this has been even baked right into the language Ruby.
For example, by definition, class names must start with an uppercase letter.
On top of this, the Ruby community has agreed on conventions for how to
write other names. We'll get to this once we talk about variables and
classes more.)

