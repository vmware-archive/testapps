#!/bin/bash

service_instance_name='sparky-spark'

# exit if any command exits with non-zero status
set -e


cf create-service cleardb spark $service_instance
8:48:47
