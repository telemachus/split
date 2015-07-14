#!/usr/bin/env bash

set -e

mkdir -p doc

{
	printf "<!DOCTYPE html>\n"
	printf "<html lang=\"en\">\n"
	printf "<head>\n"
	printf "<meta charset=\"utf-8\">\n"
	printf "<meta name=\"author\" content=\"Peter Aronoff\">\n"
	printf "<title>string-split documentation</title>\n"
	printf "<link rel=\"stylesheet\" href=\"normalize.css\" "
	printf "media=\"screen,projection\">\n"
	printf "<link rel=\"stylesheet\" href=\"screen.css\" "
	printf "media=\"screen,projection\">\n"
	printf "</head>\n"
	printf "<body>\n"
	markdown README.md | sed -e 's/\/CHANGES.md/changes.html/' -e 's/\/LICENSE.md/license.html/' -e 's/LICENSE.md/the license/'
	printf "</body>\n"
	printf "</html>\n"
} > doc/index.html

{
	printf "<!DOCTYPE html>\n"
	printf "<html lang=\"en\">\n"
	printf "<head>\n"
	printf "<meta charset=\"utf-8\">\n"
	printf "<meta name=\"author\" content=\"Peter Aronoff\">\n"
	printf "<title>string-split version history</title>\n"
	printf "<link rel=\"stylesheet\" href=\"normalize.css\" "
	printf "media=\"screen,projection\">\n"
	printf "<link rel=\"stylesheet\" href=\"screen.css\" "
	printf "media=\"screen,projection\">\n"
	printf "</head>\n"
	printf "<body>\n"
	markdown CHANGES.md | sed -e 's/\/CHANGES.md/changes.html/' -e 's/\/LICENSE.md/license.html/' -e 's/LICENSE.md/the license/'
	printf "</body>\n"
	printf "</html>\n"
} > doc/changes.html

{
	printf "<!DOCTYPE html>\n"
	printf "<html lang=\"en\">\n"
	printf "<head>\n"
	printf "<meta charset=\"utf-8\">\n"
	printf "<meta name=\"author\" content=\"Peter Aronoff\">\n"
	printf "<title>string-split license</title>\n"
	printf "<link rel=\"stylesheet\" href=\"normalize.css\" "
	printf "media=\"screen,projection\">\n"
	printf "<link rel=\"stylesheet\" href=\"screen.css\" "
	printf "media=\"screen,projection\">\n"
	printf "</head>\n"
	printf "<body>\n"
	markdown LICENSE.md
	printf "</body>\n"
	printf "</html>\n"
} > doc/license.html
