#!/bin/sh
FILE_NAME=/tmp/$BACKUP_NAME-`date "+%Y-%m-%d_%H-%M-%S"`.tar.gz
echo "creating archive"
tar -zcvf $FILE_NAME /data$SUB_PATH
echo "uploading archive to S3 [$FILE_NAME]"
echo "aws s3 cp $FILE_NAME $S3_BUCKET_URL --endpoint-url=$S3_ENDPOINT --region $S3_REGION"
aws s3 cp $FILE_NAME $S3_BUCKET_URL --endpoint-url=$S3_ENDPOINT --region $S3_REGION
echo "removing local archive"
rm $FILE_NAME
echo "done"
