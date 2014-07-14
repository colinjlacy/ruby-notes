Rails allows us to easily create **associations** between data models.  To demonstrate this, we'll add a definition to both `user.rb` and `micropost.rb`:

	# in app/models/user.rb

	class User < ActiveRecord::Base
		has_many :microposts
	end

	# in app/models/microposts.rb

	class Micropost < ActiveRecord::Base
		belongs_to :user
		validates :content, length: {maximum: 140}
	end

Notice that we've added `has_many :microposts` and `belongs_to :user` in these files.  We're now starting to see the start of data model associations beginning to form.  Rails, using ActiveRecord, can infer from the context - i.e. that the `user_id` field in micropost and the `id` field in user match up - that we're forming the relationship along that connecting line.

In order to demonstrate what this has done, we can use the `rails console` command line tool to return the data models from our app, and explore how are data relates to each other.

     # It's worth noting that I had to exit and restart rails console after entering the lines above in order to get this to work.  Makes me think that once a rails app is deployed (i.e. the console was initiated), any changes to the back end are only applied on re-deployment, not any state changes within rails server.  Will keep this in mind for later.

	$ rails console

	> first_user = User.first
	User Load (0.2ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT 1
     => #<User id: 1, name: "Colin J Lacy", email: "colin@webcake.co", created_at: "2014-06-21 04:53:41", updated_at: "2014-06-21 04:53:41">

    > first_user.microposts
    Micropost Load (1.3ms)  SELECT "microposts".* FROM "microposts" WHERE "microposts"."user_id" = ?  [["user_id", 1]]
     => #<ActiveRecord::Associations::CollectionProxy [#<Micropost id: 1, content: "This is a micropost", user_id: 1, created_at: "2014-06-23 02:30:12", updated_at: "2014-06-23 02:30:12">, #<Micropost id: 2, content: "This is another micropost", user_id: 1, created_at: "2014-07-13 20:54:49", updated_at: "2014-07-13 20:54:49">, #<Micropost id: 4, content: "This is another new post", user_id: 1, created_at: "2014-07-13 21:38:01", updated_at: "2014-07-13 21:38:01">]>

There's a lot more to this that we'll talk about later, in terms of how Active Record makes these data associations.  For now, the point is that we can cross-reference resources in the database.