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

##Introducing Dynamic Content!##

The first thing we're going to do, oddly enough, is to make all of our titles exactly the same.  The goal here is to actually make it easier to remove duplication by making all titles duplicates and doing it in one step.