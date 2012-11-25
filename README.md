# lua-split

Lua doesn't provide a `split` function. Such a function is nearly mandatory
for working with text, and as a result [a lot of people have made their
own][lua-wiki].

This is mine. It has some tests, but use at your own risk.

In the spliterator branch, there's a version that operates as an iterator,
rather than returning a list of results. This implementation has no tests.
I'm still thinking it over.

Examples:

    -- Split on a literal character
    split('foo,bar,buzz', ',')

    -- Split on a Lua pattern
    split('foo       bar		buzz', '%s+')

    -- A special case: split on the empty string returns each character.
    -- That is, it explodes the string.
    split('foo', '')

    -- Another special case: split on nil acts like splitting on '%s+'.
    split('foo')

[lua-wiki]: http://lua-users.org/wiki/SplitJoin
