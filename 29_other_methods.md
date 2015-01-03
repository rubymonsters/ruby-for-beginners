# Lots of other methods

If you look at the methods that are defined on strings and arrays (e.g. run
`[].methods.sort` or `{}.methods.sort` in IRB), then you'll find quite a bunch
of method names that look like they are doing exactly what their names
describe.

For example, some of the things you can do with strings are:

* `"a string".capitalize` returns `"A string"`, with the first letter uppercased.
* `"a string".length` returns `8`, which is the length of the string.
* `"a string".start_with?("a")` returns `true`, because the string starts with an `"a"`.
* `"a string".include?("s")` returns `true`, because the string contains the character `"s"`.

Some examples for useful methods on arrays are:

* `[5, 1, 3].sort` returns another array, with the elements sorted: `[1, 3, 5]`.
* `[5, 1, 3].size` returns `3`, the number of elements in the array.
* `[1, 1, 1, 2].uniq` returns a new array with duplicate elements removed: `[1, 2]`.
* `[1, 2, 3].join(", ")` returns a string `"1, 2, 3"`.
* `[1, 2, 3].include?(2)` returns true because the array contains the number `2`.

How do you find all these methods?

The quickest way to find a certain method for an object often is to just ask
Google: "ruby array sort". That will point you to the Ruby documentation.
Another way is to read through all the methods for the class on the respective
Ruby documentation page. And of course, you can also read through the method
names returned by `[1, 2, 3].methods.sort`.
