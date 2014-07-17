In this next part, we get to work on building the sample app that is used throughout the rest of this learning process.  Here, we create the controllers and actions that will make up the C of the MVC framework we'll work with.

In order to do that, we'll need to build some static pages, which we can do by creating a controller. We'll want to create static pages for `/home` and `/help`, so we'll add those to the `generate` script.

	$ rails generate static_pages home help --no-test-framework

That last option was added so that we can write our own test framework, and essentially run this app through test-driven development.

Creating the `static_pages_controller.rb` file also automatically updates the **routes** file in `config/routes.rb`, which Rails uses to match URLs with web content.  Looking in that file we see:

	# contents of config/routes.rb

	SampleApp::Application.routes.draw do
      get "static_pages/home"
      get "static_pages/help"
      .
      .
      .
    end

the rule `get "static_pages/home"` maps the URL `static_pages/home` to the *home* action in the *StaticPagesController*.  If you look in the file `app/controllers/static_pages_controller.rb`, you'll see that the creation of this file in the controller `generate` script built a class called StaticPagesController, which inherits from ApplicationController.  It then also has its own methods, `home` and `help`, defined as well.

	class StaticPagesController < ApplicationController
      def home
      end

      def help
      end
    end

Well, at this point, they're defined as empty, but we'll build on that. At the very least, they come with standard Rails capabilities that provide a corresponding view for each.  You can see this by navigating to either URL in the browser.

The view file will come automatically populated with the name of the controller and the action wrapped in an `<h1>`, and the path to the view, which in this case is `app/views/static_pages/home.html.erb`.  Things to take away from this:

* The actions listed in the `generate` script after the name of the controller each get their own methods in the controller, routes in `routes.rb`, and corresponding views.
* When establishing the view rules in the `routes.rb` file, rails assigns the `http GET` command to the view template, meaning no data is passed to the server before the template is returned.
* Though a static page is created by rails, we can consider it as useful as WP's initial **Hello World** post.  That is, we'll have to do some more work in order to make the view worth anything to us in production.
* It's perfectly acceptable for a Rails view to only contain html, as this initial view does.
