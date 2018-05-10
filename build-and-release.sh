#! /usr/bin/env bash

set -eu

echo "Creating uberjar..."
lein uberjar

cd target
artifact=`ls *-standalone.jar`

if [ ! "$artifact" ]; then
    echo "Could not find uberjar!"
    exit -1
fi

echo "Uploading $artifact..."
aws --profile metabase \
    --region us-east-1 \
    s3 cp "$artifact" \
    s3://sparksql-deps

echo "Done."
echo "Find the JAR at https://s3.amazonaws.com/sparksql-deps/$artifact"
