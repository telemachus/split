for test in test-*.lua
do
	lua "$test"
	[ $? -eq 0 ] || exit $?
done
