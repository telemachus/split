# split version history

## *1.0.0-1* (July 16, 2015)

+ Initial public release

## *1.1.0-1* (July 19, 2015)

+ Various small improvements, thanks to [luacheck][luacheck].
+ Test coverage stats, thanks to [luacov][luacov],
  [luacov-coveralls][luacov-coveralls], and [coveralls][coveralls].

[luacheck]: https://github.com/mpeterv/luacheck
[luacov]: http://keplerproject.github.io/luacov
[luacov-coveralls]: https://github.com/moteus/luacov-coveralls
[coveralls]: https://coveralls.io

## *1.1.1-1* (December 5, 2015)

+ Test coverage stats are now thanks to [codecov][codecov].
+ Latest stable Lua in the 5.3 series is 5.3.2, so we test against that now.

[codecov]: https://codecov.io

## *2.0.0-1* (March 5, 2016)

+ Fix a bug when the iterator is used to explode a string. Thanks to Alexey
  Melnichuk for reporting the problem.
+ Change the information variables to functions. These serve the same purpose,
  but don't use variable names that Lua explicitly warns users about.

## *3.0.0-1* (April 24, 2016)

+ Clean up tests.
+ Change the name of `spliterator` to `each`. The new name is less silly and
  hopefully clearer. **NB**: For the moment, `spliterator` is still provided as
  an alias to `each`. However, in the next major version release (i.e.,
  4.0.0-1), `spliterator` will be removed. Please start switching any code that
  uses `spliterator` to `each`.
+ Add `first_and_rest`, a string equivalent to a function that splits a list
  into its head and tail.

Would you rather view the [documentation][d]?

[d]: /README.md
---

(c) 2012-2015 Peter Aronoff. BSD 3-Clause license; see [LICENSE.md][l] for
details.

[l]: /LICENSE.md
