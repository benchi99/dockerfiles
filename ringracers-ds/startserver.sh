#!/bin/bash

echo "Starting from startup script"

if ./ringracers -dedicated -room 33 -file ~/.ringracers/addons/*.* ; then
    echo "The server was executed correctly!"
else
    # The server crashed on startup because there were no addons, start without them
    echo "No addons present! Starting without them..."
    ./ringracers -dedicated -room 33
fi