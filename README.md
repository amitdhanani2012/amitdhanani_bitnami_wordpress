Here I use bitnami/wordpress image and replace entrypoint.sh inside Docker image. 

I also installed curl command which needed for health check during ecs task health check

entrypoint.sh has /download-extra.sh 


/download-extra.sh installs humanmade/s3-uploads s3 wordpress media offload module and also set s3 bucket/s3 region

/download-extra.sh also change wp-config.php for s3 parameter and activate s3-uploads plugin

