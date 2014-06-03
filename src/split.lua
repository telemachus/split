-- There are many split functions for Lua. This is mine. Though, actually,
-- I took lots of ideas and probably some code from the implementations on
-- the Lua-Users Wiki, http://lua-users.org/wiki/SplitJoin.
local find = string.find
local fmt = string.format
local cut = string.sub
local error = error
local unpack = unpack

-- A special case: take each character from the string, one by one.
local function explode(str)
  local t = {}
  for i=1, #str do
    t[#t + 1] = cut(str, i, i)
  end

  return t
end

-- The heart of the matter. The split function breaks up a string into
-- a list. The function takes a string and a delimiter. The delimiter can
-- be a string literal or a Lua pattern. Returns a list of found matches.
local split = function (str, delimiter)
  -- Handle special cases concerning the delimiter parameter.
  -- 1. If the pattern is nil, split on contiguous whitespace.
  -- 2. Error out if the delimiter would lead to infinite loops.
  delimiter = delimiter or '%s+'
  if delimiter == '' then return explode(str) end
  -- Protect against patterns that match too much. Such patterns would hang
  -- the program.
  if find('', delimiter, 1) then
    local msg = fmt('The delimiter (%s) would match the empty string.',
      delimiter)
    error(msg)
  end

  -- The table `t` will store the found items. `s` and `e` will keep
  -- track of the start and end of a match for the delimiter. Finally,
  -- `position` tracks where to start grabbing the next match.
  local t = {}
  local s, e
  local position = 1
  s, e = find(str, delimiter, position)

  while s do
    t[#t+1] = cut(str, position, s-1)
    position = e + 1
    s, e = find(str, delimiter, position)
  end

  -- To get the (potential) last item, check if the final position is
  -- still within the string. If it is, grab the rest of the string into
  -- a final element.
  if position <= #str then
    t[#t + 1] = cut(str, position)
  end

  -- Special handling for a (potential) final trailing delimiter. If the
  -- last found end position is identical to the end of the whole string,
  -- then add a trailing empty field.
  if position > #str then
    t[#t+1] = ''
  end

  return t
end

return {
  split = split,
  _VERSION = '0.1-0',
  _AUTHOR = 'Peter Aronoff',
  _URL = 'https://bitbucket.org/telemachus/lua-split',
  _LICENSE = 'MIT License',
}
