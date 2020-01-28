#!/bin/bash

PATH_DATAFILES="/u01/app/oracle/oradata"
INSTALLFILE_DB="install_by_dependencies.sql"
INSTALLFILE_LOOKUPS="insert_lookups.sql"
OWNER_REST="DL_BORDERCONTROL"
PASS_REST="DL_BORDERCONTROL"
OWNER_APEX="DL_BORDERCONTROL"

function errorExit() {
  echo "$@"
  exit 1
}
function showSettings {
        echo ""
        if [ "$SETTINGS" == "x" ]; then echo "- Apply database settings"; fi;
        if [ "$TABLESPACES" == "x" ]; then echo "- Create tablespaces"; fi;
        if [ "$USERS" == "x" ]; then echo "- Drop users"; fi;
        if [ "$DATABASEOBJECTS" == "x" ]; then echo "- Install database objects"; fi;
        if [ "$INITIALDATA" == "x" ]; then echo "- Delete and insert initial data"; fi;
        if [ "$APEX" == "x" ]; then echo "- Install APEX workspace and applications"; fi;
        if [ "$REST" == "x" ]; then echo "- Install REST services"; fi;    
        echo ""
        echo "Base path for installation scripts is:"
        echo "$SCRIPTPATH"
        echo ""
}
function showHelp {
        echo "Usage: install.sh [ -h | [ -studiar | -f ] [ -p <path> ] ] "
        echo ""
        echo "  -h         Show this help"
        echo ""            
        echo "  -s         Apply database settings"
        echo "  -t         Create tablespaces"
        echo "  -u         Drop users"
        echo "  -d         Install database objects"
        echo "  -i         Delete and insert initial data"
        echo "  -a         Install APEX workspace and applications"
        echo "  -r         Install REST services"
        echo ""            
        echo "  -f         Full install, equals -studiar"
        echo ""            
        echo "  -p <path>  Base path for installation scripts, path of install.sh if not specified."
}
function configure {
        tput smcup
        while true; do
            clear;
            echo "Production clone installation options:"
            echo "----------------------------------------------------------------"
            echo "($SETTINGS) [S]ettings         - Apply database settings"
            echo "($TABLESPACES) [T]ablespaces      - Create tablespaces"
            echo "($USERS) [U]sers            - Drop users"
            echo "($DATABASEOBJECTS) [D]atabase objects - Install database objects"
            echo "($INITIALDATA) [I]nitial data     - Delete and insert initial data"
            echo "($APEX) [A]PEX             - Install APEX workspace and applications"
            echo "($REST) [R]EST             - Install REST services"
            echo ""
            echo "    [P]ath             - Change base path for installation scripts:"
            echo "                         $SCRIPTPATH"
            echo "----------------------------------------------------------------"
            echo "Enter to proceed to installation with selected settings"
            read -rsn1 KEY
            case $KEY in
                [Ss] ) if [ "$SETTINGS" == "x" ]; then SETTINGS=" "; else SETTINGS="x"; fi;;
                [Tt] ) if [ "$TABLESPACES" == "x" ]; then TABLESPACES=" "; else TABLESPACES="x"; fi;;
                [Uu] ) if [ "$USERS" == "x" ]; then USERS=" "; else USERS="x"; fi;;
                [Dd] ) if [ "$DATABASEOBJECTS" == "x" ]; then DATABASEOBJECTS=" "; else DATABASEOBJECTS="x"; fi;;
                [Ii] ) if [ "$INITIALDATA" == "x" ]; then INITIALDATA=" "; else INITIALDATA="x"; fi;;
                [Aa] ) if [ "$APEX" == "x" ]; then APEX=" "; else APEX="x"; fi;;
                [Rr] ) if [ "$REST" == "x" ]; then REST=" "; else REST="x"; fi;;
                [Pp] ) read -e -p "Path:" -i "$SCRIPTPATH" SCRIPTPATH;;
            esac
            if [ "$KEY" == "" ] && ([ "$SETTINGS" == "x" ] || [ "$TABLESPACES" == "x" ] || [ "$USERS" == "x" ] || [ "$DATABASEOBJECTS" == "x" ] || [ "$INITIALDATA" == "x" ] || [ "$APEX" == "x" ] || [ "$REST" == "x" ] )
                then 
                clear
                echo "Proceed to installation and execute the following steps:"
                showSettings
                read -p "Accept [y/N]: " KEY
                case $KEY in
                [yY] ) break;;
                esac
            fi
        done    
        tput rmcup
}
function applyDBSettings {
    echo "--------------------- APPLY DATABASE SETTINGS ---------------------"
    echo "ALTER SYSTEM SET open_cursors=1300 SCOPE=SPFILE;" | sqlplus / as sysdba
    echo "ALTER SYSTEM SET processes=1300 SCOPE=SPFILE;" | sqlplus / as sysdba
    echo "ALTER SYSTEM SET max_shared_servers = 25 scope = both;" | sqlplus / as sysdba
    echo "ALTER SYSTEM SET shared_servers = 20 scope = both;" | sqlplus / as sysdba
    echo "ALTER SYSTEM SET optimizer_index_cost_adj=1 SCOPE=BOTH;" | sqlplus / as sysdba
    echo "ALTER SYSTEM SET db_securefile = 'FORCE';" | sqlplus / as sysdba
    echo "DROP FLASHBACK ARCHIVE fba;" | sqlplus / as sysdba
    echo "DROP TABLESPACE TS_FBA;" | sqlplus / as sysdba
}
function createTablespaces {
    echo "--------------------- CREATE TABLESPACES ---------------------"
    cd "$SCRIPTPATH" || errorExit "Cannot cd into $SCRIPTPATH"
    grep -i " QUOTA " "$SCRIPTPATH/$INSTALLFILE_DB" | cut -d' ' -f7 | sed 's/;//' | sort | uniq | while read -r TS; do
        echo "CREATE TABLESPACE $TS DATAFILE '$PATH_DATAFILES/$TS.dbf' SIZE 100M REUSE AUTOEXTEND ON NEXT 100M MAXSIZE 10G EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO;" | sqlplus / as sysdba
    done
    find . -type f  -name "create_*sql" | grep "/user/" | while read -r LINE; do 
      grep -i " DEFAULT TABLESPACE " "$LINE" | awk '{ print $3; }'; done | sort | uniq | sed 's/"//g' | while read -r TS; do
        echo "CREATE TABLESPACE $TS DATAFILE '$PATH_DATAFILES/$TS.dbf' SIZE 100M REUSE AUTOEXTEND ON NEXT 100M MAXSIZE 10G EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO;" | sqlplus / as sysdba
    done
}
function dropUser {
    echo "--------------------- DROP USERS ---------------------"
    cd "$SCRIPTPATH" || errorExit "Cannot cd into $SCRIPTPATH"
    SCHEMAS=$(
    find . -type f  -name "create_*sql" | grep "/user/" | cut -d '/' -f2 | grep -v "SYSTEM" | while read -r SCHEMA; do
        echo "$SCHEMA"
    done
    )
    readarray -t SCHEMAS <<<"$SCHEMAS"
    QUERY="select 'ALTER SYSTEM KILL SESSION '''||SID||','||SERIAL#||''' IMMEDIATE' STMT  from v\$session where schemaname in ("
    DROPS=()
    CNT=0
    OLDIFS=$IFS
    IFS=""
    for SCHEMA in ${SCHEMAS[*]}; do
        QUERY+="'$SCHEMA'"
        DROPS+=( "DROP USER $SCHEMA CASCADE;" )
        ((CNT+=1))
        if [ "$CNT" -lt "${#SCHEMAS[*]}" ]
            then
            QUERY+=", "
        fi
    done
    QUERY+=");"
    echo "Marking user sessions for kill..."
    sqlplus -s / as sysdba << EOF
        declare
            cursor c_kill is
                $QUERY
        begin
            for l_rec in c_kill loop
                dbms_output.put_line(l_rec.stmt);
                execute immediate l_rec.stmt;
            end loop;
        end;
        /
EOF
    echo "Waiting 10 seconds for sessions to be killed..."
    sleep 10s
    CNT=0
    for DROP in ${DROPS[*]}; do
        echo "Dropping user ${SCHEMAS[$CNT]}..."
        echo "$DROP" | sqlplus / as sysdba
        ((CNT+=1))
    done
    IFS=$OLDIFS
    
}
function installDBObjects {
    echo "--------------------- INSTALL DATABASE OBJECTS ---------------------"
    cd "$SCRIPTPATH" || errorExit "Cannot cd into $SCRIPTPATH"
    sqlplus / as sysdba "@$INSTALLFILE_DB"
}
function insertLookups {
    echo "--------------------- INSERT INITIAL DATA ---------------------"
    cd "$SCRIPTPATH" || errorExit "Cannot cd into $SCRIPTPATH"
    sqlplus / as sysdba "@$INSTALLFILE_LOOKUPS"
}
function installApex {
    echo "--------------------- INSTALL APEX OBJECTS ---------------------"
    cd "$SCRIPTPATH/$OWNER_APEX/apex" || errorExit "$SCRIPTPATH/$OWNER_APEX/apex"
    sqlplus / as sysdba <<EOF
        @workspace.sql
        exit;
        @static_workspace_files.sql
        exit;
EOF
    for file in `ls application*.sql` ; do
        sqlplus -S -L "$OWNER_REST/$PASS_REST"  <<EOF
            whenever oserror exit 127 rollback;
            whenever sqlerror exit 128 rollback;
            @${file}
            exit;
EOF
        V_LAST_EXITCODE=$?
        echo "$file: Exit Code $V_LAST_EXITCODE"
    done;    
}
function installRest {
    echo "--------------------- INSTALL REST SERVICES ---------------------"
    cd "$SCRIPTPATH/$OWNER_REST" || errorExit "Cannot cd into $SCRIPTPATH/$OWNER_REST"
    sqlplus -S $OWNER_REST/$PASS_REST <<EOF > /dev/null
    BEGIN
      ORDS.DROP_REST_FOR_SCHEMA;
      ORDS.ENABLE_SCHEMA;
    COMMIT;
    END;
    /    
EOF
    for file in `ls *.sql` ; do
        sqlplus -S -L "$OWNER_REST/$PASS_REST"  <<!
            whenever oserror exit 127 rollback;
            whenever sqlerror exit 128 rollback;
            @${file}
            exit ;
!
        V_LAST_EXITCODE=$?
        echo "$file: Exit Code $V_LAST_EXITCODE"
    done;
}
if [ $(whoami) != "oracle" ]; then
    echo "Must be executed as oracle user on the DB host (due to 'sqlplus / as sysdba' call)"
    exit 0
fi
OPTIND=1
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
SETTINGS=" ";TABLESPACES=" ";USERS=" ";DATABASEOBJECTS=" ";INITIALDATA=" ";APEX=" ";REST=" ";INTERACTIVE="x";
while getopts "hfstudiarp:" ARG; do
    case $ARG in
        [h] )  showHelp;exit 0;;
        [f] )  SETTINGS="x";TABLESPACES="x";USERS="x";DATABASEOBJECTS="x";INITIALDATA="x";APEX="x";REST="x";INTERACTIVE=" ";;
        [s] )  SETTINGS="x";INTERACTIVE=" ";;
        [t] )  TABLESPACES="x";INTERACTIVE=" ";;
        [u] )  USERS="x";INTERACTIVE=" ";;
        [d] )  DATABASEOBJECTS="x";INTERACTIVE=" ";;
        [i] )  INITIALDATA="x";INTERACTIVE=" ";;
        [a] )  APEX="x";INTERACTIVE=" ";;
        [r] )  REST="x";INTERACTIVE=" ";;
        [p] )  SCRIPTPATH="$OPTARG";;
    esac
done
shift $((OPTIND-1))
[ "${1:-}" = "--" ] && shift
if [ "$INTERACTIVE" == "x" ]; then configure; fi;

#############
# log to file
LOGFILE=$(basename "$0")-$(date +%F_%H%M%S).log
exec > >(tee -a "$LOGFILE")
exec 2>&1
############

echo "Production clone installation will execute the following steps:"
showSettings    
cd "$SCRIPTPATH" || errorExit "Cannot cd into $SCRIPTPATH"

if [ "$SETTINGS" == "x" ]; then applyDBSettings; fi;
if [ "$TABLESPACES" == "x" ]; then createTablespaces; fi;
if [ "$USERS" == "x" ]; then dropUser; fi;
if [ "$DATABASEOBJECTS" == "x" ]; then installDBObjects; fi;
if [ "$INITIALDATA" == "x" ]; then insertLookups; fi;
if [ "$APEX" == "x" ]; then installApex; fi;
if [ "$REST" == "x" ]; then installRest; fi;


