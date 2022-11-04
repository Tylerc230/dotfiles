git branch --merged | egrep -v "(^\*|master|dev|mainline)" | xargs git branch -d
