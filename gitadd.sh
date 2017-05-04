#!/bin/bash
git add .
print "Adding...."
git commit -m "update"
print "Comminting..."
git push -u origin master
print "Pushed"
done