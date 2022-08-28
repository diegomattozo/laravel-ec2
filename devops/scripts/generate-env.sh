#!/bin/bash

PARAMETER="website_dev_env"
REGION="us-east-1"
aws ssm get-parameter \
    --with-decryption \
    --name $PARAMETER \
    --region $REGION \
    --query Parameter.Value \
    --output text > $WEB_DIR/.env

chown $WEB_USER .env
sudo -u $WEB_USER php artisan config:clear
