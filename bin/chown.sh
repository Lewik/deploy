#!/bin/bash

echo "chown"
cd /var/www
chown www-data:www-data -R *
echo "chown ok"