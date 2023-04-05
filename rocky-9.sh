#!/bin/bash

#####
# Bash script to build out Rocky 9
#####
DNF_CMD=/usr/bin/dnf
PIP3_CMD=/usr/bin/pip3

####################################################################
dnf_update_assumeyes () {

    echo "In: [$FUNCNAME]"
    $DNF_CMD update --assumeyes
}
####################################################################
install_ansible_core () {

    echo "In: [$FUNCNAME]"
    dnf_update_assumeyes
    $DNF_CMD -y install ansible-core
}
####################################################################
install_epel_things () {

    echo "In: [$FUNCNAME]"
    dnf_update_assumeyes
    $DNF_CMD -y install epel-release
    $DNF_CMD -y install rcs
    $DNF_CMD repolist
}
####################################################################
# REF: https://www.postgresql.org/files/documentation/pdf/12/postgresql-12-US.pdf
# REF: https://www.postgresql.org/download/linux/redhat/
####################################################################
install_postgres_12() {

    echo "In: [$FUNCNAME]"
    echo "WIP return now"
    return

    dnf_update_assumeyes
    $DNF_CMD -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm
    $DNF_CMD -qy module disable postgresql
    $DNF_CMD -y postgresql12-server
    /usr/pgsql-12/bin/postgresql-12-setup initdb
    systemctl enable postgresql-12
    systemctl start postgresql-12
}
####################################################################
install_robotframework () {

    echo "In: [$FUNCNAME]"
    $DNF_CMD update --assumeyes
    $DNF_CMD makecache --refresh
    $DNF_CMD -y install python3-pip
	$PIP3_CMD install robotframework
	$PIP3_CMD install --upgrade robotframework-sshlibrary
	$PIP3_CMD install robotframework-seleniumlibrary
	$PIP3_CMD install robotframework-requests
	$PIP3_CMD install robotframework-jsonlibrary
	$PIP3_CMD install robotframework-extendedrequestslibrary
	$PIP3_CMD install pyyaml
}

####################################################################
install_testrail_cli () {

    echo "In: [$FUNCNAME]"
    $DNF_CMD update --assumeyes
    $DNF_CMD makecache --refresh
    $DNF_CMD -y install python3-pip
	$PIP3_CMD install trcli
}
####################################################################
dnf_update_assumeyes
install_ansible_core
install_epel_things
install_robotframework
install_postgres_12
install_testrail_cli

exit

####################################################################
######################## EOF #######################################
####################################################################


