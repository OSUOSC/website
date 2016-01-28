#!/bin/bash

# generates a new meeting post with minimum effort

#TODO
# add error handling

clear

echo "What's your name?"
read author

echo "What's the meeting topic?"
read topic

echo "When is the meeting (YYYY-MM-DD)?"
read m_date


# location of template
template='_drafts/2015-10-30-meeting-template.md'


# sanitized user input
topic_safe=$(echo ${topic,,} | sed -e 's/\s\+/_/g')


#current date
c_date=$(date +%Y-%m-%d)


# truncated topic
tr_topic=$(echo "$topic_safe" | sed 's/\(_[^_]*\)\{3\}$//')


# copy template to _posts
post='_posts/'$c_date'-'$tr_topic'.md'


# checks to see if file/post already exists
if [ ! -f "$post" ]; then
  # copy template to _posts directory
  cp $template $post
else
  echo 'post already exists'
fi


# adds title to post
sed -i "/^title:/c\title: $topic" "$post"

# adds meeting date to post
sed -i "/^meeting_date:/c\meeting_date: $m_date" "$post"

# adds author signaturer to end of post
sed -i "/^\-\-[a-zA-Z0-9]/c\\-\- $author" "$post"
