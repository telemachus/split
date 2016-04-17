#!/usr/bin/env lua
local t = require 'tapered'
package.path = '../src/?.lua;' .. package.path
local split = require 'split'.split

local s, got

s = ''
got = split(s, ',')
t.same(got, {}, "split('', <anything>) should return empty table.")

s = 'foobar'
got = split(s, ',')
t.is(#got, 1, "split('foobar', ',') should have one item.")
t.is(got[1], 'foobar', "First item should be 'foobar'.")

s = 'foo,bar'
got = split(s, ',')
t.is(#got, 2, "split('foo,bar', ',') should have two items.")
t.is(got[1], 'foo', "First item should be 'foo'.")
t.is(got[2], 'bar', "Second item should be 'bar'.")

s = '1 2'
got = split(s, ' ')
t.is(#got, 2, "split('1 2', ' ') should have two items.")
t.is(got[1], '1', "First item should be '1'.")
t.is(got[2], '2', "Second item should be '2'.")

s = 'foo bar'
got = split(s, '%s')
t.is(#got, 2, "split('foo bar', '%s') should have two items.")
t.is(got[1], 'foo', "First item should be 'foo'.")
t.is(got[2], 'bar', "Second item should be 'bar'.")

s = 'foo bar'
got = split(s, '%s+')
t.is(#got, 2, "split('foo bar', '%s+') should have two items.")
t.is(got[1], 'foo', "First item should be 'foo'.")
t.is(got[2], 'bar', "Second item should be 'bar'.")

s = 'foo\tbar'
got = split(s, '%s+')
t.is(#got, 2, "split('foo\\tbar', '%s+') should have two items.")
t.is(got[1], 'foo', "First item should be 'foo'.")
t.is(got[2], 'bar', "Second item should be 'bar'.")

t.done()
