jukin-ripper
============

Jukin Media Ripper

This is the Readme for the Jukin Media's RESTful Video Ripper services
It provides facilities to download YouTube videos (via the youtube-dl command)


== CONFIGURE ON A NEW SERVER ==

To configure:
 - Build an EC2 Ruby instance
 - specify the rails server in the nginx config:
 - cp /srv/www/ripper_server/current/config/nginx.conf /etc/nginx/

== START SERVER ==
 - $ service nginx start|restart
 - $ unicorn_rails -c /srv/www/ripper_server/current/config/unicorn.rb -D
 
== STOP SERVER ==
 - $ service nginx stop
 - $ pkill unicorn_rails
 
 
 == OpsWorks
  - add these: nodejs

