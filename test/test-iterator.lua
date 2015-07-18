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

str = ''
expected = {}
actual = {}
for p in spliter(str, '|') do
  actual[#actual + 1] = p
end
t.same(actual, expected, "spliter('', '|') should return no results")
str = 'foobar'
expected = { 'foobar' }
actual = {}
for p in spliter(str, '|') do
  actual[#actual + 1] = p
end
t.is(#actual, 1, "spliter('foobar', '|') should yield one item")
t.same(actual, expected, "spliter('foobar', '|') should return 'foobar'")

local explode = function (pat)
  for _ in spliter('foo', pat) do
  end
end

t.boom(explode,{'%d*'}, 'Deviant pattern should throw error in spliterator')

t.done()
