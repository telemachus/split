-- There are many split functions for Lua. This is mine. Though, actually,
-- I took lots of ideas and probably some code from the implementations on
-- [the Lua-Users Wiki](http://lua-users.org/wiki/SplitJoin).

-- Faster lookup for built-in globals.
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
local function split(str, delimiter)
  -- Handle special cases concerning the delimiter parameter.
  -- If the pattern is nil, split on contiguous whitespace.
  -- Error out if the delimiter would lead to infinite loops.
  delimiter = delimiter or '%s+'
  -- This doesn't work yet. We would need to special case split every char.
  if delimiter == '' then return explode(str) end
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

  -- Keep going forward as long as there is a found match.
  while s do
    -- When we have a match, add the item from `position` to `s-1` to the
    -- list of items to be returned. This will produce empty elements if
    -- there are leading delimiters or runs of successive delimiters in
    -- the string.
    --
    -- After the item is added, advance `position` to just past the end of
    -- the delimiter and look for the next match from there.
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

-- Return the split function, so it can be required.
return split
