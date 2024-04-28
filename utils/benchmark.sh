#!/bin/bash

if ! [[ $# -eq 2 ]]; then
echo "error: You must pass at least two file as parameter"
 exit 1
fi
mkdir -p /tmp/myHead

base64 /dev/urandom | head -c 100000000 > /tmp/myHead/file100mb.txt
base64 /dev/urandom | head -c 300000000 > /tmp/myHead/file300mb.txt
base64 /dev/urandom | head -c 500000000 > /tmp/myHead/file500mb.txt
base64 /dev/urandom | head -c 800000000 > /tmp/myHead/file800mb.txt

echo "result for ${1}, testing with a 100 MB  file text:"
time ${1}  /tmp/myHead/file100mb.txt > /dev/null

echo "result for ${2}, testing with a 100 MB  file text:"
time ${2}  /tmp/myHead/file100mb.txt > /dev/null

echo "result for ${1}, testing with a 300 MB  file text"
time ${1}  /tmp/myHead/file300mb.txt > /dev/null

echo "result for ${2}, testing with a 300 MB  file text"
time ${2}  /tmp/myHead/file300mb.txt > /dev/null

echo "result for ${1}, testing with a 500 MB  file text"
time ${1}  /tmp/myHead/file500mb.txt > /dev/null

echo "result for ${2}, testing with a 500 MB  file text"
time ${2}  /tmp/myHead/file500mb.txt > /dev/null

echo "result for ${1}, testing with a 800 MB  file text:"
time ${1}  /tmp/myHead/file800mb.txt > /dev/null

echo "result for ${2}, testing with a 800 MB  file text:"
time ${2}  /tmp/myHead/file800mb.txt > /dev/null

rm -r /tmp/myHead