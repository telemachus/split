#!/usr/bin/env lua
require 'helper'

plan(1)

local s, got

s = ',foo,bar'
boom(split, {s, '%d*'}, 'Should blow up with deviant pattern.')

done()
