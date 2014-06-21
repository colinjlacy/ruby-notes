##Creating the Data Structures##

For this simple demo app, we're going to take a simple approach to users:

| Column| Type    | Description         |
|-------|---------|---------------------|
| id    | integer | unique identifier   |
| name  | string  | public display name |
| email | string  | login username      |

Simple enough. We'll do the same with the micropost data table:

| Column   | Type    | Description         |
|----------|---------|---------------------|
| id       | integer | unique identifier   |
| content  | string  | micropost content   |
| user_id  | integer | blogger's user id   |

##The Users Resource##

We're going to create a *Users resource*, which will allow us to think of each user as a data object that we can CRUD through HTTP requests.  This will be created by a scaffolding generator program, which comes standard with each Rails project.

Running a scaffolding generator is pretty straightforward. (It's what happens once it's run that's complicated!)  The `scaffold` command is passed to the `rails generate` script, along with the singular version of the resource name (in this case `User`, as well as the additional column names that will appear, as wel as their data types.  `id` is assumed and required, used as the primary key for the data row, and therefore is not entered.

    $ rails generate scaffold User name:string email:string

The next step is to migrate the database using *Rake*.

	$ bundle exec rake db:migrate

While at this point spinning up the server with `rails server` will only show the standard new page, the creation of the Users resource has given us new pages based on URL strings - the makings of an API.  The following URLs act on the root URL `localhost:3000`, the internal rails server port.

| URL      | Action  | Purpose             |
|----------|---------|---------------------|
| /users   | index   | list all users      |
| /users/1 | show    | show user with id:1 |
| /users/new | new    | create a new user |
| /users/1/edit  | edit | edit user with id:1 |

All of these pages are live and ready to go, even with this little work put into it.  Snazzy.  We can create a new user by visiting `/users/new` and filling out the form.  We can do this as many times as possible, and then even edit or delete them as well.



