#!/bin/bash

tmpfile=$(mktemp /tmp/output.XXXXXXXXXX) || { echo "Failed to create temp file"; exit 1; }
newman run --reporters junit --reporter-junit-export $tmpfile  ./OPN-takehome.postman_collection.json
cat $tmpfile |  perl -ne '/<testsuite\sname=\"(.*?)\".*tests=\"(\d+)\".*failures=\"(\d+)\"/ and print "Name: $1, Success: ".($2-$3)."/".$2."\n"'
