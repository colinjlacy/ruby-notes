An array is just a list of elements in a particular order.  Since we've started with strings, we can take a look at arrays by looking at the string `split` method:

	>> "foo bar     baz".split      # running the split method with its default split-string, the space character
	=> "["foo", "bar", "baz"]       # looks like an array to me!

	>> "fooxbarxbazx".split('x')    # passing an argument to split, which acts as a split-string
	=> "["foo", "bar", "baz"]

Ruby follows a similar convention to other programming languages when dealing with arrays in that each object in the array has an index, the array has a zer-offset, and it uses square-bracket notation for indexing items.

	>> fbb = ["foo", "bar", "baz"]  # save an array in a variable
	=> ["foo", "bar", "baz"]        # notice that similar to strings, the stored value is returned

	>> fbb[1]                       # selecting a value with an index of 1
	=> "bar"                        # The second value is returned, hence zero-offset

Conveniently, Ruby comes with a set of plain-language synonyms that help with programming to make life easier:

	>> fbb.first
	=> "foo"

	>> fbb.second
	=> "bar"

	>> fbb.last
	=> "baz"                        # Nice.

Like strings, arrays respond to the `length` method, and also respond to logical operators.

	>> fbb.length
	=> 3

	>> fbb.length == 3
	=> true

	>> fbb.length <= 1
	=> false

Arrays also come with their own methods, which can either mutate, or not mutate the array based on whether or not we use *bang* notation.  Here's the difference:

	>> a = [34, 1, 63]
	=> [34, 1, 63]

	>> a.sort                       # using the sort method
	=> [1, 34, 63]                  # returns a sorted array, but...

	>> a                            # when we call a
	=> [34, 1, 63]                  # we find that a hasn't changed.

	>> a.sort!                      # once we sort with a bang method, sort!...
	=> [1, 34, 63]                  # we return a sorted array...

	>> a                            # and when we call a again
	=> [1, 34, 63]                  # we find that a was indeed sorted.

Other methods you can use on arrays include `reverse`, and `shuffle`, which do exactly what they say they do.

In order to add an item to an array, we would use the `push` method, or its equivalent `<<` notation:

	>> a.push(96)
	=> [1, 34, 63, 96]              # adds the item to the end of the array, as one would expect.

	>> a << 112
	=> [1, 34, 63, 96, 112]         # result of using the alternative << notation

	>> a << "fox" << "die"          # chaining array pushes
	=> [1, 34, 63, 96, 112, "fox", "die"]

Notice that in Ruby, arrays can mix data types and be perfectly happy.  However things start to break if you run `sort` on mixed data types, since Ruby can't compare numbers to strings.

Arrays also welcome the `join` method, which converts them to strings.  Note that this does not mutate the array, and bang notation returns an error.

	>> a.join                       # combines all the things into a massive, ugly string"
	=> "1346396112foxdie"

	>> a.join(", ")                 # combines along a join string, also known as glue or a separator
	=> "1, 34, 63, 96, 112, fox, die"

Ruby also allows us to create a string array by writing it in short-hand:

	>> %w[a b c]                    # the %w in front of the short-hand array indicates each value will be a string
	=> ["a", "b", "c"]              # makes it a whole lot easier to write than by adding all those quotes!

Ranges are similar to arrays, although they're generally seen wrapped in parentheses in order for us to operate on them.

	>> 0...9                        # a range
	>> (0...9).count                # calling the count method on the range
	=> 9                            # notice that it says 9 and not 10.  we find out why in the next step.

	>> r = (0...9).to_a             # converting a range to an array
	=> [0, 1, 2, 3, 4, 5, 6, 7, 8]  # looks like a range stops before reaching the terminal number.

	>> s = ('a'...'e').to_a         # ranges also work with characters
	=> ["a", "b", "c", "d"]         # booya, array of characters.

It's worth noting that in the above example of setting an integer range, we used three-dot notation, `x...y`.  That led Ruby to include all number up to, but not including, the terminal number.  if we use two-dot notation, `x..y`, then the range will include the terminal number.
