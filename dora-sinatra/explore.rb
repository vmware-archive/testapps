require 'rubygems'
require 'sinatra'
require 'logger'

# Unique identifier for the app's lifecycle.
#
# Useful for checking that an app doesn't die and come back up.
ID = SecureRandom.uuid

$stdout.sync = true
$stderr.sync = true

get '/' do
  host = ENV['VCAP_APP_HOST']
  port = ENV['VCAP_APP_PORT']
  "<h1>Hello from VCAP! via: #{host}:#{port}</h1>"
end

get '/metronome/:hours' do
  metronome(params[:hours], logger)
  # note: using curl or a browser to trigger this will not actually
  # you know, _load_ anything. This is, well, it's not normal,
  # but it is _expected._
end

get '/id' do
  ID
end

get '/find/:filename' do
  `find / -name #{params[:filename]}`
end

get '/sigterm' do
  "Available sigterms #{`man -k signal | grep list`}"
end

get '/delay/:seconds' do
  sleep params[:seconds].to_i
  "YAWN! Slept so well for #{params[:seconds].to_i} seconds"
end

get '/sigterm/:signal' do
  pid = Process.pid
  signal = params[:signal]
  puts "Killing process #{pid} with signal #{signal}"
  Process.kill(signal, pid)
end

get '/ruby-version' do
  `ruby -v`
end

get '/logspew/:bytes' do
  system "cat /dev/zero | head -c #{params[:bytes].to_i}"
  "Just wrote #{params[:bytes]} bytes of zeros to the log"
end

get '/echo/:destination/:output' do
  redirect =
    case params[:destination]
    when "stdout"
      ""
    when "stderr"
      " 1>&2"
    else
      " > #{params[:destination]}"
    end

  system "echo '#{params[:output]}'#{redirect}"

  "Printed '#{params[:output]}' to #{params[:destination]}!"
end

get '/env/:name' do
  ENV[params[:name]]
end

get '/curl/:host/?:port?' do
  host = params[:host]
  port = params[:port] || ENV['VCAP_APP_PORT']

  command = "curl -I -s #{host}:#{port}"
  result = `#{command}`

  <<-HTML
<pre>
#{command}
==========
#{result}
</pre>
  HTML
end

def metronome(hours, logger)
  stop_time = Time.now + hours.to_f * 60 * 60
  while Time.now < stop_time
    logger.info "Metronome Log from ID #{ID}, running as instance #{ENV['CF_INSTANCE_INDEX']}. Logging will end at #{stop_time}."
    sleep 1
  end
end

# This is handy for starting metronome logging on multiple instances without having to hit their API
# Unfortunately, as currently implemented, it is incompatable with other uses of dora, such as haveing an API at all
# In order to avoid being killed by the healthcheck, this option must be used in combination with --no-route
# This makes Dora a worker, that does nothing but emit metronome logs.
if ENV["METRONOME"]
  hours = ENV["METRONOME"]
  metronome(hours, Logger.new(STDERR))
end
