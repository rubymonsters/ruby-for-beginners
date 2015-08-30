# Objects have methods

*Methods are an object's behaviour*

Objects have methods, allowing us to do interesting stuff with them. An
object's methods are things that the object can *do*.

Think about a person, like, a friend of yours. You can ask this person for
their name (call a method), and they'll tell you (return it to you). Their name
is a piece of knowledge that this person has, and the ability to tell it to you
(respond to your question) is a piece of behaviour (a method) they have.

We could also ask them to make, and bring a cup of tea for us. Or we could ask
them to remember a phone number, or email password.

As Rubyists we actually say that we "talk to objects", or "send messages" to
them: We do so by using (calling) methods that they respond to.

So, what can an object do?

That depends on their class (type). Numbers can do things that are useful for
numbers, obviously. You can do math, and ask them about their mathematical
properties (e.g. "Are you an odd number?"). Strings (text) come with way more
methods, and they're often related to text transformations.

<p class="hint">
Methods add behaviour that is useful to have for a particular type of object.
</p>

We've already used some methods in the previous chapters: E.g. `"hello".upcase`
calls the method `upcase` on the String `"hello"`.

Also, `class` and `is_a?` are methods defined on all objects in Ruby, and
therefore also defined on the String `"a string"`: `"a string".is_a?(String)`
answers with `true`.

<p class="hint">
Some methods, such as <code>class</code>, <code>is_a?</code>, are defined on all objects.
</p>

Let's move on to see how we can use (call) these methods though.
