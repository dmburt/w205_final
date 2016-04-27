#!/bin/bash

### ..::: Set up environment

## ...::: SWAP SPACE
# Run the following if a swap file isn't already created.

# Determine swap space with:
# grep SwapTotal /proc/meminfo

# Create swap space of 500 MB
# dd if=/dev/zero of=/swapfile bs=1024 count=512000
# mkswap /swapfile
swapon /swapfile

## ...::: DATA VOLUME

# Run the following if the data volume isn't already created.
# This will run the UCBDataScienceW205 setup_ucb_complete_plus_postgres script.
# Will set up HDFS, YARN, Hive, and PostgreSQL.
# Assuming volume is available on /dev/xvdf
# mkdir /data
# chmod a+rwx /data
# wget https://s3.amazonaws.com/ucbdatasciencew205/setup_ucb_complete_plus_postgres.sh
# chmod +x ./setup_ucb_complete_plus_postgres.sh
# wait && ./setup_ucb_complete_plus_postgres.sh /dev/xvdf
mount -t ext4 /dev/xvdf /data

##
# Install Python package for ETL
pip install petl

# Install Python package to load Excel
pip install xlrd

