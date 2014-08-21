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
    f.write("development:\n")
    aws_keys.each do |k,v|
      f.write("  #{k}: '#{v}'\n")
    end
  end
end


# build aws.yml from OpsWorks stack custom JSON e.g.
# { "deploy": { "ripper_server": { "aws_yml_keys": { "access_key_id": "donttellanyone", "secret_access_key": "evenyourmother" } } } }
node[:deploy].each do |application, deploy|
  create_aws_yml(deploy[:aws_yml_keys], release_path)
end
