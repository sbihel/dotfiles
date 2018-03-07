#!/bin/bash

# Update lbdb if installed
lbdb=$(/usr/bin/which lbdb-fetchaddr)
if [ $? -eq 0 ]; then
    for mail in ${HOME}/Maildir/*/*/new/*; do
        cat "${mail}" | lbdb-fetchaddr
    done
fi
