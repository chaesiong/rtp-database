#! /bin/bash

PASS="DL_BORDERCONTROL"
if [ $# -lt 1 ]; then
 echo "Using '$PASS' as password for schema DL_BORDERCONTROL."
 echo "In case of other password, supply correct password as argument and retry."
else
 PASS="$1"
fi

for file in `ls *.sql` ; do
    sqlplus -S -L "DL_BORDERCONTROL/$PASS"  <<!
        whenever oserror exit 127 rollback;
        whenever sqlerror exit 128 rollback;
        @${file}
        exit ;
!

    V_LAST_EXITCODE=$?
    echo "$file: Exit Code $V_LAST_EXITCODE"
done;
