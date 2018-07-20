package = 'split'
version = '3.2.1-1'
source = {
  url = 'git://github.com/telemachus/split.git',
  branch = 'master',
  tag = 'v3.2.1-1'
}
description = {
    summary = 'String split function and iterator for Lua',
    detailed = [[
        A string split function and iterator for Lua since the string standard
        library doesn't come with one.
    ]],
    homepage = 'https://github.com/telemachus/split',
    license = 'BSD 3-Clause',
    maintainer = 'Peter Aronoff <telemachus@arpinum.org>'
}
dependencies = { 'lua >= 5.1' }
build = {
    type = 'builtin',
    modules = {
        split = 'src/split.lua',
    },
    copy_directories = { 'doc' }
}
