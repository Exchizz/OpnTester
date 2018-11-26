#!/bin/bash

tmpfile=$(mktemp /tmp/output.XXXXXXXXXX) || { echo "Failed to create temp file"; exit 1; }
newman run --reporters junit --reporter-junit-export $tmpfile  ./OPN-takehome.postman_collection.json

echo $tmpfile
perl testexecuter.pl $tmpfile
