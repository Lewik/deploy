#!/bin/bash

source ./bin/settings.conf.sh
rsh -p ${scp_port} ${scp_user}@${scp_address} find ${scp_pattern}