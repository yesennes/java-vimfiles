#!/bin/sh
DEFAULTPROF=`dconf read /org/gnome/terminal/legacy/profiles:/default`
DEFAULTPROF=`echo "$DEFAULTPROF" | sed -e "s/^'/:/" -e "s/'$//"`
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/cursor-shape "'$1'"
