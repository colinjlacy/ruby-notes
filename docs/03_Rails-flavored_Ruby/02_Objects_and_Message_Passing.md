In Ruby, everything is an *object*, which means each thing in Ruby has its own **messages** and **methods** to be executed upon, and can - in many cases - have properties added to it.  For example, the *string* object can respond to the `length` message, returning the length of the string:

	>> "Colin!".length
	=> 6

Similarly, it can receive a *method*, or function that is defined on the object (or object type) itself.  So a string can also respond to the `empty?` method.

	>> "Colin!".empty?
	=> false

	>> "".empty?
	=> true

The question mark at the end of the method is a Ruby convention, which indicates that the returned value is going to be a boolean.  Pretty handy.  We can use boolean values in conditional programming, like so:

	>> s = "foobar"
	=> "foobar"

	>> if s.empty?                  # writing a conditional
	>>	"The string is empty"
	>> else                         # apparently no special characters involved in evaluated expressions
	>>  "The string is not empty"
	>> end                          # note the end statement
	=> "The string is not empty"

Booleans can also be combined into logical expressions using the `&&`, `||`, and `!` operators, which symbolize logical "and", "or", and "not", respectively.

	>> t = ""
	=> ""

	>> puts "Both strings are empty" if s.empty? && t.empty?        # conditional tacked on to a statement
	=> nil                                                          # returns nothing, with nothing printed since the if evaluates false

	>> puts "One string is empty" if s.empty? || t.empty?
	One string is empty
	=> nil

	>> puts "s is not empty" if !s.empty?
	s is not empty
	=> nil

Since everything in Rails is an object, `nil` is therefore also an object.  We can even run the `to_s` method on `nil`, which turns the object in question into a string.  In this case the string would be `""`.

	>> nil.to_s
	=> ""

Using this method we can take a look at some sweet method chaining, which is a familiar trait in JavaScript.

	>> nil.to_s.empty?
	=> true

THe above statement takes the `nil` object, and passes to it the `to_s` method, and then passes to the result of that expression the `empty?` method.  The returned result is `true`, since it's essentially asking the same thing as if an empty string is empty.  Note that if we tried to pass the `empty?` method to the `nil` object, we would return an error.

As seen above, Ruby allows us to write statements that evaluate only if the conditional we tack to the end of the statement evaluates to true.

    >> puts "s has something going on" if !s.empty?
    s has something going on
    => nil

Another way of writing this uses the `unless` conditional instead of the `if` conditional, thus eliminating the need for us to negate the attached statement.

	>> puts "s has something going on" unless s.empty?
	s has something going on
	=> nil

	# let's combine some techniques we've learned...

	>> puts "the s variable says '#{s}'" unless s.empty?
	the s variable says 'foobar'
	=> nil

On a side note, it's worth noting that the `nil` object and only the `nil` object evaluates to `false` when passed as a conditional.  Every other object in Ruby, including `0`, evaluates to true.
