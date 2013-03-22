#!/usr/bin/env lua
require 'helper'

plan(15)

local s, got

s = 'foo,bar'
got = split(s, ',')
is(#got, 2, 'Split \'foo,bar\' on commas should have two items.')
is(got[1], 'foo', 'First item should be \'foo\'.')
is(got[2], 'bar', 'Second item should be \'bar\'.')

s = 'foo bar'
got = split(s, ' ')
is(#got, 2, 'Split \'foo bar\' on a literal space should have two items.')
is(got[1], 'foo', 'First item should be \'foo\'.')
is(got[2], 'bar', 'Second item should be \'bar\'.')

s = 'foo bar'
got = split(s, '%s')
is(#got, 2, 'Split \'foo bar\' on space pattern [%s] should have two items.')
is(got[1], 'foo', 'First item should be \'foo\'.')
is(got[2], 'bar', 'Second item should be \'bar\'.')

s = 'foo bar'
got = split(s, '%s+')
is(#got, 2, 'Split \'foo bar\' on space pattern [%s+] should have two items.')
is(got[1], 'foo', 'First item should be \'foo\'.')
is(got[2], 'bar', 'Second item should be \'bar\'.')

s = 'foo\tbar'
got = split(s, '%s+')
is(#got, 2, 'Split \'foo\tbar\' on space pattern [%s+] should have two items.')
is(got[1], 'foo', 'First item should be \'foo\'.')
is(got[2], 'bar', 'Second item should be \'bar\'.')
