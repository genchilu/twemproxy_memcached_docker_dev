#!/bin/sh

cp /etc/nutcracker/nutcracker.yml.tmp /etc/nutcracker/nutcracker.yml
mc1=$(getent hosts mc1 | awk '{ print $1 }') && echo "   - ${mc1}:11211:1 mc1" >> /etc/nutcracker/nutcracker.yml
mc2=$(getent hosts mc2 | awk '{ print $1 }') && echo "   - ${mc2}:11211:1 mc2" >> /etc/nutcracker/nutcracker.yml
mc3=$(getent hosts mc3 | awk '{ print $1 }') && echo "   - ${mc3}:11211:1 mc3" >> /etc/nutcracker/nutcracker.yml

/opt/twemproxy/src/nutcracker -c /etc/nutcracker/nutcracker.yml
