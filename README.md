# lua-split

Lua doesn't provide a `split` function. Such a function is nearly mandatory
for working with text, and as a result [a lot of people have made their
own][lua-wiki].

This is mine. It has some tests, but use at your own risk.

In the spliterator branch, there's a version that operates as an iterator,
rather than returning a list of results. This implementation has no tests.
I'm still thinking it over.

[lua-wiki]: http://lua-users.org/wiki/SplitJoin
