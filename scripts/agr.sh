#!/bin/sh
ag -0 -l $1 | xargs -0 sed -i '' -e "s/$1/$2/g"
