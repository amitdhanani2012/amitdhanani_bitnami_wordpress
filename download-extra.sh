#!/bin/bash
set +o errexit
set +o nounset
set +o pipefail
set -x
cd /opt/bitnami/wordpress/
echo '{ "require": { "humanmade/s3-uploads":"*" } }' >composer.json
composer config --no-plugins allow-plugins.composer/installers true
composer require humanmade/s3-uploads
sed -i "/<?php/a \
require_once __DIR__ . '/vendor/autoload.php';\\n\
define( 'S3_UPLOADS_BUCKET' , '$AMIT_S3_BUCKET' );\\n\
define( 'S3_UPLOADS_REGION', '$AMIT_S3_REGION' );\\n" /opt/bitnami/wordpress/wp-config.php
/opt/bitnami/wp-cli/bin/wp plugin is-active s3-uploads || /opt/bitnami/wp-cli/bin/wp plugin activate s3-uploads