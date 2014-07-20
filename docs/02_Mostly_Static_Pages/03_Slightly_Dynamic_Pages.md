In this step we're going to have the title of each page change dynamically, reflecting the content of the page.  Keep in mind that in the last step, a test suite was created to make sure that all three pages have specific content.  That being the case, as code is added to make these pages dynamic, we can test against our changes to make sure everything is gravy.

The first thing we'll do is make a temporary change to move the file `app/views/layouts/application.html.erb`.  We can do that in the command line by entering the following command:

	$ mv app/views/layouts/application.html.erb foobar   # temporary change