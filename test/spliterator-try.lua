require 'helper'
spliter = require 'spliterator'

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

str = 'foo,bar,bizz,buzz'

for p in spliter(str, ',') do
  print(p)
end

