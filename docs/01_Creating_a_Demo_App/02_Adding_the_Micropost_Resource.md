We first create the resource by executing the same type of scaffolding command as when we created the User resource.  This time we'll want the content and the user's ID as the two database columns:

	$ rails generate scaffold Micropost content:string user_id:integer

	$ bundle exec rake db:migrate

As is pretty easy to figure out, the scaffold generator updated the Rails routes file with new rules for the Micropost resource, exactly as it did with the User resource.

Since this is a very rudimentary example, we'll simply create a new micropost by filling in form fields for both `content` and `user_id`, by navigating to `microposts/new/`.