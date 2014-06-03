# lua-split

Lua doesn't provide a `split` function. Such a function is nearly mandatory
for working with text, and as a result [a lot of people have made their
own][lua-wiki].

[lua-wiki]: http://lua-users.org/wiki/SplitJoin

USAGE:

The module returns a table containing the `split` function and four
informational fields: `_VERSION`, `_AUTHOR`, `_URL` and `_LICENSE`.

To use the function itself, simply require it. For example:

    local split = require 'split'.split

The function `split` takes two parameters: first, the string to split, and
second, a literal or pattern delimiter to use to divide the given string.
The function returns a table containing the substrings.

Examples:

    -- Split on a literal character
    split('foo,bar,buzz', ',') -- returns {'foo', 'bar', 'buzz'}

    -- Split on a Lua pattern
    split('foo       bar		buzz', '%s+') -- returns {'foo', 'bar', 'buzz'}

    -- A special case: split on the empty string returns each character.
    -- That is, it explodes the string.
    split('foo', '') -- returns {'f', 'o', 'o'}

    -- Another special case: split on nil acts like splitting on '%s+'.
    -- The split below is equivalent to split('foo       bar	buzz', '%s+').
    split('foo       bar	buzz') -- returns {'foo', 'bar', 'buzz'}

There is also an iterator version. Since I'm still working on this
alternative, it's provided by a separate require:

    local spliter = require 'spliterator'.spliterator

    local str = 'foo,bar,bizz,buzz,'
    local count = 1
    for p in spliter(str, ',') do
      print(count .. '. [' .. p .. ']')
      count = count + 1
    end
