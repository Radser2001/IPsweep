#!/bin/bash

echo "Scan for live hosts in your netowrk"

if [ "$1" == "" ]
        then 
        echo "You forgot the IP address!!!"
        echo "example syntax:  ./ipsweep.sh 192.168.1"

else
        for ip in $(seq 1 254) ; do
        ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
        ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" >> iplist.txt
        done

fi
echo ""
echo "Scanning completed..."
echo "This list can be found in the iplist.txt"
