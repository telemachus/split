#!/usr/bin/env lua
local t = require 'tapered'
package.path = '../src/?.lua;' .. package.path
local split_first_and_rest = require 'split'.first_and_rest

local nret = function(...)
  return select("#", ...), ...
end

local function split(...)
  return nret(split_first_and_rest(...))
end

local s, n, a, b

t.boom(split, {nil, ','},
       "first_and_rest(nil, <anything>) should throw an error.")

s = ''
n, a = split(s, ',')
t.is(n, 1, "first_and_rest('', <anything>) should return empty string.")
t.is(a, '', "First item should be the empty string.")

s = ',foo,'
n, a, b = split(s, ',')
t.is(n, 2, "first_and_rest(',foo,', ',') should have two items.")
t.is(a, '', "First item should be the empty string.")
t.is(b, 'foo,', "Second item should be 'foo,'.")

s = ',foo'
n, a, b = split(s, ',')
t.is(n, 2, "first_and_rest(',foo', ',') should have two items.")
t.is(a, '', "First item should be the empty string.")
t.is(b, 'foo', "Second item should be 'foo'.")

s = 'foo,'
n, a, b = split(s, ',')
t.is(n, 2, "first_and_rest('foo,', ',') should have two items.")
t.is(a, 'foo', "First item should be 'foo'.")
t.is(b, '', "Second item should be the empty string.")

s = 'foobar'
n, a = split(s, ',')
t.is(n, 1, "first_and_rest('foobar', ',') should have one item.")
t.is(a, 'foobar', "First item should be 'foobar'.")

s = 'foobar'
n, a, b = split(s, '')
t.is(n, 2, "first_and_rest('foobar', '') should have two items.")
t.is(a, 'f', "First item should be 'f'.")
t.is(b, 'oobar', "First item should be 'oobar'.")

s = 'foo,bar'
n, a, b = split(s, ',')
t.is(n, 2, "first_and_rest('foo,bar', ',') should have two items.")
t.is(a, 'foo', "First item should be 'foo'.")
t.is(b, 'bar', "Second item should be 'bar'.")

s = '1 2'
n, a, b = split(s, ' ')
t.is(n, 2,   "first_and_rest('1 2', ' ') should have two items.")
t.is(a, '1', "First item should be '1'.")
t.is(b, '2', "Second item should be '2'.")

s = 'foo bar'
n, a, b = split(s, '%s')
t.is(n, 2, "first_and_rest('foo bar', '%s') should have two items.")
t.is(a, 'foo', "First item should be 'foo'.")
t.is(b, 'bar', "Second item should be 'bar'.")

s = 'foo bar'
n, a, b = split(s, '%s+')
t.is(n, 2, "first_and_rest('foo bar', '%s+') should have two items.")
t.is(a, 'foo', "First item should be 'foo'.")
t.is(b, 'bar', "Second item should be 'bar'.")

s = 'foo  bar'
n, a, b = split(s)
t.is(n, 2, "first_and_rest('foo  bar')—default space pattern—should have two items.")
t.is(a, 'foo', "First item should be 'foo'.")
t.is(b, 'bar', "Second item should be 'bar'.")

s = 'foo\tbar'
n, a, b = split(s, '%s+')
t.is(n, 2, "first_and_rest('foo\\tbar', '%s+') should have two items.")
t.is(a, 'foo', "First item should be 'foo'.")
t.is(b, 'bar', "Second item should be 'bar'.")

s = 'foo bar\tbug daz'
n, a, b = split(s, '%s+')
t.is(n, 2, "first_and_rest('foo bar\\tbug daz', '%s+') should have two items.")
t.is(a, 'foo', "First item should be 'foo'.")
t.is(b, 'bar\tbug daz', "Second item should be 'bar\\tbug daz'.")

t.done()
