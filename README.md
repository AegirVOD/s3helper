# s3helper

A handy script to help you mount multiple non-amazon s3 buckets into your filesystem.

## Requirement

You need to have [s3fs](https://github.com/s3fs-fuse/s3fs-fuse) installed on your system before using this script.

## Preperation

To be able to use the script, you need to have three files in the same directory as s3helper: `.env`, `bucket_list` and `.passwd-s3fs`.

In `.env`, the `S3_URL` should be your S3 server's URL, and the `S3_ENDPOINT` should be the server's region code.

In 'bucket_list', you should put the name of the buckets that you want to mount, one bucket each line, for example:

```
bucket1
bucket2
bucket3
```

And in `.passwd-s3fs` you should have your s3 credentials.

```
ACCESS_KEY_ID:SECRET_ACCESS_KEY
```

After creating the '.passwd-s3fs' you should launch:

```bash
chmod 600 ./.passwd-s3fs
```

Don't forget to give the script the permission to execute:

```bash
chmod +x ./s3helper.sh
```

Then you're good to go.

## Using the script

To mount the buckets:

```bash
./s3helper.sh mount
```

To unmount the buckets:

```bash
./s3helper.sh unmount
```
