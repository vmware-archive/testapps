testapps
========

A repository of applications for testing Cloud Foundry.

This repository will ultimately supplant [vcap-test-assets](http://github.com/cloudfoundry/vcap-test-assets).

It will augment the test assets in the [CATS](https://github.com/pivotal-cf-experimental/cf-acceptance-tests).

At present, it contains introspector, node-dora, and a gcf-update shell script. 

Introspector is a simple rails app that outputs the complete file structure and contents of the container it's pushed to.

Node-dora is a node.js "hello world" app that may be expanded to be a more interesting exploratory tool in the future.

gcf-update downloads the current edge build of gcf and moves it to usr/local/bin.