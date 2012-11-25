#!/usr/bin/env lua
require 'helper'

plan(16)

local s, got

s = ',foo,bar'
got = split(s, ',')
is(#got, 3, 'Split \',foo,bar\' should have three fields')
is(got[1], '', 'First item should be empty field')
is(got[2], 'foo', 'Second item should be \'foo\'.')
is(got[3], 'bar', 'Third item should be \'bar\'.')

s = 'foo,bar,'
got = split(s, ',')
is(#got, 3, 'Split \'foo,bar,\' should have three fields')
is(got[1], 'foo', 'First item should be \'foo\'.')
is(got[2], 'bar', 'Second item should be \'bar\'.')
is(got[3], '', 'Third item should be empty.')

s = ',,,'
got = split(s, ',')
is(#got, 4, 'Split \',,,\' should have four fields')
is(got[1], '', 'First item should be empty field')
is(got[2], '', 'Second item should be empty field')
is(got[3], '', 'Third item should be empty field')
is(got[4], '', 'Fourth item should be empty field')

s = ','
got = split(s, ',')
is(#got, 2, 'Split \',\' should have two fields')
is(got[1], '', 'First item should be empty field')
is(got[2], '', 'Second item should be empty field')

done()
