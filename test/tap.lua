local tap = {}

-- Helper variables and functions
local sprintf = string.format
local slice = string.sub
local get_info = debug.getinfo
local str_find = string.find
local unpack = unpack
local tonumber = tonumber
local test_count = 0
local debug_level = 3
local function printf(fmt, ...)
  return io.write(sprintf(fmt, ...))
end

-- A bargain-basement pair of setup and teardown hooks. Use as follows:
-- 1. In the test file, define global setup and teardown methods.
-- 2. Redefine them as wanted, and they will _dynamically_ update.
local function setup_call()
  if _G["setup"] then return _G["setup"]() end
end

local function teardown_call()
  if _G["teardown"] then return _G["teardown"]() end
end

-- All other tests are defined in terms of this primitive, which is
-- kept private.
local function _test(exp, msg)
  test_count = test_count + 1

  if msg then
    msg = sprintf(" - %s", msg)
  else
    msg = ''
  end

  setup_call()

  if exp then
    printf("ok %s%s\n", test_count, msg)
  else
    printf("not ok %s%s\n", test_count, msg)
    info = get_info(debug_level)
    printf("# Trouble in %s around line %s\n", slice(info.source, 2),
      info.currentline)
  end

  teardown_call()
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

-- A traditional plan function. If you don't mind counting tests, this is
-- the easiest way to keep TAP tools happy. Pass in a number and done.
--
-- If, however, you don't like counting or you don't know in advance,
-- there's an alternative. See the done() function below.
local function plan(n)
  printf('1..%d\n', n)
end
tap.plan = plan

-- The promised alternative to plan(n). This function can be used in one of
-- two ways. Most obviously, if you don't know how many tests you plan to
-- run or you just hate to manually count, then call done() with no
-- parameters. In this case, done will emit 1..n where n is the number of
-- tests that actually ran. This will satisfy traditional TAP tools.
--
-- On the other hand, if you know the number and simply prefer done(n) at
-- the end to plan(n) at the top, then you can call done(n) with a number.
-- If the number doesn't match the actual number of tests run, you'll get
-- a 'Bad plan' warning.
local function done(n)
  local expected = tonumber(n)
  if not expected or test_count == expected then
    printf('1..%d\n', test_count)
  elseif expected ~= test_count then
    local s
    if expected == 1 then s = '' else s = 's' end
    printf("# Bad plan. You planned %d test%s but ran %d\n",
      expected, s, test_count)
  end
end
tap.done = done

return tap
