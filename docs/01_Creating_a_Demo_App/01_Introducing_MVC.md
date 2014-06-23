When the browser navigates to the `/users/` URL, Rails routes the browser to the `index` action of the Users controller.  This pulls all of the Users from the database - `User.all` - and returns them to the controller as the `@users` variable, which is passed to the `index` view.  The view then uses embedded Ruby to render the page as HTML, which is passed on to the browser.

The route rule lives in a file called `config/routes.rb`, and looks something like this:

	DemoApp::Application.routes.draw do
      resources :users
      .
      .
      .
    end

The controller that executes everything has some defined actions that tell it what to do. Here's a brief look at it, which lives in `app/controllers/users_controller.rb`:

	class UsersController < ApplicationController
    .
    .
    .

      def index
        @users = User.all
      end
      .
      .
      .
    end

The first thing to point out is that in defining `UsersController` we see that it is inheriting from the `ApplicationController` class (which is what that bit with the less-than symbol indicates).  Kind of like `extends` in PHP.

 In this snippet, we see that the data model defined for `index` is `@users = User.all`.  That's the call that returns all users to the controller, for display in the `/users` index page. Thus we're seeing that `@users` variable defined and returned.  In other actions, it would be given a different definition before being returned to the controller, with different information pulled from the database.

THe `User` model itself isn't that complicated, but it's important to know that it uses a Rails library called *Active Record*, from which it inherits quite a bit of functionality.  Here's the class where `User` is defined, saved in `/app/models/user.rb`.

	class User < ActiveRecord::Base
    end

The `@` symbol on the `@users` variable indicates that it is an *instance variable*, which makes it immediately available to template files, a.k.a. *views*.  Its properties are then accessed with (in this case, pretty simple) Ruby programming that looks a lot like any other loop.  Here's what the `app/views/users/index.html.erb` file looks like:

	<h1>Listing users</h1>

    <table>
      <tr>
        <th>Name</th>
        <th>Email</th>
        <th></th>
        <th></th>
        <th></th>
      </tr>

    <% @users.each do |user| %>
      <tr>
        <td><%= user.name %></td>
        <td><%= user.email %></td>
        <td><%= link_to 'Show', user %></td>
        <td><%= link_to 'Edit', edit_user_path(user) %></td>
        <td><%= link_to 'Destroy', user, method: :delete,
                                         data: { confirm: 'Are you sure?' } %></td>
      </tr>
    <% end %>
    </table>

    <br />

    <%= link_to 'New User', new_user_path %>

It's pretty obvious what's going on here, and a bit of syntax info can be picked up from what's being output, and what's being stated programmatically.
