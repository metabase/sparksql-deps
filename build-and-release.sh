#! /usr/bin/env bash

set -e

# Need a copy of the Metabase JAR signature keystore to do this (!)
# Cam & Sameer have it
if [ ! "$KEYSTORE" ]; then
    echo 'Please specify the Java Keystore to use for signing the JAR by setting $KEYSTORE.'
    echo 'Should be something like: /path/to/metabase_keystore.jks'
    exit -1
fi

echo 'Creating uberjar...'
lein uberjar

cd target
artifact=`ls *-standalone.jar`

if [ ! "$artifact" ]; then
    echo 'Could not find uberjar!'
    exit -1
fi

# See also https://docs.oracle.com/javase/7/docs/technotes/guides/security/time-of-signing.html
echo 'Signing JAR...'
jarsigner \
    -keystore "$KEYSTORE" \
    -tsa 'http://timestamp.digicert.com' \
    "$artifact" \
    server

echo 'Verifying signature...'
jarsigner -verify -certs "$artifact"

echo "Uploading $artifact..."
aws --profile metabase \
    --region us-east-1 \
    s3 cp "$artifact" \
    's3://sparksql-deps'

echo 'Done.'
echo "Find the JAR at https://s3.amazonaws.com/sparksql-deps/$artifact"
