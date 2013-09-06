# lua-split

Lua doesn't provide a `split` function. Such a function is nearly mandatory
for working with text, and as a result [a lot of people have made their
own][lua-wiki].

This is mine. It has some tests, but use at your own risk.

In the spliterator branch, there's a version that operates as an iterator,
rather than returning a list of results. This implementation has no tests.
I'm still thinking it over.

USAGE:

The module only returns a single function (rather than a table). So you can
import it straightforwardly:

    local split = require 'split'

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

[lua-wiki]: http://lua-users.org/wiki/SplitJoin
