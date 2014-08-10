If we go back to the CSS tag we added to our `erb` file, we can see some of the things we've been learning put into play:

	<%= stylesheet_link_tag "application", media: "all",
												"data-turbolinks-track" => true %>

Let's look at each part individualy.  We know that because of the `<%=...` whatever is returned from the statement within will be printed into the template.  Neat.

Next, we come across `stylesheet_link_tag`.  Rails defines a special function to include stylesheets.  But if it's a function, where are the parentheses?  In Ruby, parentheses around a function's arguments are optional.  Personally I find this extremely lame, but whatever.  The following two statements are equivalent:

	stylesheet_link_tag("application", media: "all", "data-turbolinks-track" => true)

	stylesheet_link_tag "application", media: "all", "data-turbolinks-track" => true        # yeah, that's easy to read, he said sarcastically

The `media:...true` bit sure looks like a hash, however there are no curly braces.  What's up with that?  In Ruby, if the last argument in a function call is a hash, the curly braces are optional (LAME.  Super LAME.  But whatever.)

	stylesheet_link_tag "application", media: "all", "data-turbolinks-track" => true        # is the same as...
	stylesheet_link_tag "application", { media: "all", "data-turbolinks-track" => true }

We also see that `media: "all"` uses the new notation, while `"data-turbolinks-track" => true` uses the old notation.  This is because of the dashes in the hash key name.  They force us to use the old notation, and attempting to use the new notation would be invalid.

Last, we have this statement broken up into two lines.  Why does Ruby interpret this the way we intend it to?  Ruby doesn't interpret white space in this kind of statement the way it would in a method definition.  Still unclear at this point as to what the rules are, but know that in this case we're safe breaking lines for easier readability (according to the author of the book, who also chose to omit punctuation in the above spots in a cruel gesture of inconsistency).

What does this function do?  It comes pre-packaged with Rails, and takes two arguments.  The first is a string, which tells Rails the name of the stylesheet we're looking for.  Rails will identify the matching file with the `.css` extension.  The second argument is a hash with to elements, indicating the media type attribute for the printed meta tag, and the second indicates to apply the Turbolinks option as a data attribute to the stylesheet, which is a new feature of Rails 4 meant to speed up CSS and JavaScript compiling on page reloads.  More [here](https://github.com/rails/turbolinks).

The resulting stylesheet meta tag is printed:

	<link data-turbolinks-track="true" href="/assets/application.css" media="all rel="stylesheet" />

And booya.