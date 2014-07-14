We first create the resource by executing the same type of scaffolding command as when we created the User resource.  This time we'll want the content and the user's ID as the two database columns:

	$ rails generate scaffold Micropost content:string user_id:integer

	$ bundle exec rake db:migrate

As is pretty easy to figure out, the scaffold generator updated the Rails routes file with new rules for the Micropost resource, exactly as it did with the User resource.

Since this is a very rudimentary example, we'll simply create a new micropost by filling in form fields for both `content` and `user_id`, by navigating to `microposts/new/`.

Once there, it's easy to fill in the two fields, which are automatically created with the proper HTML5 inputs necessary to accomplish creating a string and integer respectively.  Once saved, the micropost is now added to the database, and can be seen from the micropost resource's index page.

###Adding Validations###

Implementing a contraint on a resource is easy with **validations**, which act as rules by which a resource is bound.  We can add a maximum length to the content property of the micropost resource in the `app/models/microposts.rb` file, right where the Micropost class is defined as an inheritor of the Active Record class.

	class Micropost < ActiveRecord::Base
		validates :content, length: { maximum: 140 }
	end

Once this has been added, submitting a micropost with more than 140 characters in the content area will return an error, including an explanation with field highlighting.  Neat!