package = 'split'
version = '1.0-0'
source = { url = 'https://bitbucket.org/telemachus/string-split' }
description = {
    summary = 'A split function for Lua',
    detailed = [[
        Lua has no built-in split function.  This package provides one.
    ]],
    license = 'BSD 3-Clause'
}
dependencies = { 'lua >= 5.1' }
build = {
    type = 'builtin',
    modules = {
        split = 'src/split.lua',
    },
    copy_directories = { 'doc' }
}
