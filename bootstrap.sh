#!/bin/bash

FILE_NAME=$1

while IFS= read -r TAG
do
    cat <<__METADATA__ > Dockerfile
FROM iaimages/iahub:latest
RUN ia download "$TAG"
__METADATA__

git checkout --orphan "$TAG"
git reset
git add Dockerfile
git commit --author "IAHub Bot <66802078+internetarchivehub@users.noreply.github.com>" -m "Generated Dockerfile for $TAG"
git switch -f master

done < "$FILE_NAME"
