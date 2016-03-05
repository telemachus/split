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

str = 'a    foo bar	bizz		buzz  b'
expected = { 'a', 'foo', 'bar', 'bizz', 'buzz', 'b' }
actual = {}
for p in spliter(str) do
  actual[#actual + 1] = p
end
t.same(actual, expected, 'Use iterator with nil pattern')

str = 'foo'
expected = { 'f', 'o', 'o' }
actual = {}
for p in spliter(str, '') do
  print(#actual+1, p)
  actual[#actual + 1] = p
end
t.same(actual, expected, 'Use iterator to explode a string')

str = 'f.o.o'
expected = { 'f', 'o', 'o' }
actual = {}
for p in spliter(str, '%.') do
  actual[#actual + 1] = p
end
t.same(actual, expected, 'Use iterator with \'%.\' as the pattern')

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
