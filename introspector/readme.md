# Introspector Readme
========

This is a rails app that displays the whole filestructure of the warden container it's in.

There is a script included, `push-and-diff-introspector.sh`, that pushes introspector using both the cf and gcf cli, then compares the resulting output. This is mostly aimed at comparing .cfignore behaviors between the two, and the .cfignore and filestructure of introspector are setup to facilitate this as well. It's setup to authenticate to the test environment at Pivotal; you may want to modify it to target your preferred instance. It cleans up after itself, right now - if you want the apps, routes or .txt files the script creates to persist long enough to investigate them, comment out the last block of the code.