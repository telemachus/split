#!/usr/bin/env lua
local t = require 'tapered'
package.path = '../src/?.lua;' .. package.path
local split = require 'split'.split

local s, got

s = 'fōö,bàr,bízz,bũzz'
got = split(s, ',')
t.is(#got, 4, "split('fōö,bàr,bízz,bũzz', ',') returns four items")
t.is(got[1], 'fōö', "The first item is 'fōö'")
t.is(got[2], 'bàr', "The second item is 'bàr'")
t.is(got[3], 'bízz', "The third item is 'bízz'")
t.is(got[4], 'bũzz', "The fourth item is 'bũzz'")

s = 'ἄνδραἦμοιἦἔννεπεἦΜοῦσαἦπολύτροπον'
got = split(s, 'ἦ')
t.is(#got, 5,
     "split('ἄνδραἦμοιἦἔννεπεἦΜοῦσαἦπολύτροπον', 'ἦ') returns five items")
t.is(got[1], 'ἄνδρα', "The first item is 'ἄνδρα'")
t.is(got[2], 'μοι', "The second item is 'μοι'")
t.is(got[3], 'ἔννεπε', "The third item is 'ἔννεπε'")
t.is(got[4], 'Μοῦσα', "The fourth item is 'Μοῦσα'")
t.is(got[5], 'πολύτροπον', "The fifth item is 'πολύτροπον'")
