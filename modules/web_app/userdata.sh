#!/bin/bash
set -euxo pipefail

aws s3 cp "s3://${bucket_name}/${script_key}" /tmp/launch.sh

chmod +x /tmp/launch.sh
bash /tmp/launch.sh