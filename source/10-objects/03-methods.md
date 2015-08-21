# Objects have methods

*Methods are an object's behaviour*

Objects have methods, allowing us to do interesting stuff with them. An
object's methods are things that the object can *do*.

These methods have exactly the same characteristics as those "stand-alone"
methods that we've discussed above. But on top of that they also "belong" to a
particular object, and kind of "know" the object they belong to.

Think about a person, like, a friend of you'rs. You can ask this person for
their name (call a method), and they'll tell you (return it to you). Their name
is a piece of knowledge that this person has, and the ability to tell it to you
(respond to your question) is a piece of behaviour (a method) they have.

We could also ask them to make, and bring a cup of tea for us. Or we could ask
them to remember a phone number, or email password.

As Rubyists we actually say that we "talk to objects", or "send messages" to
them: We do so by using (calling) methods that they respond to.

And we've already silently skipped over the fact that we've used some methods
in the previous chapter: `class` and `is_a?` are methods defined on all objects
in Ruby, e.g. defined on the String `"this is a string"`.

Let's move on to see how we can use (call) these methods though.
