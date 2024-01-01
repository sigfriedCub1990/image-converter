#!/usr/bin/env bash
# https://docs.localstack.cloud/references/init-hooks/
set -euo pipefail

echo "Configuring localstack"
echo "==================="
LOCALSTACK_HOST=localhost

# https://docs.aws.amazon.com/cli/latest/reference/sqs/create-queue.html
create_queue() {
	local QUEUE_NAME_TO_CREATE=$1
	awslocal --endpoint-url=http://${LOCALSTACK_HOST}:4566 sqs create-queue --queue-name "${QUEUE_NAME_TO_CREATE}" --attributes VisibilityTimeout=30
}

# https://docs.aws.amazon.com/cli/latest/reference/s3api/create-bucket.html
create_bucket() {
	local BUCKET_NAME_TO_CREATE=$1
	awslocal --endpoint-url=http://${LOCALSTACK_HOST}:4566 s3api create-bucket --bucket "${BUCKET_NAME_TO_CREATE}"
}

create_queue "photoservice-queue"
create_queue "photoservice-completed-queue"
create_bucket "photoservice"
