#!/bin/bash
if [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ -z "$1" ]
then
    echo "
Shows the git log by order of AuthorDate instead of CommitDate."
    echo ""
    echo "Usage:"
    echo "author-log.sh <since>"
    exit 0
fi
git log --all --author=tyler --since=$1 --pretty="format:%at %C(yellow)commit %H%Creset\nAuthor: %an <%ae>\nDate: %aD\n\n %s\n" | sort -r | cut -d" " -f2- | sed -e "s/\\\n/\\`echo -e '\n\r'`/g" | tr -d '\15\32' | less -R
exit 0

