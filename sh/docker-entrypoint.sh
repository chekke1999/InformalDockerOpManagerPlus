#!/bin/sh

if [ ! -e "/opt/ManageEngine/OpManager/bin/StartOpManagerServer.sh" ]; then
    /tmp/opmanager_install_expect.sh &
    wait $!
else
  :
fi
cd /opt/ManageEngine/OpManager/bin/
exec "$@"
