The first thing I noticed in setting up this working environment for this particular book is how very specific the author was about getting all of the right versions installed.  That goes the same for all of the dependencies of RVM, RubyGems, and Rails, it would seem.  So the first thing I want to point out is to **always make sure I'm running on an environment packed with all of the proper software!**

Once that's done, it seems like things are built for a simple startup process.  To initialize an app, simply head to the command line, change to the directory you want to work in, and type:

	$ rails new this_app

The `Gemfile` manages the dependencies (known as *gems*)and their versions for the app.  When running `$ rails new`, a default set of gems are installed, some with their version numbers specified.  Those without verison numbers will simply download the latest versions.

 Here's what the default `Gemfile` looks like:

    source 'https://rubygems.org'

    # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
    gem 'rails', '4.0.5'

    # Use sqlite3 as the database for Active Record
    gem 'sqlite3'

    # Use SCSS for stylesheets
    gem 'sass-rails', '~> 4.0.2'

    # Use Uglifier as compressor for JavaScript assets
    gem 'uglifier', '>= 1.3.0'

    # Use CoffeeScript for .js.coffee assets and views
    gem 'coffee-rails', '~> 4.0.0'

    # See https://github.com/sstephenson/execjs#readme for more supported runtimes
    # gem 'therubyracer', platforms: :ruby

    # Use jquery as the JavaScript library
    gem 'jquery-rails'

    # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
    gem 'turbolinks'

    # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
    gem 'jbuilder', '~> 1.2'

    group :doc do
      # bundle exec rake doc:rails generates the API under doc/api.
      gem 'sdoc', require: false
    end

    # Use ActiveModel has_secure_password
    # gem 'bcrypt', '~> 3.1.7'

    # Use unicorn as the app server
    # gem 'unicorn'

    # Use Capistrano for deployment
    # gem 'capistrano', group: :development

    # Use debugger
    # gem 'debugger', group: [:development, :test]

This is all then compiled and packaged by running the commands:

	$ bundle update
	$ bundle install

The `bundle update` command took a few minutes, but installed some more software (which seems to be a thing) and the application is now ready to run.

In order to start the internal server, it's a simple command:

	$ rails server

That's it!  There's some information you can access by clicking the "About your Application's Environment" link, which will show you how your server is configured and running.  For example, I can see the versions of Ruby, of Rails, my JavaScript Runtime (it's Node, by the way), application root, etc.

##Version Control##

The next bit is to start up some sweet version control.  This is done by navigating to the root directory in a Terminal window, and typing:

	$ git init
	$ git add .
	$ git commit -m "Initial Commit"

Once that's done, an initial commit has been created.  In order to push up to GitHub, log in to your GitHub account, and then add a new respository.  It's important to remember not to allow GitHub to create a readme.md file, since Rails automatically creates one.  After that's done, the next step is to go back into the Terminal window, and add the following:

	

