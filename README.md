# split [![Build Status](https://drone.io/bitbucket.org/telemachus/split/status.png)](https://drone.io/bitbucket.org/telemachus/split/latest) [![Coverage Status](https://coveralls.io/repos/telemachus/split/badge.svg?branch=main&service=bitbucket)](https://coveralls.io/bitbucket/telemachus/split?branch=main)

## Synopsis

A string `split` function and iterator for Lua, which doesn't provide such
a function in its standard string library. Such a function is clearly useful,
and [many people have written their own][wiki].

[wiki]: http://lua-users.org/wiki/SplitJoin

## Usage

+ `split(string, delimiter) => { results }`	

  The delimiter can be a literal string or a Lua pattern. The function returns
  a table of items found by splitting the string up into pieces divided by the
  delimiter.

  Extra delimiters anywhere in the string will result in empty strings being
  returned as part of the results table.

  The function also provides two shortcuts for common situations. If the
  delimiter parameter is an empty string, the function returns a table
  containing every character in the original string as a separate item. If the
  delimiter parameter is `nil`, the function considers this equivalent to the
  Lua pattern `'%s+'` and splits the string on whitespace.

  Examples:

    * Split on a literal character

            local split = require 'split'.split
            split('foo,bar,buzz', ',') -- returns {'foo', 'bar', 'buzz'}
            split(',foo,bar,,buzz,', ',') -- returns {'', 'foo', 'bar', '', 'buzz', ''}

    * Split on a Lua pattern

            split('foo       bar		buzz', '%s+') -- returns {'foo', 'bar', 'buzz'}

    * A special case: empty string delimiter

        A pattern of the empty string is special. It tells the function to
        return each character from the original string as an individual item.
        Think of this as "explode the string".

            split('foo', '') -- returns {'f', 'o', 'o'}

    * Another special case: nil delimiter

        Passing nothing or an explicit `nil` as the delimiter is a second
        special case. `split` treats this as equivalent to a pattern of `'$s+'`
        and splits on consecutive runs of whitespace.

            split('foo       bar	buzz') -- returns {'foo', 'bar', 'buzz'}

+ `spliterator(string, delimiter) => custom iterator`

  This is an iterator version of the same idea. Everything from above applies,
  except that the function returns a custom iterator to work through results
  rather than a table.

            local spliter = require 'split'.spliterator

            local str = 'foo,bar,bizz,buzz,'
            local count = 1
            for p in spliter(str, ',') do
              print(count .. '. [' .. p .. ']')
              count = count + 1
            end

## Varia

The module provides four informational fields that return strings. They should
be self-explanatory and are probably of little use to most people.

+ `_AUTHOR`

+ `_VERSION`

+ `_LICENSE`

+ `_URL`

## Credits

Many of my ideas came from reading [the LuaWiki page on split][wiki]. I thank
all those contributors for their suggestions and examples.

All mistakes are mine. See [version history][c] for release details.

[c]: /CHANGES.md

---

(c) 2012-2015 Peter Aronoff. BSD 3-Clause license; see [LICENSE.md][li] for
details.

[li]: /LICENSE.md
