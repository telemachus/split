#!/usr/bin/env lua
local t = require 'tap'
package.path = '../src/?.lua;' .. package.path
local split = require 'split'.split

local s, got

-- First special case: split on an empty string returns each character, one
-- at a time.
s = 'foo'
got = split(s, '')
t.is(#got, 3, 'split(\'foo\', \'\') should have three items.')
t.is(got[1], 'f', 'First item should be \'f\'.')
t.is(got[2], 'o', 'Second item should be \'o\'.')
t.is(got[3], 'o', 'Third item should be \'o\'.')

-- Second special case: split on nil acts like you want to split on
-- continuous runs of spaces or tabs.
s = 'foo bar   bizz		bang'
got = split(s, nil)
t.is(#got, 4, 'split(\'foo bar    bizz  	bang\') should have four items.')
t.is(got[1], 'foo', 'First item should be \'foo\'.')
t.is(got[2], 'bar', 'Second item should be \'bar\'.')
t.is(got[3], 'bizz', 'Third item should be \'bizz\'.')
t.is(got[4], 'bang', 'Fourth item should be \'bang\'.')

t.done()
