#!/bin/bash


WEBHOOK=
DAYS=5


while read p;
do

OUTPUT="$( ./check_ssl_https.sh ${p} )"

if [[ $OUTPUT -le $DAYS ]]

then
  #echo "${OUTPUT}"
  curl -H 'Content-Type: application/json' -d '{"@context": "http://schema.org/extensions","@type": "MessageCard", "text": "<h1> https://'$p'</h1> до окончание срока действия сертификата:<br/><p><strong> '$OUTPUT' days</p></strong>"}' $WEBHOOK;

fi

done <site.list
