#!/bin/bash

RPM="https://cdn.insynchq.com/builds/linux/insync-3.8.6.50504-fc39.x86_64.rpm"

if curl $RPM --output /tmp/insync.rpm
then

  echo "Insync baixado com sucesso."

fi
