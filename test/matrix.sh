# Simulate Travis' matrix builds on drone.io

for lua in lua5.1 lua5.2 lua5.3 luajit
do
	rm -rf $HOME/.lua ;
	LUA="$lua" source "$CI/setenv_lua.sh" ;
	lua -v ;
    for n in {1..5}
    do
        lua test_split0${n}.lua 
        [ $? -eq 0 ] || exit $?
    done
done
