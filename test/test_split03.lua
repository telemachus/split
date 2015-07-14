#!/usr/bin/env lua
local t = require 'tapered'
package.path = '../src/?.lua;' .. package.path
local split = require 'split'.split

local s, got

s = ',foo,bar'
t.boom(split, {s, '%d*'}, 'Should blow up with deviant pattern.')

t.done()
