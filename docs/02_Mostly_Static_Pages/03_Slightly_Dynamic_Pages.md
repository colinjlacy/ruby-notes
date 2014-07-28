In this step we're going to have the title of each page change dynamically using the `<title>` tag, reflecting the content of the page.  Keep in mind that in the last step, a test suite was created to make sure that all three pages have specific content.  That being the case, as code is added to make these pages dynamic, we can test against our changes to make sure everything is gravy.

The first thing we'll do is make a temporary change to move the file `app/views/layouts/application.html.erb`.  We can do that in the command line by entering the following command:

	$ mv app/views/layouts/application.html.erb foobar   # temporary change

In this example we're disabling the layout file.  In later steps, we'll find a better way to work with this.

For each page that we're creating a title for, we'll have a base title, and a variable title (a la WordPress, for example).  We'll build the failing test first, adding onto the tests we've already written:

	# added after the other test for the Home page

	it "should have the right title" do
		visit '/static_pages/home'
		expect(page.to have_title("Ruby on Rails Tutorial Sample App | Home")
	end

	# successfully fails!

We'll add this for the other two pages as well.  Yes, this shows some repetition, which will be eliminated later.  For now we'll hard-code the `<!DOCTYPE>` and `<head>` sections, just to get our tests to pass.  We'll add the following code to the Home page, and then follow-suit with Help and About.

	<!DOCTYPE html>
	<html>
		<head>
			<title>Ruby on Rails Tutorial Sample App | Home</title>
		</head>
		<body>
			<h1>Home</h1>
			<p>
				This is the home page for the
				<a href="http://railstutorial.org/">Ruby on Rails Tutorial</a>
				sample application.
			</p>
		</body>
	</html>

Now the tests pass, although it was a lot more work than necessary to get them up and running.  We have a lot of inefficient code running:
* repeated strings hard-coded in each title
* the HTML structure is repeated on each page
* the titles are all almost exactly the same

##Embedded Ruby##

The first thing we're going to do, oddly enough, is to make all of our titles exactly the same.  The goal here is to actually make it easier to remove duplication by making all titles duplicates and doing it in one step.  This will be the first Ruby embedded that we will manually embed in the app.  This will work via the Rails function `provide`.

	# the head section of the home page:

	<% provide(:title, 'Home') %>
	<!DOCTYPE html>
	<html>
		<head>
			<title>Ruby on Rails Tutorial Sample App | <%= yield(:title) %></title>
		</head>
	.
	.
	.
	</html>

This bring in the first example of *Embedded Ruby* in our app, also called *ERb*, which explains the file extension `.erb`.  ERb is the primary tamplate system for including dynamic content in web pages.  The line `<% provide(:title, 'Home') %>` indicates that Rails shoudl use the `provide` function to associate the string 'Home' with the label `:title`.  We then use the notation `<% ... %>` to insert content into the template, using the Ruby `yield` function.

The two different types of notation give us two different results.  `<% ... %>` means the code inside is executed.  `<%= ... %>` means the code inside is executed, and then inserts the result into the template.

In this case, the content on the page is exactly the same.  But now the title is generated dynamically.  By running the test in RSpec, we can see that everything still passes.  At this point we can make the same adjustments in the other two files, with the same results.

###Eliminating Duplication with Layouts###

Now that we've done this, all of our files have the same type of structure going on, which makes for way too much duplication.  In order to improve on this, Rails comes with a special *layout* file called `application.html.erb`.  We renamed this earlier, and will now restore it:

    $ mv foobar app/views/layouts/application.html.erb

A quick look at the contents will show that it is already structured to provide content dynamically, with plenty of ERb.  We'll use this layout to work with our pages, replacing the default title with the title tag we built in our three pages:

	<title>Ruby on Rails Tutorial Sample App | <%= yield(:title) %></title>

The resulting site layout code is as follows:

	<!DOCTYPE html>
    <html>
    <head>
        <title>Ruby on Rails Tutorial Sample App | <%= yield(:title) %></title>
        <%= stylesheet_link_tag    "application", media: "all", "data-turbolinks-track" => true %>
        <%= javascript_include_tag "application", "data-turbolinks-track" => true %>
        <%= csrf_meta_tags %>
    </head>
    <body>

    <%= yield %>

    </body>
    </html>

The `<%= yield %>` call is worth noting, as it inserts the content of the appropriate page into the layout file.  It's also worth noting the three additional lines regarding stylesheets, javascript, and meta tags.  The first two are drawn from the asset pipeline - which will be discussed later - and the third is a Rails method `csrf_meta_tags`, which prevents cross-site request forgery, a type of malicious web attack.

###Stripping Layout out of Content Files###

Now that we have a layout file that will run all of the necessary page structure for us, we can strip the content files down to the essentials.  That leaves us with just the ERb that defines the page title, and the content markup.

	# home page

	<% provide(:title, 'Home') %>
    <h1>Sample App</h1>
    <p>
        This is the home page for the
        <a href="http://railstutorial.org/">Ruby on Rails Tutorial</a>
        sample application.
    </p>

Without going into detail about how it necessarily works, we can see that - either by running tests, or by navigating to these pages in the browser - the views still work as expected.  The content is pulled into the layout file `application.html.erb`, the titles are defined and printed dynamically, and the contents of the individual views in the `views/static_pages/` directory replaces the `<%= yield %>` call on their respective routes.

It's worth noting that we renamed the file `application.html.erb` when we wanted to write up the static, and then dynamic head section of each page.  That essentially took the layout file out of the equation, which just left Rails with the content file for each route.  It's possible to speculate that the `application.html.erb` file is an integral part of the Rails structure in building web apps, and will be explored further later.