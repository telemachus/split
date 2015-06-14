local find = string.find
local fmt = string.format
local cut = string.sub
local error = error

local spliterator = function (str, delimiter)
  -- Handle special cases concerning the delimiter parameter.
  -- If the pattern is nil, split on contiguous whitespace.
  -- Error out if the delimiter would lead to infinite loops.
  local delimiter = delimiter or '%s+'
  if delimiter == '' then delimiter = '.' end
  if find('', delimiter, 1) then
    local msg = fmt('The delimiter (%s) would match the empty string.',
      delimiter)
    error(msg)
  end

  local s, e, subsection
  local position = 1
  local function iter()
    s, e = find(str, delimiter, position)
    if s then
      subsection = cut(str, position, s-1)
      position = e + 1
      return subsection
    elseif position < #str then
      subsection = cut(str, position)
      position = #str + 2
      return subsection
    elseif position == #str + 1 then
      position = #str + 2
      return ''
    end
  end

  return iter
end

return {
  spliterator = spliterator,
  _VERSION = '0.2-0',
  _AUTHOR = 'Peter Aronoff',
  _URL = 'https://bitbucket.org/telemachus/lua-split',
  _LICENSE = 'BSD 3-Clause',
}
