Chef::Log.info("Running deploy/before_restart.rb")

# load youtube-dl
`curl https://yt-dl.org/downloads/2014.08.10/youtube-dl -o /usr/bin/youtube-dl`
`chmod a+x /usr/bin/youtube-dl`
# I don't know where rack-1.6.0.beta came from but this app can't use it
`rm -Rf /usr/local/lib/ruby/gems/2.1.0/gems/rack-1.6.0.beta/`
# this installs 1.5.2
`gem install rack`

# map the environment_variables node to ENV
node[:deploy].each do |application, deploy|
  deploy[:environment_variables].each do |key, value|
    Chef::Log.info("Setting ENV[#{key}] to #{value}")
    ENV[key] = value
  end
end
