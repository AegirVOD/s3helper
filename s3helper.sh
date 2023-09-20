#!/bin/bash

if [ $# -ne 1 ];  then
    echo "Usage: ./s3helper.sh mount/unmount"
    exit
fi

if [[ ! -f ".env" ]]; then
    echo "ERROR: No .env file found"
    exit
fi

source .env

if [ $1 = "mount" ]; then
    for bucket in $(cat bucket_list)
    do
        mkdir -p $bucket
        s3fs $bucket ./$bucket -o passwd_file=./.passwd-s3fs -o url=${S3_URL} -o use_path_request_style -o endpoint=${S3_ENDPOINT}
    done
elif [ $1 = "unmount" ]; then
    for bucket in $(cat bucket_list)
    do
        umount $bucket
        rmdir $bucket
    done
fi

exit



