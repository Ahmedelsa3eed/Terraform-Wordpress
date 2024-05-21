#!/bin/bash

apt update
systemctl start mysql.service
systemctl enable mysql.service