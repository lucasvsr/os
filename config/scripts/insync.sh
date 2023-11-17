#!/bin/bash

REPO="https://d2t3ff60b2tol4.cloudfront.net/repomd.xml.key"

mkdir -p /etc/yum.repos.d/

if sudo rpm --import $REPO
then

  echo "Chave de importação do Insync importada com sucesso."

fi

if curl $REPO > /etc/yum.repos.d/insync_yum_gpg.key
then

  echo "GPG do Insync baixada com sucesso."

fi

echo "[insync]
name=insync repo
baseurl=http://yum.insync.io/fedora/$IMAGE_MAJOR_VERSION/
gpgcheck=1
gpgkey=/etc/yum.repos.d/insync_yum_gpg.key
enabled=1
metadata_expire=120m" > /etc/yum.repos.d/insync.repo
