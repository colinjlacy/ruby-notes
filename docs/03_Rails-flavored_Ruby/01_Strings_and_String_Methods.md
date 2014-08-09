We're going to be doing a lot in the **Rails Console**, a command-line interface for Rails.  It's built on top of interactive Ruby (*irb*), and thus has access to the full Ruby language, as well as the full Rails environment.

We start the console by running the following in the command line:

	$ rails console

	# or

	$ rails c

We start by default in the **development** environment, one of the three environments defined by Rails (with the other being **test** and **production**).  In here we can write expressions that are evaluated and then whatever proper response Rails generates for our expression is returned.

	>> 17 + 42      # a simple math expression
	=> 59

Notice that similar to Python or a JavaScript console, this executes the statement immediately and returns the result.

Next on our list is the String data type, which is pretty universal:

	>> ""       # an empty string
	=> ""       # rails console returns an empty string

	>> "foo"    # enter a string as a statement...
	=> "foo"    # and rails will return said string as a statement

These are *"string literals"*, also known as *"literal strings"*, since they are created manually using the double-quote character syntax, `"..."`.

Strings are subject to certain programming operations, such as concatenation and interpolation:

	>> "Colin" + " " + "Lacy"           # concatenation
	=> "Colin Lacy"

	>> first_name = "Colin"             # stored in a variable
	=> "Colin"                          # Rails returns the value stored
	>> last_name = "Lacy"
	=> "Lacy"
	>> "#{first_name) #{last_name}"     # interpolation, using the #{...} syntax to print a variable
	=> "Colin Lacy"

	# or

	>> "#{first_name} Lacy"
	=> "Colin Lacy"

If we want to **print** a string, as opposed to just execute its value, the most commonly used Ruby function is `puts` (which is short for `put s`, short for `put string`).

	>> puts "foo"
	foo
	=> nil

Tow things happened here.  The first is that the statement, in its execution, printed the string as opposed to returned its value.  The other is that the function didn't actually return anything.  As a result, the Rails console printed `nil` for the returned statement, indicating **nothing at all** was returned.  Which makes sense, since the evaluation is to print something out in a digital environment.

Using `puts` automatically appends a newline character - `\n` - to a string, while the related `print` statement does not.

	>> print "foo"
	foo=> nil

That looks terrible.

It's worth noting that, as in other programming languages, single-quoted strings are evaluated based on exactly what's contained within them, and any syntactical special characters are cancelled out.

	>> '#{first_name} Lacy'         # trying to single-quote a string
	=> "\#{first_name} Lacy"        # notice in the returned value the interpolation syntax is escaped

	>> puts '#{first_name} Lacy'    # trying to puts a single-quoted string
	{#first_name} Lacy              # notice that the printed value is an exact match of what was in the string
	=> nil                          # and, as is expected, nothing was returned.