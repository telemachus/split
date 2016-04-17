#!/usr/bin/env lua
local t = require 'tapered'
package.path = '../src/?.lua;' .. package.path
local split = require 'split'

local s

s = ',foo,bar'
t.boom(split.split, {s, '%d*'},
       'split() should blow up with deviant pattern.')

s = ',foo,bar'
t.boom(split.first_and_rest, {s, '%d*'},
       'first_and_rest() should blow up with deviant pattern.')

t.done()
