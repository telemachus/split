for test in test-*.lua
do
	lua -lluacov "$test"
	[ $? -eq 0 ] || exit $?
done
