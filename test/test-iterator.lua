#!/usr/bin/env lua
package.path = '../src/?.lua;' .. package.path
local spliter = require 'split'.spliterator
local t = require 'tapered'


local str = 'a,foo,bar,bizz,buzz,,b'
local expected = { 'a', 'foo', 'bar', 'bizz', 'buzz', '', 'b' }
local actual = {}
for p in spliter(str, ',') do
    actual[#actual + 1] = p
end
t.same(actual, expected, 'Build up a table of results from the split iterator')

str = ',foo,bar,bizz,buzz,,'
expected = { 'zzz', 'zzzfoo', 'zzzbar', 'zzzbizz', 'zzzbuzz', 'zzz', 'zzz' }
actual = {}
for p in spliter(str, ',') do
    actual[#actual + 1] = 'zzz' .. p
end
t.same(actual, expected, 'Adapt results from the split iterator')

t.done()
