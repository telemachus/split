#!/usr/bin/env lua
local t = require 'tap'
package.path = '../src/?.lua;' .. package.path
local split = require 'split'
local join = table.concat

t.plan(15)

local s, got

s = 'foo,bar'
got = split(s, ',')
t.is(#got, 2, 'Split \'foo,bar\' on commas should have two items.')
t.is(got[1], 'foo', 'First item should be \'foo\'.')
t.is(got[2], 'bar', 'Second item should be \'bar\'.')

s = '1 2'
got = split(s, ' ')
t.is(#got, 2, 'Split \'1 2\' on a literal space should have two items.')
t.is(got[1], '1', 'First item should be \'1\'.')
t.is(got[2], '2', 'Second item should be \'2\'.')

s = 'foo bar'
got = split(s, '%s')
t.is(#got, 2, 'Split \'foo bar\' on space pattern [%s] should have two items.')
t.is(got[1], 'foo', 'First item should be \'foo\'.')
t.is(got[2], 'bar', 'Second item should be \'bar\'.')

s = 'foo bar'
got = split(s, '%s+')
t.is(#got, 2, 'Split \'foo bar\' on space pattern [%s+] should have two items.')
t.is(got[1], 'foo', 'First item should be \'foo\'.')
t.is(got[2], 'bar', 'Second item should be \'bar\'.')

s = 'foo\tbar'
got = split(s, '%s+')
t.is(#got, 2, 'Split \'foo\tbar\' on space pattern [%s+] should have two items.')
t.is(got[1], 'foo', 'First item should be \'foo\'.')
t.is(got[2], 'bar', 'Second item should be \'bar\'.')
