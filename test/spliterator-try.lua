#!/usr/bin/env lua
package.path = '../src/?.lua;' .. package.path
spliter = require 'spliterator'.spliterator

-- str = 'foo,bar,bizz,buzz'

-- for p in spliter(str, ',') do
  -- print(p)
-- end

-- str = ',,,'

-- for p in spliter(str, ',') do
--   print('Piece ' .. p)
-- end

-- str = 'foo,bar,bizz,'

-- for p in spliter(str, ',') do
--   print('Piece ' .. p)
-- end

local str = 'foo,bar,bizz,buzz,'
local count = 1
for p in spliter(str, ',') do
  print(count .. '. [' .. p .. ']')
  count = count + 1
end
