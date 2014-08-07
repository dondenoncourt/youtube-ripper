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
 - $ sudo apt-get install youtube-dl
 - $ youtube-dl -U
 - copy config/nginx.conf to the /etc/nginx/ directory
 - may need to install a javascript compiler

== START SERVER ==
 - $ sudo service nginx start|restart
 - $ sudo unicorn_rails -c /var/www/unicorn_test/config/unicorn.rb -D
