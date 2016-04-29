#!/bin/sh

#OS X

#Enable ECN
sudo sysctl -w net.inet.tcp.ecn_initiate_out=1
sudo sysctl -w net.inet.tcp.ecn_negotiate_in=1
