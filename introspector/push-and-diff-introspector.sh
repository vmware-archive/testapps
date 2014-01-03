!/usr/bin/env bash

success = cd ~/workspace/testapps/introspector
gcf login -a api.acceptance.cli.cf-app.com -u jalford -p jalford -o unsc -s reach
cf target api.acceptance.cli.cf-app.com
cf login --username jalford --password jalford -o unsc -s reach
gcf push pushed-with-gcf
cf push pushed-with-cf
curl pushed-with-gcf.acceptance.cli.cf-app.com > pushed-with-gcf.txt
curl pushed-with-cf.acceptance.cli.cf-app.com > pushed-with-cf.txt

/usr/bin/env ruby <<-EORUBY

size = eval(File.read('pushed-with-gcf.txt')).size
puts "Size of gcf push: #{size}\n"
size = eval(File.read('pushed-with-cf.txt')).size
puts "Size of cf push:  #{size}\n"
puts ""
gcf_diff = eval(File.read('pushed-with-gcf.txt')) - eval(File.read('pushed-with-cf.txt')).sort
cf_diff = eval(File.read('pushed-with-cf.txt')) - eval(File.read('pushed-with-gcf.txt')).sort
puts "Files present only in gcf push:"
gcf_diff.each { |f| puts "\t#{f.inspect}" }
puts ""
puts "Files present only in cf push:"
cf_diff.each { |f| puts "\t#{f.inspect}" }
puts ""

EORUBY

echo "For reference, here's the .cfignore:"
cat .cfignore