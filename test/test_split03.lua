#!/usr/bin/env lua
local t = require 'tap'
package.path = '../src/?.lua;' .. package.path
local split = require 'split'

t.plan(1)

local s, got

s = ',foo,bar'
t.boom(split, {s, '%d*'}, 'Should blow up with deviant pattern.')
