#!/bin/bash

if [[ "$1" =~ ^([sS][tT][aA][rR][tT])$ ]]
then
  cd /server && /usr/local/bundle/bin/bundle exec clockworkd -l -c /server/clockwork.rb start
else
  cd /server && /usr/local/bundle/bin/bundle exec clockworkd -l -c /server/clockwork.rb stop
fi
