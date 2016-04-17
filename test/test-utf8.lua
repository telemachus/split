#!/usr/bin/env lua
local t = require 'tapered'
package.path = '../src/?.lua;' .. package.path
local split = require 'split'.split

local s, got

s = 'fōö,bàr,bízz,bũzz'
got = split(s, ',')
t.is(#got, 4, "split('fōö,bàr,bízz,bũzz', ',') returns four items")
t.is(got[1], 'fōö', "The first item should be 'fōö'.")
t.is(got[2], 'bàr', "The second item should be 'bàr'.")
t.is(got[3], 'bízz', "The third item should be 'bízz'.")
t.is(got[4], 'bũzz', "The fourth item should be 'bũzz'.")

s = 'ἄνδραἦμοιἦἔννεπεἦΜοῦσαἦπολύτροπον'
got = split(s, 'ἦ')
t.is(#got, 5,
     "split('ἄνδραἦμοιἦἔννεπεἦΜοῦσαἦπολύτροπον', 'ἦ') returns five items")
t.is(got[1], 'ἄνδρα', "The first item should be 'ἄνδρα'.")
t.is(got[2], 'μοι', "The second item should be 'μοι'.")
t.is(got[3], 'ἔννεπε', "The third item should be 'ἔννεπε'.")
t.is(got[4], 'Μοῦσα', "The fourth item should be 'Μοῦσα'.")
t.is(got[5], 'πολύτροπον', "The fifth item should be 'πολύτροπον'.")
