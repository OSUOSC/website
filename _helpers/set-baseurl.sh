#!/bin/bash

baseurl=$1

sed -i "/baseurl/c\baseurl: $baseurl" ./_config.yml
