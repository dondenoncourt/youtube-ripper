# load youtube-dl
`curl https://yt-dl.org/downloads/2014.08.10/youtube-dl -o /usr/bin/youtube-dl`
`chmod a+x /usr/bin/youtube-dl`
# I don't know where rack-1.6.0.beta came from but this app can't use it
`rm -Rf /usr/local/lib/ruby/gems/2.1.0/gems/rack-1.6.0.beta/`
# this installs 1.5.2
`gem install rack`
# nginx
#`cp /srv/www/ripper_server/current/config/nginx.conf /etc/nginx/`
#`service nginx restart`
