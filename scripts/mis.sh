#!/bin/bash

echo "-- Realizando configurações diversas --"

fc-cache -f /usr/share/fonts/nerd-fonts
rm -rf /etc/yum.repos.d/vscode.repo

echo "---"
