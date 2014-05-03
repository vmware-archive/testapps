#!/bin/bash

# Script Configuration Block

# exit if any command exits with non-zero status
set -e

# display script commands as they are run (for development/testing)
set -x

#
# Assignment block
# service 0 info
service_name0='cleardb'
service_plan0='spark'
service_instance_name0='cleardb.spark0'

#service 1 info
service_name0='cleardb'
service_plan0='spark'
service_instance_name0='cleardb.spark0'

# service 3 info
service_name1='cleardb'
service_plan2='spark'
service_instance_name3='cleardb.spark0'

# Execution Block
echo -e "Instantiating Requested Services"

# set the index (change this for each execution block)
i='0'
# construct the command to be eval'd to create the instance
service_name='$'service_name$i ; service_plan='$'service_plan$i ; service_instance_name='$'service_instance_name$i ;
# create the service specified by the index
eval cf create-service ${service_name} ${service_plan} ${service_instance_name}
# Optional Cleanup
eval cf delete-service -f ${service_instance_name}

# set the index (change this for each execution block)
i='1'
# construct the command to be eval'd to create the instance
service_name='$'service_name$i ; service_plan='$'service_plan$i ; service_instance_name='$'service_instance_name$i ;
# create the service specified by the index
eval cf create-service ${service_name} ${service_plan} ${service_instance_name}
# Optional Cleanup
eval cf delete-service -f ${service_instance_name}

# set the index (change this for each execution block)
i='2'
# construct the command to be eval'd to create the instance
service_name='$'service_name$i ; service_plan='$'service_plan$i ; service_instance_name='$'service_instance_name$i ;
# create the service specified by the index
eval cf create-service ${service_name} ${service_plan} ${service_instance_name}
# Optional Cleanup
eval cf delete-service -f ${service_instance_name}
