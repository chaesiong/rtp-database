#!/bin/bash

HERE="${PWD}"
CMDLINEOPTIONS=$@
trap "cd \"$HERE\"" EXIT


SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

TABLESPACES="DATASTORE DATASTORE_LOB DATASTORE_IDX BIOSTORE BIOSTORE_LOB BIOSTORE_IDX TS_AFIS BPM TS_BIO_BD"
LOBTABLESPACES="DATASTORE_LOB_01 DATASTORE_LOB_02 DATASTORE_LOB_03 DATASTORE_LOB_04 DATASTORE_LOB_05 DATASTORE_LOB_06 DATASTORE_LOB_07 DATASTORE_LOB_08 DATASTORE_LOB_09"

function invalid {
echo "SELECT * FROM dba_errors WHERE NAME NOT IN (SELECT object_name FROM dba_recyclebin) AND upper(attribute) <> 'WARNING';"
sqlplus -S / as sysdba <<EOF
set pages 0 lin 17000;
set echo off;
set feedback off;
set termout off;
COLUMN owner FORMAT a20
COLUMN NAME FORMAT a50
COLUMN TYPE FORMAT a15
SELECT OWNER, name, TYPE, line, text
FROM dba_errors
WHERE NAME NOT IN (SELECT object_name
                   FROM dba_recyclebin)
AND upper(attribute) <> 'WARNING'
ORDER BY OWNER, name, TYPE , SEQUENCE ;
EOF

echo "select owner, object_type, object_name, last_ddl_time from dba_objects where upper(status) != 'VALID' order by owner, object_type;"
sqlplus -S / as sysdba <<EOF
set pages 0 lin 17000;
set echo off;
set feedback off;
set termout off;
select
  owner,
  object_type,
  object_name,
  last_ddl_time
from
   dba_objects
where
   upper(status) != 'VALID'
order by
   owner,
   object_type;
EOF
}

 function schemas
{
cat <<-EOFSCHEMAS
    DL_COMMON
    LOGGER
    DL_DBA
    DL_USER_MANAGEMENT
    APEX_USER_MANAGEMENT
    USER_MANAGEMENT
    DL_BIOSTORE_BLACKLIST
    DL_BIOSTORE_MOVEMENTS
    DL_BORDERCONTROL
    DL_BLACKLIST
    DL_BORDERCONTROL_DATAMART
    DL_STAGING4PIBICS
    DL_STAGING4PIBICS_INTF
    DL_INTERFACE
    PIBICSDM2_RO
    BIO_BD
EOFSCHEMAS
}

function dropuser {
  schemas | while read SCHEMA; do
    echo "Dropping user $SCHEMA"
    echo "drop user $SCHEMA cascade;" | sqlplus / as sysdba
  done
}

function createts {
  for TS in $TABLESPACES; do
   echo "CREATE TABLESPACE $TS DATAFILE '/u01/app/oracle/oradata/AFIS/$TS.dbf' SIZE 100M REUSE AUTOEXTEND ON NEXT 100M MAXSIZE 10G EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT  AUTO;" | sqlplus / as sysdba
  done

  for TS in $LOBTABLESPACES; do
   echo "CREATE TABLESPACE $TS DATAFILE '/u01/app/oracle/oradata/AFIS/$TS.dbf' SIZE 10M REUSE AUTOEXTEND ON NEXT 10M MAXSIZE 10G EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT  AUTO;" | sqlplus / as sysdba
  done

}

function flashback {
echo "STARTUP MOUNT FORCE;" | sqlplus / as sysdba
echo "FLASHBACK DATABASE TO RESTORE POINT before_test;" | sqlplus / as sysdba
echo "DROP RESTORE POINT before_test;" | sqlplus / as sysdba
echo "recover database;" | sqlplus / as sysdba
echo "alter database open;" | sqlplus / as sysdba
echo "CREATE RESTORE POINT before_test GUARANTEE FLASHBACK DATABASE;" | sqlplus / as sysdba
}

if [ $# -lt 1 ]; then
  grep "^function.*" "$0" | awk '{ print $2; }'
  exit 1
fi

for DO in $@; do
 echo $(grep "^function.*" "$0" | awk '{ print $2; }' | xargs) | grep -q "$DO" || { echo "unknown command: $DO"; break; }
 $DO
done