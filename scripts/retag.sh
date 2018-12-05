#!/bin/sh
git push -d origin $1
git tag -d $1 
git tag $1
