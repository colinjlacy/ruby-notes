Hashes are arrays that have key-value pairs, much like dictionaries in Python, or associative arrays in PHP.  They are indicated using the curly-brace notation `{...}` (which makes me think that repeated use of syntax for expression structure is one of the reasons Ruby had trouble taking on before Rails came around).

You can use strings to act as the key for a a hash, which will work just fine:

	>> me = { "first_name" => "Colin!", "stud" => true }
	=> {"first_name" => "Colin!", "stud" => true}

We can then call those values using the string as the identifier, the same way we would use an index in an array:

	>> me["stud"]
	=> true                 # so say we all

However instead of writing keys as strings, we can use what's know as *symbols*, which look like strings but are actually abstracted lables that don't carry the weight or functionality of strings.

	>> me = { :name => "Colin!", :stud => true }
	=> {:name => "Colin!", :stud => true}

	>> me[:name]
	=> "Colin!"

	>> me[:dweebishness]    # referencing an undefined key
	=> nil                  # returns the nil object, not an error

One thing that's important to note is that recently, within the confines of curly braces, symbol notation has changed to mimic other languages like JavaScript, noting the colon `:` after the name of the symbol, instead of before, and omitting the hashrocket `=>`.  The result looks a whole lot like a JavaScript object literal.

	>> me = { name: "Colin", stud: true }
	=> {:name => "Colin", :stud => true}        # even if we define a hash using the latter notation, the console still returns the original

However, this convention won't work outside of the curly-braces.  If we try to run `me[name:]` or `me[name]`, we'll see an error.  In any case outside of curly-brace notation, we'll need to use the first style of notation, `:name`, to reference a symbol.  It's good to be aware of both of these styles of hash notation, since people (especially, one might assume, those coming from JavaScript) have started to use the latter notation recently to write hashes.

We can pass hashes to blocks, but we need to keep in mind that unlike arrays, hashes have both keys and values, which are passed together to an iterating block.  Therefore, we have to account for both when we set local variables.  We can demonstrate this using the `each` method.

	>> me.each do |key, value|
	>>      puts "Key #{key.inspect} has value #{value.inspect}"
	>> end
	Key :name has value "Colin!"                # note that the inspect method returns the literal Ruby perspective of each item
    Key :stud has value true
    => {:name=>"Colin!", :stud=>true}           # the original hash is returned, unchanged

It's common enough to `puts x.inspect` that there's a shortcut notation for doing so.  However it's worth noting that while the long-form will return `nil`, the short-form will return the inspected value of the thing being operated upon

	>> p :name              # the same as saying puts :name.inspect
	:name
	=> :name                # notice that there's a returned :name here

	>> puts :name.inspect
	:name                   # the printed result is the same, but...
	=> nil                  # using the puts method returns nil

	>> p me[:name]          # the same as saying puts me[:stud].inspect
	"Colin!"                # printed result is what you'd expect, the value of me[:stud]
	=> "Colin!"             # but again, the inspected value is returned instead of nil

