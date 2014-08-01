We're going to be doing a lot in the **Rails Console**, a command-line interface for Rails.  It's built on top of interactive Ruby (*irb*), and thus has access to the full Ruby language, as well as the full Rails environment.

We start the console by running the following in the command line:

	$ rails console

	# or

	$ rails c

We start by default in the **development** environment, one of the three environments defined by Rails (with the other being **test** and **production**).  In here we can write expressions that are evaluated and then whatever proper response Rails generates for our expression is returned.

	>> 17 + 42      # a simple math expression
	=> 59

