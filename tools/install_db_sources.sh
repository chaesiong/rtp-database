#!/bin/bash

DATAFILEPATH="/u01/app/oracle/oradata"

#############
# log to file
LOGFILE=$(basename "$0")-$(date +%F_%H%M%S).log
exec > >(tee -a "$LOGFILE")
exec 2>&1
############

function errorExit() {
  echo "$@"
  exit 1
}

[ $# -lt 1 ] && errorExit "Missing parameter: Path-to-install_by_dependencies.sql"

INSTALLFILE="$1"
SOURCEDIR="$({ cd "$(dirname "$1")" || errorExit "Cannot determine sourcedir from $INSTALLFILE!"; pwd; })"
function dropUser {
    cd "$SOURCEDIR" || errorExit "Cannot cd into $SOURCEDIR"
    find . -type f  -name "create_*sql" | grep "/user/" | cut -d '/' -f2 | grep -v "SYSTEM" | while read -r SCHEMA; do
        echo "drop user $SCHEMA cascade;" | sqlplus / as sysdba
    done
}

function createTablespaces {
    grep -i " QUOTA " "$INSTALLFILE" | cut -d' ' -f7 | sed 's/;//' | sort | uniq | while read -r TS; do
        echo "CREATE TABLESPACE $TS DATAFILE '$DATAFILEPATH/$TS.dbf' SIZE 100M REUSE AUTOEXTEND ON NEXT 100M MAXSIZE 10G EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO;" | sqlplus / as sysdba
    done
    cd "$SOURCEDIR" || errorExit "Cannot cd into $SOURCEDIR"
    find . -type f  -name "create_*sql" | grep "/user/" | while read -r LINE; do 
      grep -i " DEFAULT TABLESPACE " "$LINE" | awk '{ print $3; }'; done | sort | uniq | sed 's/"//g' | while read -r TS; do
        echo "CREATE TABLESPACE $TS DATAFILE '$DATAFILEPATH/$TS.dbf' SIZE 100M REUSE AUTOEXTEND ON NEXT 100M MAXSIZE 10G EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO;" | sqlplus / as sysdba
    done
}

function applyDBSettings {
    echo "ALTER SYSTEM SET open_cursors=1300 SCOPE=SPFILE;" | sqlplus / as sysdba
    echo "ALTER SYSTEM SET processes=1300 SCOPE=SPFILE;" | sqlplus / as sysdba
    echo "ALTER SYSTEM SET max_shared_servers = 25 scope = both;" | sqlplus / as sysdba
    echo "ALTER SYSTEM SET shared_servers = 20 scope = both;" | sqlplus / as sysdba
    echo "ALTER SYSTEM SET optimizer_index_cost_adj=1 SCOPE=BOTH;" | sqlplus / as sysdba
    echo "ALTER SYSTEM SET db_securefile = 'FORCE';" | sqlplus / as sysdba
    echo "DROP FLASHBACK ARCHIVE fba;" | sqlplus / as sysdba
    echo "DROP TABLESPACE TS_FBA;" | sqlplus / as sysdba
}

# silent drop, 1st try because somehow oracle complains sometimes about connected users, however 2nd try succeeds
echo "Dropping users..."
dropUser >/dev/null 2>&1
dropUser | tee -a "$LOGFILE" | grep -B3 "ORA-01940" && errorExit "Could not drop user! Warning: Some users might be already dropped!"

applyDBSettings
createTablespaces

cd "$SOURCEDIR" || errorExit "Cannot cd into '$SOURCEDIR'"
echo "Starting now to run '$INSTALLFILE' with sqlplus"
tail -F "$INSTALLFILE" &
sqlplus / as sysdba "@$(basename "$1")"
