export PATH=${PATH}:$HOME/.lua:$HOME/.local/bin:${CI_BUILD_DIR}/install/luarocks/bin
bash $CI/setup_lua.sh
eval `$HOME/.lua/luarocks path`
