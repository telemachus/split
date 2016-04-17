#!/usr/bin/env lua
local t = require 'tapered'
package.path = '../src/?.lua;' .. package.path
local split = require 'split'

t.is(split.version(), '3.0.0-1', "version() returns '3.0.0-1'.")
t.is(split.author(), 'Peter Aronoff', "author() returns 'Peter Aronoff'.")
t.is(split.url(), 'https://bitbucket.org/telemachus/split',
     "url() returns 'https://bitbucket.org/telemachus/split'.")
t.is(split.license(), 'BSD 3-Clause', "license() returns 'BSD 3-Clause'.")

t.done()
