Chef::Log.info("Running deploy/before_restart.rb")

# load youtube-dl
`curl https://yt-dl.org/downloads/2014.08.10/youtube-dl -o /usr/bin/youtube-dl`
`chmod a+x /usr/bin/youtube-dl`
# I don't know where rack-1.6.0.beta came from but this app can't use it
`rm -Rf /usr/local/lib/ruby/gems/2.1.0/gems/rack-1.6.0.beta/`
# this installs 1.5.2
`gem install rack`

def create_aws_yml(aws_keys, release_path)
  Chef::Log.info("Creating aws.yml")
  file_path = ::File.join(release_path, 'config/aws.yml')
  ::File.open(file_path, 'w') do |f|
    f.write("production:\n")
    aws_keys.each do |k,v|
      f.write("  #{k}: '#{v}'\n")
    end
  end
end


# map the environment_variables node to ENV
node[:deploy].each do |application, deploy|
  create_aws_yml(deploy[:aws_yml_keys], release_path)
  # deploy[:environment_variables].each do |key, value|
  #   Chef::Log.info("Setting ENV[#{key}] to #{value}")
  #   ENV[key] = value
  # end
end
