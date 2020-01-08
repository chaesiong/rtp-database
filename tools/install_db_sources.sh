#!/bin/bash

DATAFILEPATH="/u01/app/oracle/oradata/"

#############
# log to file
LOGFILE=$(basename $0)-$(date +%F_%H%M%S).log
exec > >(tee -a "$LOGFILE")
exec 2>&1
############

[ $# -lt 1 ] && { echo "Missing parameter: Path-to-install_by_dependencies.sql"; exit 1; }

SOURCEDIR=$({ cd "$(dirname "$1")"; pwd; })

function dropUser {
    cd "$SOURCEDIR"
    find . -type f  -name "create_*sql" | grep "/user/" | cut -d '/' -f2 | grep -v "SYSTEM" | while read -r SCHEMA; do
        echo "drop user $SCHEMA cascade;" | sqlplus "sys as sysdba"
    done
}

function createTablespaces {
    for TS in $TABLESPACES; do
        echo "CREATE TABLESPACE $TS DATAFILE '$DATAFILEPATH/$TS.dbf' SIZE 100M REUSE AUTOEXTEND ON NEXT 100M MAXSIZE 10G EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT  AUTO;" | sqlplus "sys as sysdba"
    done

    for TS in $LOBTABLESPACES; do
        echo "CREATE TABLESPACE $TS DATAFILE '$DATAFILEPATH/$TS.dbf' SIZE 10M REUSE AUTOEXTEND ON NEXT 10M MAXSIZE 10G EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT  AUTO;" | sqlplus "sys as sysdba"
    done

}

function applyDBSettings {
    echo "ALTER SYSTEM SET open_cursors=1300 SCOPE=SPFILE;" | sqlplus "sys as sysdba"
    echo "ALTER SYSTEM SET processes=1300 SCOPE=SPFILE;" | sqlplus "sys as sysdba"
    echo "ALTER SYSTEM SET max_shared_servers = 25 scope = both;" | sqlplus "sys as sysdba"
    echo "ALTER SYSTEM SET shared_servers = 20 scope = both;" | sqlplus "sys as sysdba"
    echo "ALTER SYSTEM SET optimizer_index_cost_adj=1 SCOPE=BOTH;" | sqlplus "sys as sysdba"
    echo "ALTER SYSTEM SET db_securefile = 'FORCE';" | sqlplus "sys as sysdba"
    echo "DROP FLASHBACK ARCHIVE fba;" | sqlplus "sys as sysdba"
    echo "DROP TABLESPACE TS_FBA;" | sqlplus "sys as sysdba"
}

# silent drop, 1st try because somehow oracle complains sometimes about connected users, however 2nd try succeeds
dropUser >/dev/null 2>&1
dropUser | tee -a "$LOGFILE" | grep -B3 "ORA-01940" && { echo "Could not drop user! Warning: Some users might be already dropped!"; exit 1; }

applyDBSettings
createTablespaces

cd "$SOURCEDIR"
sqlplus / as sysdba "@$(basename "$1")"
