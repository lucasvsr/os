#!/bin/bash

sudo rpm --import https://d2t3ff60b2tol4.cloudfront.net/repomd.xml.key

mkdir -p /etc/yum.repos.d/

echo "[insync]
name=insync repo
baseurl=http://yum.insync.io/fedora/$releasever/
gpgcheck=1
gpgkey=https://d2t3ff60b2tol4.cloudfront.net/repomd.xml.key
enabled=1
metadata_expire=120m" > /etc/yum.repos.d/insync.repo