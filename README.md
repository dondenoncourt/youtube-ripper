jukin-ripper
============

Jukin Media Ripper

This is the Readme for the Jukin Media's RESTful Video Ripper services
It provides facilities to download YouTube videos (via the youtube-dl command)


== CONFIGURE ON A NEW SERVER ==

To configure:
 - Build an EC2 Ruby instance
 - $ sudo gem install rails -v 4.1.4
 - $ sudo bundle install
 - $ sudo apt-get install nodejs
 - $ sudo apt-get install youtube-dl
 - $ youtube-dl -U
 - cp /srv/www/ripper_server/current/config/nginx.conf /etc/nginx/
 - manually edit the empty /srv/www/ripper_server/current/config/database.yml and paste in the full code
 - fix that with http://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-rails.html#workinglayers-rails-db

== START SERVER ==
 - $ sudo service nginx start|restart
 - $ sudo unicorn_rails -c /srv/www/ripper_server/current/config/unicorn.rb -D
 
== STOP SERVER ==
 - $ sudo service nginx stop
 - $ sudo pkill unicorn_rails
 
 
 == OpsWorks
  - problem with git install of jukin-ripper with sqlite3 so run below before deploying the app
  - $ apt-get install zlib1g zlib1g-dev build-essential sqlite3 libsqlite3-dev openssl libssl-dev libyaml-dev libreadline-dev libxml2-dev libxslt1-dev
  - should have used: $ rails new jukin-ripper --skip-active-record

