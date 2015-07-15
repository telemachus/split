#!/usr/bin/env lua
local t = require 'tapered'
package.path = '../src/?.lua;' .. package.path
local split = require 'split'.split
local join = table.concat

local s, got

s = ',foo,bar'
got = split(s, ',')
t.is(#got, 3, "Split ',foo,bar' should have three fields")
t.is(got[1], '', 'First item should be empty field')
t.is(got[2], 'foo', "Second item should be 'foo'.")
t.is(got[3], 'bar', "Third item should be 'bar'.")

s = 'foo,bar,'
got = split(s, ',')
t.is(#got, 3, "Split 'foo,bar,' should have three fields")
t.is(got[1], 'foo', "First item should be 'foo'.")
t.is(got[2], 'bar', "Second item should be 'bar'.")
t.is(got[3], '', 'Third item should be empty.')

s = ',,,'
got = split(s, ',')
t.is(#got, 4, "Split ',,,' should have four fields")
t.is(got[1], '', 'First item should be empty field')
t.is(got[2], '', 'Second item should be empty field')
t.is(got[3], '', 'Third item should be empty field')
t.is(got[4], '', 'Fourth item should be empty field')

s = ','
got = split(s, ',')
t.is(#got, 2, "Split ',' should have two fields")
t.is(got[1], '', 'First item should be empty field')
t.is(got[2], '', 'Second item should be empty field')

t.done()
