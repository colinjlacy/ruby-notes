This time around we'll add a page using a TDD approach.  This will be the About page that was purposely left off in the previous section.

THe first thing we'll do is write the failing test:

	describe "About page" do

        it "should have the content 'About Us'" do
          visit '/static_pages/about'
          expect(page).to have_content('About Us')
        end
    end

Then we'll execute the test in the command line:

	$ bundle exec rspec spec/requests/static_pages_spec.rb

That will result in a failing test, just as we'd hoped!  In fact, there is no page `/static_pages/about`, so there is neither a page to visit, nor content to inspect.  Having written a failing test, we can be confident that whatever code we add will only be up to our expectations if we can get our test to pass.

We'll now create the page by the same process in which we created the other pages.  The first thing we'll do is create the proper route in the file `config/routes.rb`:

	SampleApp::Application.routes.draw do
		get "static_pages/home"
		get "static_pages/help"
		get "static_pages/about"        # added just now
		.
		.
		.
	end

Now the test will fail because there's no action in the StaticPages controller.  Here is the content of `app/controllers/static_pages_controller.rb` once we're done with that step:

	class StaticPagesController < ApplicationController
        def home
        end

        def help
        end

        def about
        end
    end

Now the test will tell us that we're missing a template - i.e. a "view" for our MVC framework.  We'll add the following markup into the new file `app/views/about.html.erb`:

	<h1>About Us</h1>
    <p>
		The <a href="http://railstutorial.org/">Ruby on Rails Tutorial</a>
		is a project to make a book and screencasts to teach web development
		with <a href="http://rubyonrails.org/">Ruby on Rails</a>. This
		is the sample application for the tutorial.
    </p>

At this point, running the test in RSpec shows everything passing.  At this point, we're free to refactor our code with confidence; although in this case there's not much to refactor.  As we refactor larger blocks of code, we know that we start with a passing test.  Any changes we make can be reverted should our refactoring suddenly introduce any bugs, which we can test for every time we make a change.