#!/usr/bin/env lua
package.path = '../src/?.lua;' .. package.path
local split = require 'split'
local spliter = split.spliterator
local each = split.each
local t = require 'tapered'

local str, expected, actual

t.same(spliter, each, "spliterator should be an alias for each.")

str = 'a,foo,bar,bizz,buzz,,b'
expected = { 'a', 'foo', 'bar', 'bizz', 'buzz', '', 'b' }
actual = {}
for p in each(str, ',') do
  actual[#actual + 1] = p
end
t.same(actual, expected, "each(str, ',') should iterate over the string.")

str = 'a    foo bar	bizz		buzz  b'
expected = { 'a', 'foo', 'bar', 'bizz', 'buzz', 'b' }
actual = {}
for p in each(str) do
  actual[#actual + 1] = p
end
t.same(actual, expected, "each(str) should properly handle nil delimiter.")

str = 'foo'
expected = { 'f', 'o', 'o' }
actual = {}
for p in each(str, '') do
  actual[#actual + 1] = p
end
t.same(actual, expected, "each(str, '') should iterate over each character.")

str = 'f.o.o'
expected = { 'f', 'o', 'o' }
actual = {}
for p in each(str, '%.') do
  actual[#actual + 1] = p
end
t.same(actual, expected, "each(str, '%.') should split on a literal period.")

str = ',foo,bar,bizz,buzz,,'
expected = { 'zzz', 'zzzfoo', 'zzzbar', 'zzzbizz', 'zzzbuzz', 'zzz', 'zzz' }
actual = {}
for p in each(str, ',') do
  actual[#actual + 1] = 'zzz' .. p
end
t.same(actual, expected,
       "each(str, ',') should be able to change returned items.")

str = ''
expected = {}
actual = {}
for p in each(str, '|') do
  actual[#actual + 1] = p
end
t.same(actual, expected, "each('', '|') should return no results.")
str = 'foobar'
expected = { 'foobar' }
actual = {}
for p in each(str, '|') do
  actual[#actual + 1] = p
end
t.is(#actual, 1, "each('foobar', '|') should yield one item.")
t.same(actual, expected, "each('foobar', '|') should return { 'foobar' }.")

local explode = function (pat)
  for _ in each('foo', pat) do
  end
end

t.boom(explode,{'%d*'}, "Deviant pattern should throw error in each.")

t.done()
