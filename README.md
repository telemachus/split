# split [![Build Status](https://drone.io/bitbucket.org/telemachus/split/status.png)](https://drone.io/bitbucket.org/telemachus/split/latest) [![codecov.io](http://codecov.io/bitbucket/telemachus/split/coverage.svg?branch=master)](http://codecov.io/bitbucket/telemachus/split?branch=master)

## Synopsis

A string `split` function and iterator for Lua sicne Lua's standard sting
library doesn't provide such a function. When working with text `split` is very
useful, and [many people have written a version for Lua][wiki].

[wiki]: http://lua-users.org/wiki/SplitJoin

## Usage

+ `split(string, delimiter) => { results }`	

  The delimiter can be a literal string or a Lua pattern. The function returns
  a table of items found by splitting the string up into pieces divided by the
  delimiter. If the delimiter is not present in the string, then the result
  will be a table consisting of one item: the original string parameter. Extra
  delimiters anywhere in the string will result in empty strings being returned
  as part of the results table.

  The function also provides two shortcuts for common situations. If the
  delimiter parameter is an empty string, the function returns a table
  containing every character in the original string as a separate item. (I.e.,
  if the delimiter is the empty string, the function explodes the string.) If
  the delimiter parameter is `nil`, the function considers this equivalent to
  the Lua pattern `'%s+'` and splits the string on whitespace.

  Examples:

    * Split on a literal character

            local split = require 'split'.split
            split('foo,bar,buzz', ',') -- returns {'foo', 'bar', 'buzz'}
            split(',foo,bar,,buzz,', ',') -- returns {'', 'foo', 'bar', '', 'buzz', ''}

    * Split on a Lua pattern

            split('foo       bar		buzz', '%s+') -- returns {'foo', 'bar', 'buzz'}

    * A special case: empty string delimiter

        If the delimiter is an empty string, the function returns each
        character from the original string as an individual item. Think of
        this as "explode the string".

            split('foo', '') -- returns {'f', 'o', 'o'}

    * Another special case: `nil` delimiter

        Pass nothing or an explicit `nil` as the delimiter and `split` acts as
        if the delimiter were `'$s+'`. This makes it easier to split on
        consecutive runs of whitespace.

            split('foo       bar	buzz') -- returns {'foo', 'bar', 'buzz'}

+ `each(string, delimiter) => custom iterator`

  **NB**: This function was previously called `spliterator`, but I've renamed
  it to the shorter and less goofy `each`. In order to give people who might
  rely on the previous name time to switch over, `spliterator` is still
  provided as an alias for `each`. However, that name will be removed in the
  next major version release (i.e., 4.0.0) of this module.

  This is an iterator version of the same idea as `split`. Everything from
  above applies, except that the function returns a iterator to work through
  results rather than a table.

            local split_each = require 'split'.each

            local str = 'foo,bar,bizz,buzz'
            local count = 1
            for p in split_each(str, ',') do
              print(count .. '. [' .. p .. ']')
              count = count + 1
            end

+ `first_and_rest(string, delimiter) => string, string (or nil)`

  This function is a string equivalent for a function that divides a list into
  its head and tail. The head of the string is everything that appears before
  the first appearance of a specified delimiter; the tail is the rest of the
  string. `first_and_rest` attempts to split a string into two pieces, and it
  returns two results using Lua's multiple return. The exact return values vary
  depending on the string and delimiter.

  In the simplest case, the string contains the delimiter at least once. If so,
  the first return value will be the portion of the string before the first
  appearance of the delimiter, and the second return value will be the rest of
  the string after that delimiter.

  If the delimiter does not appear in the string, however, then there's no
  possible split. In this case, the first return value will be the entire
  string, and the second return value will be `nil`. (From Lua's point of view,
  a second return value of `nil` is equivalent to saying that the function only
  returns one value.)

  If the second return value is `nil`, there is probably a problem or malformed
  record. So it will often make sense to test the second return value before
  proceeding. For example:

            local head, tail = first_and_rest(record, '%s*:%s*')
            if not tail then
              -- Signal an error to the caller.
            else
              -- Process the record.
            end

  A second complication is that the strings returned by the function may be
  empty. If the delimiter is found, but the portion of the string before or
  after it is zero-length, then an empty string may be returned. The examples
  below show various possible outcomes.

            first_and_rest('head: tail', ': ') -- returns 'head', 'tail'
            first_and_rest('head, tail', ': ') -- returns 'head, tail', nil
            first_and_rest(': tail', ': ') -- returns '', 'tail'
            first_and_rest('head: ', ': ') -- returns 'head', ''

  Like `split` and `each`, `first_and_rest` accepts `nil` or an empty string as
  special cases for the delimiter. `nil` is automatically transformed into
  '%s+', a generic "separated by space" pattern. In the case of an empty string
  delimiter, `first_and_rest` returns the first character of the input and the
  rest of the input. (This seems to be the only reasonable interpretation of
  "exploding" the input string in the context of this function.)

## Varia

The module provides four informational functions that return strings. They
should be self-explanatory.

+ `version() -- 3.0.0-1`

+ `author() -- Peter Aronoff`

+ `url() -- https://bitbucket.org/telemachus/split`

+ `license() -- BSD 3-Clause`

## Credits

Many of my ideas came from reading [the LuaWiki page on split][wiki]. I thank
all those contributors for their suggestions and examples.

[Alexey Melnichuk, AKA moteus][moteus] provided the idea and initial code for
`first_and_rest`.

All mistakes are mine. See [version history][c] for release details.

[moteus]: https://bitbucket.org/moteus
[c]: /CHANGES.md

---

(c) 2012-2016 Peter Aronoff. BSD 3-Clause license; see [LICENSE.md][li] for
details.

[li]: /LICENSE.md
