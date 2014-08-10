Blocks are powerful aspects of the Ruby language, as they are able to abstract out a function call inline.  We'll demonstrate a block using a range's `each` method:

	>> (1...5).each { |i| puts 2 * i }      # where i is the local variable, and puts 2 * i is the action
	2
	4
	6
	8
	10
	=> 1...5                                # notice that in this case, the original, unchanged range is returned.

So above we have a block, which is indicated using the curly braces `{...}` notation.  The `i` surrounded by vertical pipes `|...|` indicates the local variable that will be iterated on, and the action that follows is what we'll do to each iteration of `i`.

We can also write a block in a style similar to writing a proper method:

	>> (1..5).each do |i|
	>>      puts 2 * i
	>> end
	2
    4
    6
    8
    10
    => 1...5

Since blocks can be written like functions, you can have blocks that have multiple operations executed within each iteration.  It's common convention to se the curly-braces notation for simple, one operation blocks, and the longer method notation for blocks with multiple operations.

    >> (1..5).each do |number|              # note that any variable will do, really
    >>      puts 2 * number
    >>      puts "--"                       # the second operation in the block
    >> end
    2
    --
    4
    --
    6
    --
    8
    --
    10
    --
    => 1...5

While the `each` method operates on the data set it's called upon, the `map` method actually returns values in an array.  We can think of it as essentially mapping a bi of data through an operation into its place in a final data set.

	>> (1..5).map { |i| i ** 2 }            # using the map method to square each number 1-5
	=> [1, 4, 9, 16, 25]