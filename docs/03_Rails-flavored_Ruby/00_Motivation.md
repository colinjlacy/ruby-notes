One of the benefits of Ruby on Rails is that you can get an app up and running, with a steady API, having no knowledge of Ruby whatsoever.  While cool and awesome, that leads to plenty of limitations.  At the end of the day, if we do nothing more, we've made an alternative to WordPress.  Boo.

###Helpers###

At this point, we'll make our first *helper*.  A helper is a custom function that works in the Rails framework.  Let's get started!

THe motivation behind this helper is the dynamic title that we added in the previous section.  If the title is set, then it is displayed next to a string with a vertical pipe.  But if no title is specifically set in the `.erb` file, then nothing appears next to the pipe.  Looks pretty short-sighted.  The goal then is to create something that will only show the pipe if something is programmed to follow the string; if not, just the text string is shown.

	# Defining a full_title helper: app/helpers/application_helper.rb

	module ApplicationHelper

		#Returns the full title on a per-page basis
		def full_title(page_title)
			base_title = "Ruby on Rails Tutorial Sample App"
			if page_title.empty?
				base_title
			else
				"#{base_title} | #{page_title}"
			end
		end
	end

A few things to take note of here.  The first is that the file was actually already created, likely by the Rails initial setup, although it was empty save a module declaration.  The second thing to note is that this is a basic function with a local variable defined as a string, followed by an if that returns a value based on the contents of an argument.  Simple enough, though it'll take some time to get used to the syntax.

In order to put it into action, we'll replace the old title tag with the following in the layout file:

	<title><%= full_title(yield(:title)) %>

Now we'll add some tests:

	.
	.
	.
	describe "Home page" do
		it "should have the content 'Sample App' do
			visit "/static_pages/home"
			expect(page).to have_content('Sample App')
		end

		it "should have the base title" do
			visit "/static_pages/home"
			expect(page).to have_title("Ruby on Rails Tutorial Sample App")
		end

		it "should not have a custom page title" do
			visit "/static_pages/home"
			expect(page).not_to have_title('| Home')
		end
	end
	.
	.
	.

We can run the test and see that it fails.  The reason being that the `provide` line still gives the custom title to the page.  We'll want to remove that from the file `app/views/static_pages/home.html.erb`.  Booya.