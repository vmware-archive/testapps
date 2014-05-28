# Testapps
========

A repository of applications and tools to facilitate testing Cloud Foundry.

This repository is intended to supplement and perhaps eventually supplant [vcap-test-assets](http://github.com/cloudfoundry/vcap-test-assets).

It will augment the test assets in the [CATS](https://github.com/pivotal-cf-experimental/cf-acceptance-tests).

At present, it contains introspector, node-dora, and a cf-update shell script. 

Introspector is a simple rails app that outputs the complete file structure and contents of the container it's pushed to when `curl`'d.

Hello-node is a node.js "hello world" app that may be expanded to be a more interesting exploratory tool in the future.

Cf-update downloads the current edge build of cf and moves it to usr/local/bin.