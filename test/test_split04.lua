#!/usr/bin/env lua
require 'helper'

plan(9)

local s, got

-- First special case: split on an empty string returns each character, one
-- at a time.
s = 'foo'
got = split(s, '')
is(#got, 3, 'Split \'foo\' on commas should have three items.')
is(got[1], 'f', 'First item should be \'f\'.')
is(got[2], 'o', 'Second item should be \'o\'.')
is(got[3], 'o', 'Third item should be \'o\'.')

-- Second special case: split on nil acts like you want to split on
-- continuous runs of spaces or tabs.
s = 'foo bar   bizz		bang'
got = split(s, nil)
is(#got, 4, 'Split \'foo bar    bizz		bang\' on nil should have four items.')
is(got[1], 'foo', 'First item should be \'foo\'.')
is(got[2], 'bar', 'Second item should be \'bar\'.')
is(got[3], 'bizz', 'Third item should be \'bizz\'.')
is(got[4], 'bang', 'Fourth item should be \'bang\'.')
