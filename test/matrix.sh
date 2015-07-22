# Simulate Travis' matrix builds on drone.io

for lua in lua5.1 lua5.2 lua5.3 luajit
do
	rm -rf $HOME/.lua ;
	LUA="$lua" source "$CI/setenv_lua.sh" ;
	lua -v ;
	luarocks install tapered
	luarocks install luacov
	luarocks install luacov-coveralls
	for test in test-*.lua
	do
		lua -lluacov "$test"
		[ $? -eq 0 ] || exit $?
	done
done
luacov-coveralls -t "$COVERALLS_REPO_TOKEN"

