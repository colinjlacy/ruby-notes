We can use the console to define methods the same way we would do in a file.  For the following example, we'll define a function `string_message` that takes an *argument* and returns a message based on whether or not that argument is empty.

	>> def string_message(string)
	>>	if string.empty?
	>>		"It's an empty string!"
	>>	else
	>>		"The string is not empty."
	>>	end                                 # ends the if
	>> end                                  # ends the def
	=> nil                                  # after running the def, nothing is returned

	>> puts string_message("")
	It's an empty string!
	=> nil

	>> puts string_message("foobar")
	The string is not empty
	=> nil

In this case, we're making use fo the *implicit return* property of the Ruby language.  We don't have to explicitly dictate `return` in our method; Ruby is smart enough to know what we mean.

If we want to define a method using *explicit return* statements, we could write the above code the following way:

	>> def string_message(string)
	>>	return "It's an empty string!" if string.empty?
	>>  return "The string is not empty"
	>> end

Note that the second return will never be reached if the conditional on the first return proves true.  If it does not, the first return will never run, and therefore the second will be the return read by the function.  You could therefore also not explicitly write `return` a second time, since the implicit return built into Ruby will return the second statement anyway.  But, keeping in mind readability, there's an argument for both.

##Looking at the Title Helper##

We can now go back to the previous section's `full_title` method with a better understanding for what's happening.

	module ApplicationHelper

		# Returns the full title on a per-page basis

		def full_title(page_title)                              # start by opening a method definition statement
			base_title = "Ruby on Rails Tutorial Sample App"    # define a local variable
			if page_title.empty?                                # conditional to see if the page_title arg is empty
				base_title                                      # implicitly returns the base title only
			else                                                # if page_title is not empty
				"#{base_title} | #{page_title}"                 # returns a formatted base_title and page_title
			end                                                 # ends the if
		end                                                     # ends the method definition
	end                                                         # ends the module definition

Just about everything here has been covered already.  The only thing to note about this block is that there's a *module* that this method belongs to.  Modules are ways to package re-usable and related methods, which can then be *mixed in* to Ruby classes using `include`.  Similar to Python, when writing Ruby by hand you'd have to explicitly include a module before you use it.  However with Rails, the module is automatically available to all of our views, making code-writing less of a chore.  Nice.  I wonder how namespacing is handled...