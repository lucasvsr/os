#!/bin/bash

if command -v docker > /dev/null 
then

    echo "-- Docker instalado com sucesso. Iniciando-o --"
    
    systemctl enable docker.service
    systemctl enable containerd.service

    echo "---"

fi
