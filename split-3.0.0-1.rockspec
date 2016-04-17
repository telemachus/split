package = 'split'
version = '3.0.0-1'
source = {
  url = 'https://bitbucket.org/telemachus/split/downloads/split-v3.0.0-1.tar.gz',
  dir = 'split'
}
description = {
    summary = 'String split function and iterator for Lua',
    detailed = [[
        A string split function and iterator for Lua since the string standard
        library doesn't come with one.
    ]],
    homepage = 'https://bitbucket.org/telemachus/split',
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
