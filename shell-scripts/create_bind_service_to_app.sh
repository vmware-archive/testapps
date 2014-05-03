#!/bin/bash

# Assignment block
service_instance_name='ill-timed-binding'



# exit if any command exits with non-zero status
set -e

echo -e "\nCreating a service (instance) '$service_instance'..."
cf create-service cleardb spark $service_instance
