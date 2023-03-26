#!/bin/bash

#####
# Bash script to build out Rocky 9
#####
DNF_CMD=/usr/bin/dnf

dnf_update_assumeyes () {

    $DNF_CMD update --assumeyes
}


dnf_update_assumeyes

exit

