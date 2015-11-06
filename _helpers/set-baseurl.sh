#!/bin/bash

baseurl=$1

echo $baseurl

sed -i "/baseurl/c\baseurl: $baseurl" ./_config.yml
