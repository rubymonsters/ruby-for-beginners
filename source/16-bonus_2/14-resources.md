# Bonus: Resources

In HTTP a "resource" is something that is identified by a URL. In Rails it is
something slightly different: a collection of 7 routes that belong together in
the sense that they allow listing, viewing, and managing a collection of
things.

Let's have a look at an example.

Imagine we are building an application that allows managing the members of our
study group. There's a way to

* list all of them
* look at a member's details
* add new members
* update a member's details
* remove members

That's exactly what a *lot* of web applications do, except that you might be
managing things other than members.

Because it's such a common scheme, Rails has added a first class concept for
that, which we are now going to re-implement in Sinatra. This way you'll have a
great understanding of what a "resource" is in Rails once we get started with
that framework.

Here's how these routes look like. We'll use the path `/members` in our
example.

* `GET /members` displays a list of all members
* `GET /members/:id` displays the details for a single member
* `GET /members/new` displays a form for creating a new member
* `POST /members` creates a new member from that form
* `GET `/members/:id/edit` displays a form for editing a member's details
* `PUT /members/:id` updates a member's details from that form
* `DELETE /members/:id` deletes the member

Here's the same information as a table. Note that the names are the ones that Rails
uses for them. We'll use these names for our templates, in case we need a template.


| Name    | Method | Path              | Function                            |
| ------- | ------ | ----------------- | ----------------------------------- |
| index   | GET    | /members          | Display all members                 |
| show    | GET    | /members/:id      | Display a single member             |
| new     | GET    | /members/new      | Display a form for a new member     |
| create  | POST   | /members          | Create that new member              |
| edit    | GET    | /members/:id/edit | Display a form for editing a member |
| update  | PUT    | /members/:id      | Update that member                  |
| destroy | DELETE | /members/:id      | Delete a member                     |

So there are 4 groups of routes:

* `index` and `show` are used to display data.
* `new` and `create` are used to create a new member.
* `edit` and `update` are used to update a member.
* `delete` is used to delete a member

The two pairs `new` and `edit` as well as `edit` and `update` follow the same
pattern that we've discussed in the chapter about <a href="/bonus_2/validations">Validations</a>:

* The first request `GET`s an HTML form for the user to enter some data.
* This form is then submitted as another request, using `POST` or `PUT`, to the second route.
* The second route validates the data.
* If the data is valid it creates/updates the member, and redirects to the show view, passing a confirmation message.
* If the data is not valid it re-renders the form with an error message.



