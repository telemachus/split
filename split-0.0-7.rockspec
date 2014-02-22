package = 'split'
version = '0.0-7'
source = {
    url = 'https://github.com/telemachus/lua-split'
}
description = {
    summary = 'A split function for Lua',
    detailed = [[
        Lua has no built-in split function. This package provides one.
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
