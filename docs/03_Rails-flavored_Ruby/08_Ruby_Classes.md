##Constructors##

We've seen classes in our examples previous to this.  If we wanted to take a look at a string we build using a *literal constructor, we could pass to it the `class` method, which would tell us what class the string belongs to:

	>> s = "colin"
	=> "colin"

	>> s.class
	=> String       # crazy

We could also, if we were so daring, create a string by using the `new` function on the `String` class, known as a *named constructor*:

    >> t = String.new("lacy")       # note that writing lowercase "string" won't work
    => "lacy"

    >> t.class
    => String

    >> t
    => "lacy"

Arrays work the same way:

	>> a = Array.new([1, 2, 3])
	=> [1, 2, 3]

Hashes, however, are different.  While Arrays and Strings will take initial values, a Hash will take a default value that is returned when a non-existent key is called.  Think of a fallback avatar for a user, or a default permission setting when a new user is established.

    >> h = Hash.new("amateur")      # setting the default value
    => {}                           # notice that no values are set.  only the default fallback has been defined

    >> h[:level]
    => "amateur"                    # we called a non-existent key, and got the default value instead of nil

Each time we call a method on a built-in class, like `String.new`, that is called a *class method*.  Each span of the class, such as `s` is to `String`, is called an *instance*.  Each time we run a method on an instance, like `s.length`, we call that an *instance method*.

##Class Inheritance##

When looking for information as to what types of methods are available to a class, it's useful to access its `superclass` method, which will tell you the class it directly inherits from:

	>> s.superclass
	=> String

	>> s.superclass.superclass      # note that like other methods, superclass can be chained
	=> Object

	>> Object.superclass
	=> BasicObject                  # a new constructor class to Ruby 1.9, the highest of all the classes

In ruby, everything is ultimately a descendant of the `BasicObject` class.  This is why we say that everything in Ruby is an object, because they all descend from the `BasicObject' class.

Let's create our own class, which will examine whether or not a string passed to its method is a palindrome, returning true or false.

	>> class Word
	>>      def palindrome?(string)
	>>          string == string.reverse
	>>      end
	>> end
	=> nil

That's cool.  We can use it like so:

	>> w = Word.new                 # creates a new instance of our sweet class
	=> #<Word:0x22d0b20>            # the object instance created

	>> w.palindrome?("Colin!)
	=> false

	>> w.palindrome?("level")
	=> true

But wait, we're talking class inheritance, so why would we pass a string when we can inherit properties from the String class?  So let's do that by creating a new class, which will have its own `palindrome?` method, as well as all of the characteristics of the String object.

    >> class NewWord < String           # indicating that this class inherits from String
    >>      def palindrome?
    >>          self == self.reverse    # since the class inherits from String, it automatically has the reverse method built-in
    >>      end
    >> end
    => nil

    >> x = NewWord.new("level")         # creating a new NewWord the same way we would create a new String, since NewWord inherits from String
    => "level"

    >> x.palindrome?
    => true

    >> x.length                         # further proving that NewWord has all of String's methods available to it.
    => 5

##Modifying Built-In Classes##

Class inheritance is all well and good, but what if we want to revise the String class so that it also has the `palindrome?` method?  We can do taht the same way we did before, only this time we would act as though we're defining a new aspect of String, rather than inheriting from it:

    >> class String                     # which apparently works for both new classes and pre-defined classes
    >>      def palindrome?
    >>          self == self.reverse
    >>      end
    >> end
    => nil

	# now any string will have the method palindrome? available to it

	>> "deified".palindrome?
	=> true

Just know that it's best to be careful any time you alter a built-in class.  Rails has some well-though-out modifications that make sense for developers.  For example, there are many cases in which you want to make sure a string isn't blank, like a username.  However, Ruby only comes with the built-in string method `empty?`, which will return false (as in, not-empty), if the user enters a bunch of spaces.

	>> "         ".empty?
	=> false

To compensate, Rails adds the method `blank?` to the Object class, making sure there is more than just whitespace in a string (by way of inheritence).

	>> "         ".blank?
	=> true

##A Controller Class##

Now that we know a thing or two about inheritance, we can take a look back at `StaticPagesController`, which comes from the previous section, in which we built some static pages.

The entire file, as we left it, looks something like this:

	class StaticPagesController < ApplicationController

      def home
      end

      def help
      end

      def about
      end
    end

The first line tells us that `StaticPagesController` inherits from `ApplicationController`, which is a class defined in Rails.  We can even call `class` and `superclass` methods on these classes to find out what they inherit from.

It's worth noting that `home`, `help`, and `about` are all blank.  If we were to call `StaticPagesController.home`, the Rails console would return `nil`.  Yet they are able to have us render pages.  Why is that?

The reason is that Rails has its own way of doing things, built in Ruby, and in this case these three actions tell Rails what we want it to do - as does `StaticPagesController`, as we never called `StaticPagesController.new` - and Rails will take those hints and do its thing.  Handy, no?  There's obviously more to learn here, but that's beyond the scope of this section of this book.

##A User Class##

We'll wrap up our exploration of classes by creating a sweet class of our own.  For this example we'll create the file `example_user.rb` in our application root directory, and enter the following contents:

	class User
        attr_accessor :name, :email

        def initialize(attributes = {})
            @name = attributes[:name]
            @email = attributes[:email]
        end

        def formatted_email
            "#{@name} <#{@email}>"
        end
    end

So what do we have here?  In the first line, we define the class `User`.  Good.

In the second line, we have a line that defines *attribute accessors* corresponding to the user's name and email address.  This line creates *getter* and *setter* methods that allow us to retrieve (get) and assign (set) *instance variables*, `@name` and `@email`.

The first method, `initialize`, is a special method in Ruby, and is run when we call `User.new`.  In this case, the function will run with one argument, `attributes`, when we create a new `User` instance.

`attributes` has a default value set as an empty hash.  This means that we can expect any value that is not set in the passed arguement to be `nil`, since all hashes have a default value of `nil` for any key that has not been defined.  So if `:name` is not defined in the passed argument, we know that `@name` will be `nil`.

Finally, we have a method `formatted_email`, which uses the values of the assigned `@name` and `@email` variables to create a nicely formatted version of the user's email address.  Nothing fancy.  But it's important to note that because `@name` and `@email` are instance variables, they are available throughout the class definition, and therefore available to the definition of the `formatted_email` method.

So now we can run through the Rails console with an example of putting this class to use.  The Rails console runs with whatever files and version of Rails are available to it within the directory in which it's run.  In this case, I'm running it in the `/sample_app/` root directory.

    >> require './example_user'         # tells Rails to load the example_user file in this current directory
    => true

    >> example = User.new
    => #<User:0x224ceec @email=nil, @name=nil>

    >> example.name = "Colin!"          # apparently we're using dot-notation now
    => "Colin"

    >> example.email = "colin@colin.lacy"
    => "colin@colin.lacy"

    >> example.formatted_email
    => "Colin <colin@colin.lacy>"

If we want to, we can omit the whole process by creating a User instance that passes a hash to the `initialize` function.  Remember that when we wrote the class, we intended for it to have an empty hash as a default, so that the `@name` and `@email` variables would be initialized as `nil` when `attributes[:name]` and `attributes[:email]` are evaluated.  But we don't have to do that.  We can actually set those keys, so that when `initialize` is run it passes values to our instance variables.

	>> wife = User.new({:name => "Ashley", :email => "ashley@ashley.lacy"})
	=> #<User:0x007fa74ac790b8 @name="Ashley!", @email="ashley@ashley.lacy">

	>> wife.formatted_email
	=> "Ashley! <ashley@ashley.lacy>"

And that's all for our tour through Rails-flavored Ruby.  Most of this stuff is standard programming language goodness, and now we know how to apply some of it using Ruby as opposed to JavaScript or PHP.  The point of learning it, however was to give us a solid base for progressing though the Rails framework, being able to understand some of the basic Ruby we'll be writing, and being able to spot the Ruby that is written into our Rails files.