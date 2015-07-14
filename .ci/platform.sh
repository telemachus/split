if [ "$(uname)" == "Linux" ]; then
  PLATFORM="linux" ;
else if [ "$(uname)" = "Darwin" ]; then
  PLATFORM="macosx" ;
fi
