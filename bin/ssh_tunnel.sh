#!/bin/sh
open "/Applications/Network Beacon.app"
ssh -L 3689:tylerc.dyndns.org:3689 -l tcasselman -N tylerc.dyndns.org
