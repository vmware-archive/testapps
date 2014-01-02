#!/bin/bash

cd ~/workspace
git clone https://github.com/pivotal-cf-experimental/testapps.git
cd testapps/introspector
gcf login -a
cf login 
gcf push pushed-with-gcf
cf push pushed-with-cf
curl pushed-with-gcf.acceptance.cli.cf-app.com => pushed-with-gcf.txt
curl pushed-with-cf.acceptance.cli.cf-app.com => pushed-with-cf.txt
irb
eval(File.read('pushed-with-gcf.txt')).size
eval(File.read('pushed-with-cf.txt')).size
gcfdiff = eval(File.read('pushed-with-gcf.txt)) - eval(File.read('pushed-with-cf.txt)).sort
cfdiff = eval(File.read('pushed-with-cf.txt)) - eval(File.read('pushed-with-gcf.txt)).sort
gcfdiff.each { |f| puts f.inspect}
cfdiff.each { |f| puts f.inspect}