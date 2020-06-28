#!/bin/bash
echo "initializing oracle info"

PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH=$PATH:$ORACLE_HOME/bin
export ORACLE_HOME=${Your_Oracle_Home}
export ORACLE_SID=${Your_Oracle_Sid}
export TNS_ADMIN=$ORACLE_HOME/network/admin

#target backup database lists
schema=(
test
developer
)

#target backup database password lists
#the password must be connected to the database lists(order)
password=(
test
developer
)

#target backup database sid lists
#correspond with database and password
sid=(
service_name
)

#start backup database
echo "starting backup database..."

su - oracle -c "expdp $schema/$password@$sid directory=${Your_Dba_Directory} dumpfile=`date +%Y-%m-%d`_$schema\.dmp"

echo "backup database done"
