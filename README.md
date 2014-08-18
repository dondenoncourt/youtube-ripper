jukin-ripper
============

Jukin Media Ripper

This is the Readme for the Jukin Media's RESTful Video Ripper services
It provides facilities to download YouTube videos (via the youtube-dl command)


== CONFIGURE ON A NEW SERVER ==

To configure:
 - Build an EC2 Ruby instance
 - youtube-dl will be installed you you need to do the following before calls work:
 - $ youtube-dl -U
 - specify the rails server in the nginx config:
 - cp /srv/www/ripper_server/current/config/nginx.conf /etc/nginx/
 - the current/config/database.yml is empty so paste in the full code from your local PC or do the following:
 - cp /srv/www/ripper_server/shared/config/database.yml /srv/www/ripper_server/current/config/
 - or
 - cp /srv/www/ripper_server/shared/cached-copy/config/database.yml /srv/www/ripper_server/current/config/
 - fix that with http://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-rails.html#workinglayers-rails-db

== START SERVER ==
 - $ sudo service nginx start|restart
 - $ sudo unicorn_rails -c /srv/www/ripper_server/current/config/unicorn.rb -D
 
== STOP SERVER ==
 - $ sudo service nginx stop
 - $ sudo pkill unicorn_rails
 
 
 == OpsWorks
  - add these: zlib1g zlib1g-dev build-essential sqlite3 libsqlite3-dev openssl libssl-dev libyaml-dev libreadline-dev libxml2-dev libxslt1-dev youtube-dl
  - should have used: $ rails new jukin-ripper --skip-active-record

