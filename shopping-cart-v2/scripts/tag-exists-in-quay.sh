#!/bin/bash

function tag_exists() {
    #curl -sfSL https://quay.io/v1/repositories/$1/tags/$2 &> /dev/null
    curl -X GET -H "Authorization: Bearer $QUAY_USR:$QUAY_PSW" https://quay.io/api/v1/repository/$1/tag/?onlyActiveTags=true&specificTag=$2
}

echo "Checking the existence of the tag $2 in the repository $1"

if tag_exists ${1} ${2}; then
    echo "Tag exists"
    exit 0
fi

echo "Tag not found!"
exit 1
