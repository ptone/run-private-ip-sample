mkdir /cloudsql; chmod 777 /cloudsql
cd /app
/cloud_sql_proxy -dir=/cloudsql -instances=ptone-misc:us-central1:run-demo-private -ip_address_types=PRIVATE &
# wait a couple sec for proxy to be started, could be optimized
sleep 2
# env vars set here in init for convenience of local test with docker run cmd
INSTANCE_CONNECTION_NAME='ptone-misc:us-central1:run-demo-private' \
DB_USER='demo_user' \
DB_PASS='demo_password' \
DB_NAME='proxy-demo' \
/app/server
