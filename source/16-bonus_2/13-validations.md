# Bonus: Validations

Our little application now already makes use of a bunch of things that you will
regularly find in web applications.

We have a form that posts to another route. The `post` route picks up the data,
and stores it, then redirects to another route, which displays the data. We also
use a session, and a query parameter to pass data from one route to another.

However, we still are a little naive in accepting whatever data comes in to our
`post` route: Do we want to store duplicate names? What if the same name is
being submitted over and over again? And what if there's no name submitted at
all?

What we really want to do is validate the incoming data (name), and only accept
and store it when we find it's valid. If it's not, then we want to display a
message to the user, and ask them to submit the form again.

We could change our `post` route like so:

```ruby
post "/hello" do
  name = params[:name]

  if name.to_s.empty?
    session[:message] = "You need to enter a name."
  elsif read_names.include?(name)
    session[:message] = "#{name} is already included in our list."
  else
    store_name("names.txt", name)
    session[:message] = "Successfully stored the name #{name}."
  end

  redirect "/hello?name=#{name}"
end
```

This is a valid implementation, and if you restart your application you
can try it out.

The `if` statement first checks if the `name` is empty. If it is we simply
store a message to the session, and then redirect.

Note that we call `to_s` ("to string") on the `name`. This is useful because
there might not be any value stored on `params[:name]`. In this case we'd get
`nil`, which does not know the method `empty?`. We therefor turn a potential
`nil` value into an empty string first.  Of course, if there's a string stored
on `params[:key]`, then `to_s` would just return the same string.

The `if` statement then checks if the given `name` already is included in the
names in our file: the array returned by `read_names`. (We had implemented this
method in order use it in our `get` route for displaying all the names, and now
we can just re-use it here.) If we already have the name, then, again, we just
add a message to the session, and redirect.

Only in the last case, when the name is not empty, and not already known,
we do store it, and add the respective message to the session, and redirect.

However, it's worth considering that this adds quite a bit of stuff to our
route. So what if we extracted this to a validator class?

Let's implement a little Ruby class that hides some of the logic from the
route. Here's how we could do it:

```ruby
class NameValidator
  def initialize(name, names)
    @name = name.to_s
    @names = names
    @messages = []
  end

  def valid?
    validate
    @messages.empty?
  end

  def message
    @messages.first
  end

  private

    def validate
      if @name.empty?
        @messages << "You need to enter a name"
      elsif @names.include?(@name)
        @messages << "#{@name} is already included in our list."
      end
    end
end

post "/hello" do
  name = params[:name]
  validator = NameValidator.new(name, read_names)

  if validator.valid?
    store_name("names.txt", name)
    session[:message] = "Successfully stored the name #{name}."
  else
    session[:message] = validator.message
  end

  redirect "/hello?name=#{name}"
end
```

This adds quite a bit of code that we need to figure out, and type. But it
might be worth it: Our route is now much shorter, and way easier to understand
from just a quick look at it. We could move the `NameValidator` to a separate
file.

So this works. However, imagine we'd have a much bigger form, with lots of
fields. We'd then need to pass all of these back to the `get` route by the
way of appending all of them to the URL - otherwise this data would be lost
and the user would have to re-enter it.

For this reason modern web applications usually follow a different pattern.

Instead of redirecting the user, when the submitted data is invalid, we would
just re-render the same template right away, with the same data.

Here's how we could do that:

```ruby
post "/hello" do
  @name = params[:name]
  @names = read_names
  validator = NameValidator.new(@name, @names)

  if validator.valid?
    store_name("names.txt", @name)
    session[:message] = "Successfully stored the name #{@name}."
    redirect "/hello?name=#{@name}"
  else
    @message = validator.message
    erb :hello
  end
end
```

As you can see we now only store a message to the session, and redirect, if
the given data was valid. If it's not we store the validation message to
the `@message` instance variable and render our template again.

Cool. If you restart your application you can try how it works.

However, this now displays an empty "Hello" at the top. Why's that?

We assign `params[:name]` to the instance variable `@name` which we then check
in our template: `<% if @name %>`. However, since this has been submitted by a
form, with an input element called `name`, what we get is an empty string, not
`nil`.

We can fix this by changing our view like so:

```erb
<% unless @name.to_s.empty? %>
  <h1>Hello <%= @name %></h1>
<% end %>
```

Awesome.

With this completed you have now walked through an important pattern, which
also is used in Rails applications by default:

* There is an HTML form which is being retrieved via a `GET` request.
* This form posts to another route, which validates the submitted data.
* If the data is valid, it does something with it (in our case we store it).
* If it's not valid, it renders an error message, as well as the form,
  with the form fields populated with the given data.

Let's take this a step further and have a look at something that Rails
calls "resources".
