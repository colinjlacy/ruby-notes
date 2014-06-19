The next bit is to start up some sweet version control.  This is done by navigating to the root directory in a Terminal window, and typing:

	$ git init
	$ git add .
	$ git commit -m "Initial Commit"

Once that's done, an initial commit has been created.  In order to push up to GitHub, log in to your GitHub account, and then add a new respository.  It's important to remember not to allow GitHub to create a readme.md file, since Rails automatically creates one.  After that's done, the next step is to go back into the Terminal window, and add the following:

	$ git remote add origin https://github.com/<username>/first_app.git
    $ git push -u origin master

This tells Git that GitHub is the origin for my main/master branch, and that I want to push my project up to GitHub to populate said branch.

Once I want to start editing, I'll do so on a different branch:

	$ git checkout -b modify-SOMEFILE

This tells Git that I want to make a clone of the master branch, and name it `modify-SOMEFILE`.  I can check which branch I'm working on by typing the command:

	$ git branch

Once changes have been made, we can look at the status of the branch:

	$ git status

From here you can add the changed files by typing `$ git add .` again, but Git provides a flag to operate as a shortcut for the very-common case of committing all changed files.  Here's the whole Git command:

	$ git commit -a -m "This is what I do!"

Generally people write Git commit messages in the present tense, to describe what each commit does to alter the app, considering that as long as it's active, it's still taking effect.

Once the changes have been committed, we're ready to merge our changes back to our `master` branch.  To do this, we first checkout our master branch again.

	$ git checkout master

Then we merge `master` with the branch we just committed.

	$ git merge modify-SOMEFILE

That will bring all of the changes into the master branch, which leaves us with one last thing to do before pushing: delete the extraneous branch:

	$ git branch -d modify-SOMEFILE

And now, finally, we push the changes to GitHub:

	$ git push

That's version control in a nutshell, and will be a big part of working with Rails.  Version control is huge in the Rails community - in fact, in most current web development communities.  So it's good to get familiar with this ASAP.