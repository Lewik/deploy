#!/bin/bash

source ./bin/settings.conf.sh
rsh ${scp_user}@${scp_address}:${scp_port} find ${scp_pattern}