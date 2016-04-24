#!/bin/bash

psql -h localhost -U postgres -c "DROP DATABASE IF EXISTS apd;"
psql -h localhost -U postgres -c "CREATE DATABASE apd;"
psql -h localhost -U postgres -d apd -f load_data.sql
wait && psql -h localhost -U postgres -d apd -f create_indices.sql


