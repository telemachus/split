package = 'split'
version = '0.1-0'
source = {
    url = 'https://bitbucket.org/telemachus/lua-split'
}
description = {
    summary = 'A split function for Lua',
    detailed = [[
        Lua has no built-in split function. This package provides one,
        as well as an iterator version.
    ]],
    license = 'MIT'
}
dependencies = {
    'lua >= 5.1'
}
build = {
    type = 'builtin',
    modules = {
        split = 'src/split.lua',
        spliterator = 'src/spliterator.lua'
    }
}
