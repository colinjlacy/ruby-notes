The defining quality of test-driven development (TDD) is to write the tests first, before writing the application code.  By writing a failing test first, and then writing code that passes, we set our bar and make sure the code can reach it, which gives better confidence in our code than if we were to write tests based on what our code can already do.

The first thing we're going to do is generate an integration test for our static pages. Note that at this point we're using the *RSpec* gem, which uses the *request specification* for testing.  I have no idea what that means just yet.

	$ rails generate integration_test static_pages

	// outputs the following response:

	    invoke  rspec
        create    spec/requests/static_pages_spec.rb

As is obvious, this invokes the *RSpec* gem and creates the `static_pages_spec.rb` file.  Here is the contents we'll be putting in there, to write our very first test:

	require 'spec_helper'

    describe "Static pages" do

      describe "Home page" do

        it "should have the content 'Sample App'" do
          visit '/static_pages/home'
          expect(page).to have_content('Sample App')
        end
      end
    end

This is some pure Ruby, although the vocab is actually a combination of the *RSpec* and *Capybara* gems, which allow us to use English-like phrases for writing tests.  The real test is in the block starting with `it ... do`.  That line describes to humans what the test is supposed to do, so it's best to keep it simple, to the point, and logical.  The second line commands the test to `visit` the home page on which we're testing.  That's a function made accessible by *Capybara*, and simulates actually visiting the URL `static_pages/home` in a browser.  The last line is also full of *Capybara* vocab, and indicates to the test what should happen within the page.  It uses the variable `page` as the object on which the test is executed.

In order to have this test work properly, we'll have to add the Capybara DSL to the RSpec helper file.  So essentially, an extra step of configuration.  The RSpec helper file, `spec_helper.rb`, is located in the `/spec` directory.  Adding the DSL is done like so:

	# This file is copied to spec/ when you run 'rails generate rspec:install'
    .
    .
    .
    RSpec.configure do |config|
      .
      .
      .
      config.include Capybara::DSL
    end

We're essentially adding that last line right before the closing `end`.

In order to run the test, we'll use RSpec's command line interface, by executing it with `bundle exec` in order to make sure it runs in the environment specified by our `Gemfile`.  Also have no idea what that means.

	$ bundle exec rspec spec/requests/static_pages_spec.rb

It should fail, and the output in the Terminal window should be colored red to indicate that failure.

To get the test to pass we'll pop open the `home.html.erb` file and replace the content in the `<h1>` tag with **"Sample App"**.  If we run the test again, we should get a green message that says:

	1 example, 0 failures

We can now do a similar test for the Help page, making sure it contains the content "Help".  We'll add this next block to the `static_pages_spec.rb` file:

	    describe "Help page" do
            it "should have the content 'Help'" do
                visit '/static_pages/help'
                expect(page).to have_content('Help')
            end
        end

If we run the test again, we'll find that red message again, telling us that one of our tests failed.  We'll edit the `<h1>` again, this time in `help.html.erb`, so that this time it says **"Help"**, and then run the test again.  This time it passes!