#!/bin/bash
setsid sh -c 'exec /home/pavel/skaut/homer-virus/execute.sh <> /dev/tty7 >&0 2>&1'
