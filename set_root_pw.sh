#!/bin/bash

if [ -f /.root_pw_set ]; then
	echo "Root password already set!"
	exit 0
fi

PASS=${ROOT_PASS:-$(pwgen -s 12 1)}
echo "root:$PASS" | chpasswd

# Make root_pw_set file to check the password has been created
# Avoid a case that when restarting the container then the password will be regenerated.
touch /.root_pw_set

echo "========================================================================"
echo "Password for root: $PASS"
echo "========================================================================"