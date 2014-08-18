THe first thing we're going to do is open up the `app/views/layout/application.html.erb` file.  This is the Rails default application template, which has all of the basics for an HTML page, as well as some embedded Ruby to product the actual content of the page.

We can add some Bootstrap classes and some navigation markup, and the resulting content of the template will look like this:

	<!DOCTYPE html>
    <html>
    <head>
      <title><%= full_title(yield(:title)) %></title>
      <%= stylesheet_link_tag    "application", media: "all", "data-turbolinks-track" => true %>
      <%= javascript_include_tag "application", "data-turbolinks-track" => true %>
      <%= csrf_meta_tags %>
    </head>
    <body>
      <header class="navbar navbar-fixed-top navbar-inverse">
          <div class="navbar-inner">
            <div class="container">
              <%= link_to "sample app", '#', id: "logo" %>
              <nav>
                <ul class="nav pull-right">
                  <li><%= link_to "Home",    '#' %></li>
                  <li><%= link_to "Help",    '#' %></li>
                  <li><%= link_to "Sign in", '#' %></li>
                </ul>
              </nav>
            </div>
          </div>
        </header>
        <div class="container">
            <%= yield %>
        </div>
    </body>
    </html>

Taking a look at the embedded Ruby in the navigation links, we can see there's a function being executed that outputs anchor tags with the proper content already filled in.  This works by way of the `link_to` Rails helper function.  The first argument passed is the linked text; the second is the URL.  For now, as you can see we're leaving these as just empty id targets.  We'll fill those in later.  The third argument is optional, and drops an `id` on the anchor being created.

We'll also add some more fun content to the Home page, since that'll be our first stop in the templating adventure.

	<div class="center hero-unit">
      <h1>Welcome to the Sample App</h1>

      <h2>
        This is the home page for the
        <a href="http://railstutorial.org/">Ruby on Rails Tutorial</a>
        sample application.
      </h2>

      <%= link_to "Sign up now!", '#', class: "btn btn-large btn-primary" %>
    </div>

    <%= link_to image_tag("rails.png", alt: "Rails"), 'http://rubyonrails.org/' %>

Most of this is pretty obvious, especially after the explanation from above.  the `<%= lint_to...%>` creates an anchor tag, and in the first example we have here, we see that a whole lot of Bootstrap classes are added to give it that sweet, Bootstrappy button appearance.  Nice.

The second example here has a new element to it, which is a function that outputs an image tag passed as the first argument - what would be the linked text.  Awesome enough, this does two things.  The first, it shows us that we can use the ERB statement `image_tag('image.png', alt: "alt tag")` function to output a complete `img` tag, the same way that `link_to` does.  I'd imagine you can probably pass attributes as well as the optional third argument.  The second thing it does is that it demonstrates how the arguments of `link_to` don't need to be a string.  They can be the returned value of another function as well.  Makes you wonder what else they can be...

