local tap = {}

-- Helper variables and functions
local sprintf = string.format
local slice = string.sub
local get_info = debug.getinfo
local str_find = string.find
local unpack = unpack
local test_count = 0
local function printf(fmt, ...)
  return io.write(sprintf(fmt, ...))
end

-- All other tests are defined in terms of this primitive, which is
-- kept private.
local function _test(exp, msg)
  test_count = test_count + 1
  local debug_level = 3

  if msg then
    msg = sprintf(" - %s", msg)
  else
    msg = ''
  end

  if exp then
    printf("ok %s%s\n", test_count, msg)
  else
    printf("not ok %s%s\n", test_count, msg)
    info = get_info(debug_level)
    printf("# Trouble in %s around line %s\n", slice(info.source, 2),
      info.currentline)
  end
end

local function ok(expression, msg)
  _test(expression, msg)
end
tap.ok = ok

local function nok(expression, msg)
  _test(not expression, msg)
end
tap.nok = nok

local function is(actual, expected, msg)
  _test(actual == expected, msg)
end
tap.is = is

local function isnt(actual, expected, msg)
  _test(actual ~= expected, msg)
end
tap.isnt = isnt

local function like(str, pattern, msg)
  _test(str_find(str, pattern), msg)
end
tap.like = like

local function unlike(str, pattern, msg)
  _test(not str_find(str, pattern), msg)
end
tap.unlike = unlike

local function pass(msg)
  _test(true, msg)
end
tap.pass = pass

local function fail(msg)
  _test(false, msg)
end
tap.fail = fail

-- I really need a better name for this one, don't I?
local function boom(func, args, msg)
  err, errmsg = pcall(func, unpack(args))
  _test(not err, msg)
  if errmsg then
    printf('# Got this error:\n# %s\n', errmsg)
  end
end
tap.boom = boom

-- If you want to keep prove or other strict TAP tools happy, add a call to
-- done() at the end of your tests. This will give you a 'plan' at the end
-- of your output. (I hate having to count tests up-front, and I don't want
-- to make the user wait for all tests to run before I begin printing
-- results.)
local function done()
  printf('1..%d\n', test_count)
end
tap.done = done

return tap
