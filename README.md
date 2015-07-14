# string-split

## Synopsis

Lua doesn't provide a `split` function, though such a function is nearly
mandatory for working with text. As a result [a lot of people have made their
own][wiki].  This library provides two split functions: a standard one and an
iterator version.

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

            split('foo,bar,buzz', ',') -- returns {'foo', 'bar', 'buzz'}
            split(',foo,bar,,buzz,', ',') -- returns {'', 'foo', 'bar', '', 'buzz', ''}

    * Split on a Lua pattern

            split('foo       bar		buzz', '%s+') -- returns {'foo', 'bar', 'buzz'}

    * A special case: an empty string delimiter

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

---

(c) 2012-2015 Peter Aronoff. BSD 3-Clause license; see [LICENSE.md][li] for
details.

[li]: /LICENSE.md
