#!/bin/bash

#set -x

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
EXPORTDIR="$SCRIPTPATH/20675-sources-$(hostname -f)-$(date +%FT%H%M)"
HOST_PORT_SERVICE="localhost:1521/afis"
SYSTEMPASS="system"
PREFIX="install-"
DL_BORDERCONTROL_PROXY=

S2DDL="$SCRIPTPATH/scheme2ddl.jar"

if ! command -v java; then
  export PATH=$SCRIPTPATH/jre/bin:$PATH
  export JAVA_HOME=$SCRIPTPATH/jre
  if ! command -v java; then
    echo "No Java runtime available!"
    exit 1
  fi
fi

export CLASSPATH=$SCRIPTPATH

APEXApps="500 510 515 520 525 535 600 700 1000 1100 99999"

function FUNCDEBUG
{
    test -z "$FUNCDEBUG" && return 1
    echo $1
    return 0
}

function DL_BLACKLIST { #grepme
cat <<-'EOFTABLES'
FACE_MISSING_REASONS
FACE_POSITIONS
FACE_QUALITY_TYPES
FINGER_IMPRESSION_TYPES
FINGER_MISSING_REASONS
FINGER_POSITIONS
OPS_PREFERENCES
EOFTABLES
}

function DL_BORDERCONTROL { #grepme
cat <<-'EOFTABLES'
ADM_CLASS_DISTRICT
ADM_CLASS_DISTRICT$I18N
ADM_CLASS_PROVINCE
ADM_CLASS_PROVINCE$I18N
ADM_CLASS_REGION
ADM_CLASS_REGION$I18N
ADM_CLASS_SUBDISTRICT
ADM_CLASS_SUBDISTRICT$I18N
COUNTRY_MANAGEMENT
DISPLAY_OBJECTS
FAF_FEES_AND_FINES
FAF_FEES_AND_FINES_DETAILS
FAF_PAYMENT_RATE
FAF_PAYMENT_RATE$I18N
FAF_PAYMENT_RATE$TAG
FAF_PERMIT_TYPE
FAF_PERMIT_TYPE$I18N
FAF_PERMIT_TYPE$TAG
PARAMETERS
X_VISARUN_RULES
EOFTABLES
}

function DL_BORDERCONTROL_DATAMART { #grepme
cat <<-'EOFTABLES'
EVENT_TYPES
EOFTABLES
}

#APEX_LISTS
function DL_COMMON { #grepme
cat <<-'EOFTABLES'
ACTION_CODES
ACTION_CODES$I18N
AIRPORTS
AIRPORTS$I18N
APEX_MENU
APEX_MENU$I18N
ARRESTED_STATUSES
ARRESTED_STATUSES$I18N
ARRESTED_TYPES
ARRESTED_TYPES$I18N
BC_DOC_CLASS
BC_DOC_CLASS$I18N
BC_PERSON_TYPES
BC_PERSON_TYPES$I18N
B_LIST_REASONS
B_LIST_REASONS$I18N
BOOLS
BOOLS$I18N
BORDER_TYPES
BORDER_TYPES$I18N
BS_RELATIONSHIPS
BS_RELATIONSHIPS$I18N
CARD_TYPES
CARD_TYPES$I18N
CARRIERS
CARRIERS$I18N
CASE_TYPES
CONTINENTS
CONTINENTS$I18N
COUNTRIES
COUNTRIES_ICAO_DOC_CODES
COUNTRIES$I18N
DEVICE_TYPES
DEVICE_TYPES$I18N
DYNAMIC_SQLS
ENTRY_EXITS
ENTRY_EXITS$I18N
FINGER_MISS_REASONS
FINGER_MISS_REASONS$I18N
FINGER_STATUS
FINGER_STATUS$I18N
HUMAN_FINGERS
HUMAN_FINGERS$I18N
HUMAN_SEXES
HUMAN_SEXES$I18N
ICAO_DC_LIST_ITMS
ICAO_DC_LISTS
ICAO_DC_LISTS$I18N
ICAO_DOC_CODES
ICAO_DOC_CODES$I18N
ICAO_DOC_CODE$VISA_TYPE
INCIDENT_TYPES
INCIDENT_TYPES$I18N
LANGUAGES
LANGUAGES$I18N
LOCALES
MESSAGES
MESSAGES$I18N
MOVEMENT_REASONS
MOVEMENT_REASONS$I18N
MOVEMENT_REASONS$TAG
OWNERS
OWNERS$I18N
OWNERS$TAG
PERMIT_TYPES
PERMIT_TYPES$I18N
PORT_MOVEMENTS
PORT_MOVEMENTS$I18N
PORT_MOVEMENTS$TAG
PORTS
PORTS$I18N
PROFESSIONS
PROFESSIONS$I18N
REASON_CODES
REASON_CODES$I18N
RELATIONS
SALUTATIONS
SALUTATIONS$I18N
SECRET_LEVELS
SECRET_LEVELS$I18N
STATUSES
STATUSES$I18N
STATUSES$TAG
SUB_NATIONALITIES
TRANS_GRP_STATES
TRANS_GRP_STATES$I18N
TRANS_MODES
TRANS_MODES$I18N
TRANS_VEHICLES
TRANS_VEHICLES$I18N
VISA_TYPES
VISA_TYPES$I18N
YES_NOS
YES_NOS$I18N
EOFTABLES
}

function DL_DBA { #grepme
cat <<-'EOFTABLES'
TEMPLATES
TEMPLATES$I18N
TEMPLATES$TAG
EOFTABLES
}

function DL_INTERFACE { #grepme
cat <<-'EOFTABLES'
PARAMETERS
EOFTABLES
}

function DL_STAGING4PIBICS { #grepme
cat <<-'EOFTABLES'
OPS_PIBICS_LOAD_PROCESSES
OPS_PIBICS_TABLE
OPS_PREFERENCES
EOFTABLES
}

function DL_STAGING4PIBICS_INTF { #grepme
cat <<-'EOFTABLES'
OPS_BACKEND_PROCESSES
OPS_PREFERENCES
OPS_STAGING_PROCESSES
OPS_SYNC_PROCESSES
TRCD_BORDERPOST
TRCD_RANKCRW
EOFTABLES
}

function DL_USER_MANAGEMENT { #grepme
cat <<-'EOFTABLES'
GRANTS
LOOKUPS
LOOKUPS$I18N
OBJECT_GRANT_REL
OBJECT_PAGE_REL
OBJECTS
PARAMETER_SETTINGS
ROLE_OBJECT_GRANT_REL
ROLES
EOFTABLES
}

function schemas
{
cat <<-EOFSCHEMAS
    APEX_USER_MANAGEMENT
    BIO_BD
    DL_BIOSTORE_BLACKLIST
    DL_BIOSTORE_MOVEMENTS
    DL_BLACKLIST
    DL_BORDERCONTROL
    DL_BORDERCONTROL_DATAMART
    DL_COMMON
    DL_DBA
    DL_INTERFACE
    DL_MAINTENANCE
    DL_STAGING
    DL_STAGING4PIBICS
    DL_STAGING4PIBICS_INTF
    DL_USER_MANAGEMENT
    JASPER_REPORTING
    LOGGER
    PIBICSDM2
    PIBICSDM2_RO
    SERVAPP
    SYSTEM
    USER_MANAGEMENT
EOFSCHEMAS
}

function objects {
cat << OBJECTS
user
db_links
public_db_links
sequences
types
type_bodies
packages
tables
views
triggers
materialized_views
refresh_groups
package_bodies
procedures
functions
synonyms
dbms_jobs
jobs
schedules
OBJECTS
}

function showUsage {
  cat <<EOF
  Usage:
    $0 [ARGS]
    With ARGS:
        -d  EXPORTDIR
            Directory to export into. Defaults to "$EXPORTDIR" with current timestamp
        -s  HOST:PORT/SERVICE
            Oracle listener port and servicename. Defaults to "$HOST_PORT_SERVICE"
        -x  Password of "system" user. Defaults to "$SYSTEMPASS"
        -l  Use a temporary proxy user to access REST modules of DL_BORDERCONTROL
            in case the credentials DL_BORDERCONTROL/DL_BORDERCONTROL do not work.

        Exports the following:
        -f  All of the things below!
        -c  DDLs to create users and assign privileges
        -o  Objects as DDL into single files
        -r  REST modules of DL_BORDERCONTROL
        -p  Execute privilige on SYS/SYSTEM objects
        -w  APEX workspace
        -e  APEX static files
        -a "APP1 APP2 APP3"
            APEX applications, with APPx as space separated application IDs in double quotes!
            Defaults to "$APEXApps"
        -i  PREFIX
            Create drafts for installation files, that sources all objects as created with -o.
            In order not to overwrite existing files (as they are likely changed already to
            circumvent dependency problems), the files are prefixed with PREFIX.
        -v  Lookups as INSERT statements
        -z  create tar.gz archive

    Note: This script must be run as oracle user and needs the following files/dependencies:
    .
    ├── ojdbc8.jar
    ├── oracle
    │   └── apex
    │       └── APEXExportSplitter.class
    └── scheme2ddl.jar -> scheme2ddl-2.4.2.jar
    Optional: Use jre here rather than system-wide one (or not even present!)
    └── jre -> jre1.8.VERSION

    Sources for these files:
    - scheme2ddl-2.4.2.jar: https://bintray.com/qwazer/maven/scheme2ddl
    - APEXExportSplitter.class: /u01/app/oracle/product/12c/dbhome_1/apex/utilities/oracle/apex/APEXExportSplitter.class
    - jre: jre-8VERSION-linux-x64.tar.gz from Oracle download pages

EOF
}

if [ $# -lt 1 ]; then
    showUsage
    exit 0
fi

function exportWorkspace {
    FUNCDEBUG "${FUNCNAME[0]} $@" && return

    test -d "$EXPORTDIR/DL_BORDERCONTROL/apex" || mkdir -p "$EXPORTDIR/DL_BORDERCONTROL/apex"
    sqlplus -S DL_BORDERCONTROL/DL_BORDERCONTROL <<-EOF > /dev/null
    -- SQL*Plus environment settings
    -- they are crucial to retrieve a consistent export file
    set feedback off
    set heading off
    set echo off
    set flush off
    set termout off
    set pagesize 0
    set long 100000000 longchunksize 32767
    column output format a4000
    set linesize 4000
    set trimspool on

    -- variable for storing the export data
    variable contents clob

    -- generating the export file
    declare
        l_files apex_t_export_files;
    begin
        l_files := apex_export.get_workspace(
            p_workspace_id => 1672400873050999,
            p_with_date => false,
            p_with_team_development => false,
            p_with_misc => true
        );
        -- in the first file we have the needed export data
        :contents := l_files(1).contents;
    end;
    /
    spool '$EXPORTDIR/DL_BORDERCONTROL/apex/workspace.sql'
    print contents
    spool off

EOF
}

function exportStaticWSFiles {
    FUNCDEBUG "${FUNCNAME[0]} $@" && return

    test -d "$EXPORTDIR/DL_BORDERCONTROL/apex" || mkdir -p "$EXPORTDIR/DL_BORDERCONTROL/apex"
    sqlplus -S / as sysdba <<-EOF > /dev/null
    -- SQL*Plus environment settings
    -- they are crucial to retrieve a consistent export file
    set feedback off
    set heading off
    set echo off
    set flush off
    set termout off
    set pagesize 0
    set long 100000000 longchunksize 32767
    column output format a4000
    set linesize 4000
    set trimspool on

    -- variable for storing the data
    variable contents clob

    declare
        v_apex_static_files clob;
    begin
        select dl_dba.PKG_APEX_UTIL.Script4Static_WS_Files('dl_bordercontrol') into v_apex_static_files from dual;
        :contents := v_apex_static_files;
    end;
    /
    spool '$EXPORTDIR/DL_BORDERCONTROL/apex/static_workspace_files.sql'
    print contents
    spool off

EOF
}

function exportAPEXApp {
    FUNCDEBUG "${FUNCNAME[0]} $@" && return
    APP_ID=$1
    test -d "$EXPORTDIR/DL_BORDERCONTROL/apex" || mkdir -p "$EXPORTDIR/DL_BORDERCONTROL/apex"
    sqlplus -S DL_BORDERCONTROL/DL_BORDERCONTROL <<-EOF > /dev/null
    -- SQL*Plus environment settings
    -- they are crucial to retrieve a consistent export file
    set feedback off
    set heading off
    set echo off
    set flush off
    set termout off
    set pagesize 0
    set long 100000000 longchunksize 32767
    column output format a4000
    set linesize 4000
    set trimspool on

    -- variable for storing the export data
    variable contents clob

    -- generating the export file
    declare
        l_files apex_t_export_files;
    begin
        l_files := apex_export.get_application(
            p_application_id            => $APP_ID,
            p_with_ir_public_reports    => true,
            p_with_ir_private_reports   => false,
            p_with_ir_notifications     => true,
            p_with_translations         => true,
            p_with_comments             => true
        );
        :contents := l_files(1).contents;
    end;
    /
    spool '$EXPORTDIR/DL_BORDERCONTROL/apex/application_$APP_ID.sql'
    print contents
    spool off
EOF
    cd "$EXPORTDIR/DL_BORDERCONTROL/apex"
    java oracle.apex.APEXExportSplitter application_$APP_ID.sql
    cd -
}

function exportObjects {
    FUNCDEBUG "${FUNCNAME[0]} $@" && return

    test -d "$EXPORTDIR" || mkdir -p "$EXPORTDIR"
    cat <<EOXML > "$EXPORTDIR/tmpconfig.xml"
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans" xmlns:util="http://www.springframework.org/schema/util" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-2.5.xsd     http://www.springframework.org/schema/util http://www.springframework.org/schema/util/spring-util-2.0.xsd">
<import resource="classpath:applicationContext.xml" />
<bean id="reader" class="com.googlecode.scheme2ddl.UserObjectReader" scope="step">
    <property name="processPublicDbLinks" value="true" />
    <property name="processDmbsJobs" value="true" />
    <!--  process each constraint in separate files (constraints already included to tables DDL scripts in default transformParams_for_dbms_metadata) -->
    <property name="processConstraint" value="false" />
</bean>
<bean id="taskExecutor" class="org.springframework.core.task.SimpleAsyncTaskExecutor">
    <property name="concurrencyLimit" value="4" />
</bean>
<!-- http://download.oracle.com/docs/cd/B19306_01/appdev.102/b14258/d_metada.htm#BGBJBFGE -->
<util:map id="transformParams_for_dbms_metadata">
    <entry key="SEGMENT_ATTRIBUTES" value="FALSE" />
    <entry key="SQLTERMINATOR" value="TRUE" />
    <entry key="CONSTRAINTS_AS_ALTER" value="TRUE" />
</util:map>
<!-- format option for DDL, actually perform only trim for resulting DDL -->
<bean id="ddlFormatter" class="com.googlecode.scheme2ddl.DDLFormatter">
    <!-- Check it to true if you don't want apply formatting on DMBS_OUTPUT. -->
    <property name="noFormat" value="false" />
    <property name="isMorePrettyFormat" value="false" />
    <property name="sortCreateIndexStatements" value="true" />
</bean>
<!-- rules for construct filenames  -->
<bean id="fileNameConstructor" class="com.googlecode.scheme2ddl.FileNameConstructor">
    <!-- Construct your custom layout from keywords

                schema - schema name in lower case
                type - type name in lower case, for example 'table' or 'index'
                types_plural - type name in plural form in lower case, for xample 'tables' or 'indexes'
                object_name - object name in lower case
                ext - extension in lower case
                SCHEMA - schema name in UPPER case
                TYPE - type name in UPPER case, for example 'table' or 'index'
                TYPES_PLURAL - type name in plural form in UPPER case, for xample 'tables' or 'indexes'
                OBJECT_NAME - object name in UPPER case
                EXT - extension in UPPER case

            Keywords escaping is not supported.
            Word in Mixed Case is not keyword
        -->
    <property name="template" value="types_plural/object_name.ext" />
    <property name="templateForSysDBA" value="SCHEMA/types_plural/object_name.ext" />
    <property name="needToReplaceWindowsReservedFileNames" value="true" />
    <!-- File extension map rules.
        Use predefined 'TOAD' or 'PL/SQL Developer' mapping or create custom mapping -->
    <property name="extensionMap" ref="toad" />
    <!-- combine package spec and body files into one packages directory.
        Only use this for TOAD extensionMap, otherwise spec sql files overwrite body sql files.-->
    <property name="combinePackage" value="false" />
</bean>
<util:map id="sql_by_default">
    <entry key="DEFAULT">
    <value>sql</value>
    </entry>
</util:map>
<!-- File extension map rules like TOAD -->
<util:map id="toad">
    <!--todo need carefully test -->
    <entry key="DEFAULT">
    <value>sql</value>
    </entry>
    <entry key="PROCEDURE">
    <value>prc</value>
    </entry>
    <entry key="FUNCTION">
    <value>fnc</value>
    </entry>
    <entry key="TRIGGER">
    <value>trg</value>
    </entry>
    <entry key="VIEW">
    <value>vw</value>
    </entry>
    <entry key="PACKAGE">
    <value>pks</value>
    </entry>
    <entry key="PACKAGE_BODY">
    <value>pkb</value>
    </entry>
</util:map>
<!-- File extension map rules like PL/SQL Developer -->
<util:map id="plsqldeveloper">
    <!--todo need filling and carefully test -->
    <entry key="DEFAULT">
    <value>sql</value>
    </entry>
</util:map>
<!--
    Windows doesn't allow to save files with reserved file names
    https://msdn.microsoft.com/en-us/library/windows/desktop/aa365247%28v=vs.85%29.aspx
    This is confugurable workaround for this limitation
    -->
<util:map id="windowsReservedNamesReplacements" key-type="java.lang.String" value-type="java.lang.String">
    <entry key="CON " value="CON_" />
    <entry key="PRN" value="PRN_" />
    <entry key="AUX" value="AUX_" />
    <entry key="NUL" value="NUL_" />
    <entry key="COM1" value="COM1_" />
    <entry key="COM2" value="COM2_" />
    <entry key="COM3" value="COM3_" />
    <entry key="COM4" value="COM4_" />
    <entry key="COM5" value="COM5_" />
    <entry key="COM6" value="COM6_" />
    <entry key="COM7" value="COM7_" />
    <entry key="COM8" value="COM8_" />
    <entry key="COM9" value="COM9_" />
    <entry key="LPT1" value="LPT1_" />
    <entry key="LPT2" value="LPT2_" />
    <entry key="LPT3" value="LPT3_" />
    <entry key="LPT4" value="LPT4_" />
    <entry key="LPT5" value="LPT5_" />
    <entry key="LPT6" value="LPT6_" />
    <entry key="LPT7" value="LPT7_" />
    <entry key="LPT8" value="LPT8_" />
    <entry key="LPT9" value="LPT9_" />
</util:map>
<!-- Specify dependable items for every user object type accordingly with http://download.oracle.com/docs/cd/B19306_01/appdev.102/b14258/d_metada.htm#BGBIEDIA -->
<util:map id="dependencies">
    <entry key="TABLE">
    <set>
        <value>COMMENT</value>
        <value>INDEX</value>
        <value>OBJECT_GRANT</value>
    </set>
    </entry>
    <entry key="VIEW">
    <set>
        <value>COMMENT</value>
        <value>OBJECT_GRANT</value>
    </set>
    </entry>
    <entry key="MATERIALIZED VIEW">
    <set>
        <value>COMMENT</value>
        <value>INDEX</value>
        <value>MATERIALIZED_VIEW_LOG</value>
        <value>OBJECT_GRANT</value>
    </set>
    </entry>
    <entry key="FUNCTION">
    <set>
        <value>OBJECT_GRANT</value>
    </set>
    </entry>
    <entry key="PROCEDURE">
    <set>
        <value>OBJECT_GRANT</value>
    </set>
    </entry>
    <entry key="PACKAGE BODY">
    <set>
        <value>OBJECT_GRANT</value>
    </set>
    </entry>
    <entry key="SYNONYM">
    <set>
        <value>OBJECT_GRANT</value>
    </set>
    </entry>
    <entry key="TYPE">
    <set>
        <value>OBJECT_GRANT</value>
    </set>
    </entry>
</util:map>
<!-- Key is the object type,
        Value - is set of patterns for exlude
        Currently only '*' wildcard supported -->
<util:map id="excludes">
    <entry key="*">
    <set>
        <value>*_*_temp_*</value>
    </set>
    </entry>
    <!--
        <entry key="VIEW">
            <set>
                <value>example_exlude_prefix_*</value>
                <value>*_example_exlude_suffix</value>
            </set>
        </entry>
        -->
    <entry key="TABLE PARTITION">
    <set>
        <value>*</value>
    </set>
    </entry>
    <entry key="INDEX PARTITION">
    <set>
        <value>*</value>
    </set>
    </entry>
    <entry key="LOB">
    <set>
        <value>*</value>
    </set>
    </entry>
    <!--Excluded, because all them persist in PACKAGE, TYPE and TABLE -->
    <!--<entry key="PACKAGE BODY"><set><value>*</value></set></entry>-->
    <entry key="TYPE BODY">
    <set>
        <value>*</value>
    </set>
    </entry>
    <entry key="INDEX">
    <set>
        <value>*</value>
    </set>
    </entry>
    <!--For removing system types http://www.sql.ru/forum/actualthread.aspx?bid=3&tid=542661&hl=-->
    <entry key="TYPE">
    <set>
        <value>SYSTP*</value>
        <value>*==</value>
        <!--a pipelined function that returns a PL/SQL collection type Oracle will automagically generate a compatible SQL collection type. Exclude them-->
        <value>SYS_PLSQL_*</value>
    </set>
    </entry>
</util:map>
<bean id="dataSource" class="oracle.jdbc.pool.OracleDataSource">
    <!-- <property name="URL" value="jdbc:oracle:thin:@10.120.40.146:1521:afis"/>  -->
    <property name="URL" value="jdbc:oracle:thin:@$HOST_PORT_SERVICE" />
    <!-- You can choose a DBA user. For example: value="sys as sysdba" -->
    <property name="user" value="DL_MAINTENANCE" />
    <property name="password" value="DL_MAINTENANCE" />
    <property name="connectionCachingEnabled" value="true" />
</bean>
<bean id="writer" class="com.googlecode.scheme2ddl.UserObjectWriter">
    <property name="outputPath" value="$EXPORTDIR" />
</bean>
<!-- list of schema for processing, used only if oracle user connected as sysdba-->
<util:list id="schemaList">
    $(schemas | while read LINE; do echo "
    <value>$LINE</value>
    "; done)
</util:list>
</beans>
EOXML
    # scheme2ddl uses relative path
    "$S2DDL" -c "$(basename "$EXPORTDIR")/tmpconfig.xml"

    # these types do not install using sqlplus, if they have empty lines,
    # therefore we remove empty lines
    for TYPE in triggers types tables views; do
        find "$EXPORTDIR" -type d -name "$TYPE"
    done |\
    while read -r TYPEPATH; do
        find "$TYPEPATH" -type f -exec sed -i '/^[[:space:]]*$/d' "{}" \;
    done

    # separate type specs and body
    find "$EXPORTDIR" -type d -name types |\
    while read TYPEDIR; do
        mkdir "$(dirname "$TYPEDIR")/type_bodies"
        find "$TYPEDIR" -type f -name "*sql" | while read TYPEPATH; do
            SPECPATH="$TYPEDIR/$(basename "$TYPEPATH" .sql).tps"

            # check if there type is inline without explicit body
            if [ $(grep -h -c -i "create.*or.*replace" "$TYPEPATH") -eq 1 ]; then
                mv "$TYPEPATH" "$SPECPATH"
                continue
            fi

            # search boundaries
            BODY=$(grep -h -n -i "create.*or.*replace" "$TYPEPATH" | cut -d ':' -f1 | tail -1)
            SPEC=$(($BODY-1))

            # separate spec and add grant statement
            sed -n "1, ${SPEC}p" "$TYPEPATH" > "$SPECPATH"
            grep -i "grant.*execute" "$TYPEPATH" >> "$SPECPATH"

            # separate body and remove grant statement there
            sed -n "$BODY, \$p" "$TYPEPATH" | sed 's/grant.*execute.*//gI' > "$(dirname "$TYPEDIR")/type_bodies/$(basename "$TYPEPATH" .sql).tpb"

            # clean up
            rm "$TYPEPATH"
        done
    done
}

function createProxyConnectDL_BORDERCONTROL
{
    FUNCDEBUG "${FUNCNAME[0]} $@" && return

    # if empty string, do nothing
    [ -z "$DL_BORDERCONTROL_PROXY" ] && return
    cat <<EOF
    create user DL_BORDERCONTROL_PROXY identified by DL_BORDERCONTROL_PROXY;
    alter user DL_BORDERCONTROL grant connect through DL_BORDERCONTROL_PROXY;
    connect DL_BORDERCONTROL_PROXY[DL_BORDERCONTROL]/DL_BORDERCONTROL_PROXY
EOF
}

function removeProxyConnectDL_BORDERCONTROL
{
    FUNCDEBUG "${FUNCNAME[0]} $@" && return
    sqlplus -S / as sysdba <<EOF
    alter user DL_BORDERCONTROL revoke connect through DL_BORDERCONTROL_PROXY;
    drop user DL_BORDERCONTROL_PROXY;
EOF
}


function exportExecutePriviligeSQLs {
    FUNCDEBUG "${FUNCNAME[0]} $@" && return

    test -d "$EXPORTDIR/SYS/user" || mkdir -p "$EXPORTDIR/SYS/user"
    SCHEMAS=$(schemas | while read SCHEMA; do echo -n "'$SCHEMA',"; done | sed 's/,$//')
    # Generate EXECUTE privileges for SYS objects
    sqlplus -S / as sysdba <<-EOF | grep -iv 'rows selected' | sed -r '/^\s*$/d' | sort > "$EXPORTDIR/SYS/user/sys_grants.sql"
    set pages 0 lin 17000;
        select 'GRANT '||privilege||' on '||owner||'.'||table_name||' to '||grantee||';'
        from dba_tab_privs
        where grantee in ($SCHEMAS)
        and owner in ('SYS','SYSTEM')
        and grantee not in (select role from dba_roles)
        order by grantee;
EOF
}

function exportCreateUser
{
    FUNCDEBUG "${FUNCNAME[0]} $@" && return
    schemas | while read SCHEMA; do
        test -d "$EXPORTDIR/$SCHEMA/user" || mkdir -p "$EXPORTDIR/$SCHEMA/user"
        sqlplus -S / as sysdba <<EOF > "$EXPORTDIR/$SCHEMA/user/create_$SCHEMA.sql"
    -- SQL*Plus environment settings
    -- they are crucial to retrieve a consistent export file
    set feedback off
    set heading off
    set echo off
    set flush off
    set termout off
    set pagesize 0
    set long 100000000 longchunksize 32767
    column output format a4000
    set linesize 4000
    set trimspool on

    -- variables for storing the export data
    variable CREATE_USER clob;
    variable SYSTEM_GRANT clob;
  begin
   DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'SQLTERMINATOR', true);
   DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'PRETTY', true);
   :CREATE_USER := '';
   :SYSTEM_GRANT := '';
    begin
     :CREATE_USER := dbms_metadata.get_ddl('USER','$SCHEMA');
     exception when OTHERS then NULL;
    end;
    begin
     :SYSTEM_GRANT := DBMS_METADATA.GET_GRANTED_DDL('SYSTEM_GRANT','$SCHEMA');
     exception when OTHERS then NULL;
    end;
  end;
/
  prompt -- Create
  print CREATE_USER;
  prompt -- SYSTEM_GRANT
  print SYSTEM_GRANT;
EOF
    done
}

function createInstallDraft {
    FUNCDEBUG "${FUNCNAME[0]} $@" && return
    cd "$EXPORTDIR"
    objects | while read OBJECT; do
        OUT_FILE=${PREFIX}${OBJECT}.sql
        echo "@$OUT_FILE" >> ${PREFIX}ALL_OBJECTS.sql
        echo "---------------------" >> "$OUT_FILE"
        echo "-- $OBJECT --" >> "$OUT_FILE"
        schemas | while read SCHEMA; do
            test -d "$SCHEMA/$OBJECT" || continue
            echo "-- $SCHEMA/$OBJECT" >> "$OUT_FILE"
            ls -A1 "$SCHEMA/$OBJECT" | while read FILE; do
            echo "@$SCHEMA/$OBJECT/$FILE" >> "$OUT_FILE"
            done
        done
    done
}

function getModules {
    sqlplus -S / as sysdba <<-EOF | grep -iv 'rows selected' | sed -r '/^\s*$/d' | sort
    set pages 0 lin 17000;
    select name from ORDS_METADATA.ORDS_MODULES where upper(CREATED_BY)='DL_BORDERCONTROL' order by name;
EOF
}

function exportRESTModules {
    MODULE=$1
    VALIDFILENAME=$(echo "$MODULE" | sed -e 's/[^A-Za-z0-9._-]/_/g')
    CREDENTIALS="DL_BORDERCONTROL/DL_BORDERCONTROL"

    sqlplus -S $CREDENTIALS <<EOF > /dev/null

    $(createProxyConnectDL_BORDERCONTROL)
    -- SQL*Plus environment settings
    -- they are crucial to retrieve a consistent export file
    set feedback off
    set heading off
    set echo off
    set flush off
    set termout off
    set pagesize 0
    set long 100000000 longchunksize 32767
    column output format a4000
    set linesize 4000
    set trimspool on

    -- variable for storing the export data
    variable contents clob

    -- generating the export file
    begin
        :contents := ords_metadata.ords_export.export_module('$MODULE');
    end;
    /

    spool /tmp/restmodules-$VALIDFILENAME.sql

    print contents
    -- the trailing '/' symbol is needed to terminate the generated PL/SQL block
    prompt /

    -- spool off
EOF

    REST_MODULES="$EXPORTDIR/DL_BORDERCONTROL"
    test -d "$REST_MODULES" || mkdir -p "$REST_MODULES"
    sed -i  's/\(^-- Schema: DL_BORDERCONTROL\)\(.*\)/\1 Date: removed for diff/' /tmp/restmodules-$VALIDFILENAME.sql
    mv /tmp/restmodules-$VALIDFILENAME.sql "$REST_MODULES/restmodules-$VALIDFILENAME.sql"
    [ -z "$DL_BORDERCONTROL_PROXY" ] || { removeProxyConnectDL_BORDERCONTROL; trap - EXIT ; }
}

function createGetLookup {    
    SCHEMA=$1
    TABLE=$2
    echo -n "select "
    sqlplus -S / as sysdba <<-EOF | grep -iv 'rows selected' | sed -r '/^\s*$/d; s/$/,/g' | xargs | sed 's/,$//' | tr -d '\n'
        set heading off;
        select column_name from DBA_TAB_COLS
        where upper(table_name)='$TABLE'
        and upper(owner)='$SCHEMA'
        and virtual_column='NO'
        order by column_id;
EOF
    echo " from $SCHEMA.$TABLE;"
}

function getLookups {
    LOOKUPS="$EXPORTDIR/LOOKUPS"
    test -d "$LOOKUPS" || mkdir -p "$LOOKUPS"
    grep "^function.*#grepme" "$SCRIPTPATH/$(basename "$0")" | cut -d ' ' -f2 | while read -r SCHEMA; do
        $SCHEMA | while read -r TABLE; do
        lookupsql="$(createGetLookup $SCHEMA $TABLE)"
        echo "$SCHEMA.$TABLE"
        echo "$lookupsql"
        sql -S / as SYSDBA <<EOF | grep -iv 'rows selected' | sed -r '/^\s*$/d' > "$LOOKUPS/${SCHEMA}-${TABLE}.sql"
SET SQLFORMAT INSERT
$lookupsql
quit;
EOF
        done
    done

    sqlplus -S / as sysdba <<EOF | sed 's/\s*$//g' > "$EXPORTDIR/insert_lookups.sql"
    set pages 0 lin 17000;
    SET SERVEROUTPUT ON;
    SET FEED OFF;
    
declare
    type r_ddl  is record (STMT VARCHAR2(4000));
    type t_ddl  is table of r_ddl index by pls_integer;
    
    l_disable t_ddl;
    l_insert t_ddl;
    l_enable t_ddl;
    l_owner varchar2(30);
    l_table_name varchar2(30);

    cursor c_dict is
        WITH TABLES AS (
            SELECT 'DL_BLACKLIST' OWNER, 'FACE_MISSING_REASONS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BLACKLIST' OWNER, 'FACE_POSITIONS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BLACKLIST' OWNER, 'FACE_QUALITY_TYPES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BLACKLIST' OWNER, 'FINGER_IMPRESSION_TYPES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BLACKLIST' OWNER, 'FINGER_MISSING_REASONS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BLACKLIST' OWNER, 'FINGER_POSITIONS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BLACKLIST' OWNER, 'OPS_PREFERENCES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BORDERCONTROL' OWNER, 'ADM_CLASS_DISTRICT' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BORDERCONTROL' OWNER, 'ADM_CLASS_DISTRICT\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BORDERCONTROL' OWNER, 'ADM_CLASS_PROVINCE' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BORDERCONTROL' OWNER, 'ADM_CLASS_PROVINCE\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BORDERCONTROL' OWNER, 'ADM_CLASS_REGION' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BORDERCONTROL' OWNER, 'ADM_CLASS_REGION\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BORDERCONTROL' OWNER, 'ADM_CLASS_SUBDISTRICT' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BORDERCONTROL' OWNER, 'ADM_CLASS_SUBDISTRICT\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BORDERCONTROL' OWNER, 'BORDERPOSTS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BORDERCONTROL' OWNER, 'COUNTRY_MANAGEMENT' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BORDERCONTROL' OWNER, 'DISPLAY_OBJECTS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BORDERCONTROL' OWNER, 'FAF_PAYMENT_RATE' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BORDERCONTROL' OWNER, 'FAF_PAYMENT_RATE\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BORDERCONTROL' OWNER, 'FAF_PAYMENT_RATE\$TAG' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BORDERCONTROL' OWNER, 'FAF_PERMIT_TYPE' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BORDERCONTROL' OWNER, 'FAF_PERMIT_TYPE\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BORDERCONTROL' OWNER, 'FAF_PERMIT_TYPE\$TAG' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BORDERCONTROL' OWNER, 'PARAMETERS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BORDERCONTROL' OWNER, 'TERMINALS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BORDERCONTROL' OWNER, 'X_VISARUN_RULES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_BORDERCONTROL_DATAMART' OWNER, 'EVENT_TYPES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'ACTION_CODES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'ACTION_CODES\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'AIRPORTS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'AIRPORTS\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'APEX_LISTS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'APEX_MENU' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'APEX_MENU\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'ARRESTED_STATUSES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'ARRESTED_STATUSES\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'ARRESTED_TYPES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'ARRESTED_TYPES\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'B_LIST_REASONS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'B_LIST_REASONS\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'BC_DOC_CLASS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'BC_DOC_CLASS\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'BC_PERSON_TYPES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'BC_PERSON_TYPES\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'BOOLS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'BOOLS\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'BORDER_TYPES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'BORDER_TYPES\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'BS_RELATIONSHIPS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'BS_RELATIONSHIPS\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'CARD_TYPES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'CARD_TYPES\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'CARRIERS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'CARRIERS\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'CASE_TYPES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'CONTINENTS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'CONTINENTS\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'COUNTRIES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'COUNTRIES\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'COUNTRIES_ICAO_DOC_CODES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'DEVICE_TYPES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'DEVICE_TYPES\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'DYNAMIC_SQLS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'ENTRY_EXITS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'ENTRY_EXITS\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'FINGER_MISS_REASONS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'FINGER_MISS_REASONS\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'FINGER_STATUS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'FINGER_STATUS\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'HUMAN_FINGERS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'HUMAN_FINGERS\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'HUMAN_SEXES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'HUMAN_SEXES\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'ICAO_DC_LIST_ITMS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'ICAO_DC_LISTS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'ICAO_DC_LISTS\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'ICAO_DOC_CODE\$VISA_TYPE' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'ICAO_DOC_CODES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'ICAO_DOC_CODES\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'INCIDENT_TYPES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'INCIDENT_TYPES\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'LANGUAGES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'LANGUAGES\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'LOCALES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'MESSAGES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'MESSAGES\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'MOVEMENT_REASONS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'MOVEMENT_REASONS\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'MOVEMENT_REASONS\$TAG' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'OWNERS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'OWNERS\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'OWNERS\$TAG' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'PERMIT_TYPES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'PERMIT_TYPES\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'PORT_MOVEMENTS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'PORT_MOVEMENTS\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'PORT_MOVEMENTS\$TAG' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'PORTS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'PORTS\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'PROFESSIONS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'PROFESSIONS\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'REASON_CODES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'REASON_CODES\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'RELATIONS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'SALUTATIONS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'SALUTATIONS\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'SECRET_LEVELS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'SECRET_LEVELS\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'STATUSES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'STATUSES\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'STATUSES\$TAG' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'SUB_NATIONALITIES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'TRANS_GRP_STATES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'TRANS_GRP_STATES\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'TRANS_MODES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'TRANS_MODES\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'TRANS_VEHICLES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'TRANS_VEHICLES\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'VISA_TYPES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'VISA_TYPES\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'YES_NOS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_COMMON' OWNER, 'YES_NOS\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_INTERFACE' OWNER, 'PARAMETERS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_STAGING4PIBICS' OWNER, 'OPS_PIBICS_LOAD_PROCESSES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_STAGING4PIBICS' OWNER, 'OPS_PIBICS_TABLE' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_STAGING4PIBICS' OWNER, 'OPS_PREFERENCES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_STAGING4PIBICS_INTF' OWNER, 'OPS_BACKEND_PROCESSES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_STAGING4PIBICS_INTF' OWNER, 'OPS_PREFERENCES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_STAGING4PIBICS_INTF' OWNER, 'OPS_STAGING_PROCESSES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_STAGING4PIBICS_INTF' OWNER, 'OPS_SYNC_PROCESSES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_STAGING4PIBICS_INTF' OWNER, 'TRCD_BORDERPOST' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_STAGING4PIBICS_INTF' OWNER, 'TRCD_RANKCRW' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_USER_MANAGEMENT' OWNER, 'GRANTS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_USER_MANAGEMENT' OWNER, 'LOOKUPS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_USER_MANAGEMENT' OWNER, 'LOOKUPS\$I18N' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_USER_MANAGEMENT' OWNER, 'OBJECT_GRANT_REL' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_USER_MANAGEMENT' OWNER, 'OBJECT_PAGE_REL' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_USER_MANAGEMENT' OWNER, 'OBJECTS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_USER_MANAGEMENT' OWNER, 'PARAMETER_SETTINGS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_USER_MANAGEMENT' OWNER, 'ROLE_OBJECT_GRANT_REL' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_USER_MANAGEMENT' OWNER, 'ROLES' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_USER_MANAGEMENT' OWNER, 'USER_ROLE_REL' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_USER_MANAGEMENT' OWNER, 'USERS' TABLE_NAME FROM DUAL UNION ALL
            SELECT 'DL_USER_MANAGEMENT' OWNER, 'USERS\$SGD' TABLE_NAME FROM DUAL
        )
        SELECT DISTINCT
            SUB.OWNER,
            SUB.TABLE_NAME,
            SUB.DISABLE_STMT,
            SUB.ENABLE_STMT
        FROM
            (
            SELECT 
                TBL.OWNER,
                TBL.TABLE_NAME,
                'ALTER TRIGGER ' || TRG.OWNER || '.' || TRG.TRIGGER_NAME || ' DISABLE;' DISABLE_STMT,
                'ALTER TRIGGER ' || TRG.OWNER || '.' || TRG.TRIGGER_NAME || ' ENABLE;' ENABLE_STMT
            FROM 
                DBA_TRIGGERS TRG
                INNER JOIN TABLES TBL ON (TRG.TABLE_OWNER = TBL.OWNER AND TRG.TABLE_NAME = TBL.TABLE_NAME)
            WHERE
                TRG.STATUS = 'ENABLED'
            UNION ALL
            SELECT
                T.OWNER,
                T.TABLE_NAME,
                'ALTER TABLE ' || C1.OWNER || '.' || C1.TABLE_NAME || ' DISABLE CONSTRAINT ' || C1.CONSTRAINT_NAME || ';' DISABLE_STMT,
                'ALTER TABLE ' || C1.OWNER || '.' || C1.TABLE_NAME || ' ENABLE CONSTRAINT ' || C1.CONSTRAINT_NAME || ';' ENABLE_STMT
            FROM 
                DBA_CONSTRAINTS C1,
                DBA_CONSTRAINTS C2,
                DBA_INDEXES I,
                TABLES T
            WHERE
                C1.CONSTRAINT_TYPE = 'R'
                AND C1.STATUS = 'ENABLED'
                AND C1.R_OWNER = C2.OWNER
                AND C1.R_CONSTRAINT_NAME = C2.CONSTRAINT_NAME
                AND C2.INDEX_OWNER = I.OWNER
                AND C2.INDEX_NAME = I.INDEX_NAME
                AND I.TABLE_OWNER = T.OWNER
                AND I.TABLE_NAME = T.TABLE_NAME
            UNION ALL
            SELECT 
                T.OWNER,
                T.TABLE_NAME,
                NULL DISABLE_STMT,
                NULL ENABLE_STMT       
            FROM
                TABLES T
            )SUB
        ORDER BY OWNER, TABLE_NAME, DISABLE_STMT;
begin
    for l_rec in c_dict loop
        if l_rec.DISABLE_STMT is not null then
            l_disable(l_disable.count + 1).STMT := l_rec.DISABLE_STMT;
        end if;
        if l_rec.OWNER != l_owner or l_rec.TABLE_NAME != l_table_name or l_owner is null or l_table_name is null then
            l_insert(l_insert.count + 1).STMT := 'TRUNCATE TABLE '|| l_rec.OWNER || '.' || l_rec.TABLE_NAME || ';';
            l_insert(l_insert.count + 1).STMT := 'SELECT ''@./LOOKUPS/' || l_rec.OWNER || '-' || l_rec.TABLE_NAME || '.sql'' F FROM DUAL;';
            l_insert(l_insert.count + 1).STMT := '@./LOOKUPS/' || l_rec.OWNER || '-' || l_rec.TABLE_NAME || '.sql';
            l_insert(l_insert.count + 1).STMT := 'COMMIT;';
            l_owner := l_rec.OWNER;
            l_table_name := l_rec.TABLE_NAME;
        end if;
        if l_rec.ENABLE_STMT is not null then
            l_enable(l_enable.count + 1).STMT := l_rec.ENABLE_STMT;
        end if;
    end loop;
   
    dbms_output.put_line('SET DEFINE OFF;'); 
    dbms_output.put_line('SET HEADING OFF;');
    dbms_output.put_line('SET LINESIZE 32767;');
    dbms_output.put_line('SET PAGESIZE 0;');
    dbms_output.put_line('SET TRIMOUT ON;');
    dbms_output.put_line('SET ESCCHAR $;');
    dbms_output.put_line('--DISABLE');
    for l_disable_idx in 1 .. l_disable.count loop
        dbms_output.put_line(l_disable(l_disable_idx).STMT);
    end loop;
    dbms_output.put_line('--INSERT');
    for l_insert_idx in 1 .. l_insert.count loop
        dbms_output.put_line(l_insert(l_insert_idx).STMT);
    end loop;
    dbms_output.put_line('--ENABLE');
    for l_enable_idx in 1 .. l_enable.count loop
        dbms_output.put_line(l_enable(l_enable_idx).STMT);
    end loop;    
    
    --refresh materialized_views
    dbms_output.put_line('declare');
    dbms_output.put_line('  l_number_of_failures BINARY_INTEGER;');
    dbms_output.put_line('begin');
    dbms_output.put_line('  DBMS_MVIEW.REFRESH_ALL_MVIEWS (l_number_of_failures, NULL, NULL, true, false, false);');
    dbms_output.put_line('end;');
    dbms_output.put_line('/');    
    
    dbms_output.put_line('quit'); 
end;
/
EOF
}

function makeInstallScript {
    FUNCDEBUG "${FUNCNAME[0]} $@" && return
    sqlplus -S / as sysdba <<-'EOF' | sed 's/\s*$//g' > "$EXPORTDIR/install_by_dependencies.sql"
    set pages 0 lin 17000;
    SET SERVEROUTPUT ON;
    SET FEED OFF;

declare
    type r_obj  is record (OWNER DBA_OBJECTS.OWNER%type, OBJECT_NAME DBA_OBJECTS.OBJECT_NAME%type, OBJECT_TYPE DBA_OBJECTS.OBJECT_TYPE%type,
                           STMT varchar2(4000), DONE NUMBER(1));
    type r_dep  is record (OWNER DBA_OBJECTS.OWNER%type, OBJECT_NAME DBA_OBJECTS.OBJECT_NAME%type, OBJECT_TYPE DBA_OBJECTS.OBJECT_TYPE%type,
                           REF_OWNER DBA_OBJECTS.OWNER%type, REF_OBJECT_NAME DBA_OBJECTS.OBJECT_NAME%type, REF_OBJECT_TYPE DBA_OBJECTS.OBJECT_TYPE%type);
    type r_ddl  is record (STMT VARCHAR2(4000));

    type t_ddl  is table of r_ddl index by pls_integer;
    type t_obj  is table of r_obj index by varchar2(255);
    type t_dep  is table of r_dep index by pls_integer;
    
    l_proxies_ddl       t_ddl;
    l_quota_ddl         t_ddl;
    l_profiles_ddl      t_ddl;
    l_contexts_ddl      t_ddl;
    l_ext_grants_ddl    t_ddl;
    l_roles_ddl         t_ddl;
    l_sys_privs_ddl     t_ddl;
    l_role_privs_ddl    t_ddl;
    l_obj               t_obj;
    l_dep               t_dep;
    l_obj_dep           t_dep;
    l_ddl               t_ddl;
    l_query             t_ddl;
    l_idx               number;
    l_obj_id            varchar2(92);
    l_previous_schema   varchar2(30);
    l_added_cnt         number := 0;
    l_added_total       number := 0;
    l_max_loops         number := 15;
    
    cursor c_dict is
        WITH 
        OWNERS AS (
            SELECT 'DL_COMMON'                  AS OWNER FROM DUAL UNION ALL
            SELECT 'LOGGER'                     AS OWNER FROM DUAL UNION ALL
            SELECT 'DL_DBA'                     AS OWNER FROM DUAL UNION ALL
            SELECT 'DL_USER_MANAGEMENT'         AS OWNER FROM DUAL UNION ALL
            SELECT 'APEX_USER_MANAGEMENT'       AS OWNER FROM DUAL UNION ALL
            SELECT 'USER_MANAGEMENT'            AS OWNER FROM DUAL UNION ALL   
            SELECT 'DL_BIOSTORE_BLACKLIST'      AS OWNER FROM DUAL UNION ALL
            SELECT 'DL_BIOSTORE_MOVEMENTS'      AS OWNER FROM DUAL UNION ALL
            SELECT 'DL_BORDERCONTROL'           AS OWNER FROM DUAL UNION ALL
            SELECT 'DL_BLACKLIST'               AS OWNER FROM DUAL UNION ALL
            SELECT 'DL_BORDERCONTROL_DATAMART'  AS OWNER FROM DUAL UNION ALL
            SELECT 'DL_STAGING4PIBICS'          AS OWNER FROM DUAL UNION ALL
            SELECT 'DL_STAGING4PIBICS_INTF'     AS OWNER FROM DUAL UNION ALL
            SELECT 'DL_INTERFACE'               AS OWNER FROM DUAL UNION ALL
            SELECT 'PIBICSDM2_RO'               AS OWNER FROM DUAL UNION ALL
            SELECT 'PIBICSDM2'                  AS OWNER FROM DUAL UNION ALL
            SELECT 'BIO_BD'                     AS OWNER FROM DUAL UNION ALL
            SELECT 'SERVAPP'                    AS OWNER FROM DUAL UNION ALL
            SELECT 'JASPER_REPORTING'           AS OWNER FROM DUAL UNION ALL
            SELECT 'DL_MAINTENANCE'             AS OWNER FROM DUAL UNION ALL
            SELECT 'DL_STAGING'                 AS OWNER FROM DUAL
        ),
        FOLDER_NAMES AS (
            SELECT 'DATABASE LINK'          AS OBJECT_TYPE,  'database_links'       AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'FUNCTION'               AS OBJECT_TYPE,  'functions'            AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'JOB'                    AS OBJECT_TYPE,  'jobs'                 AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'MATERIALIZED VIEW'      AS OBJECT_TYPE,  'materialized_views'   AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'PACKAGE'                AS OBJECT_TYPE,  'packages'             AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'PACKAGE BODY'           AS OBJECT_TYPE,  'package_bodies'       AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'PROCEDURE'              AS OBJECT_TYPE,  'procedures'           AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'SCHEDULE'               AS OBJECT_TYPE,  'schedules'            AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'SYNONYM'                AS OBJECT_TYPE,  'synonyms'             AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'TABLE'                  AS OBJECT_TYPE,  'tables'               AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'TRIGGER'                AS OBJECT_TYPE,  'triggers'             AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'TYPE'                   AS OBJECT_TYPE,  'types'                AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'TYPE BODY'              AS OBJECT_TYPE,  'type_bodies'          AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'VIEW'                   AS OBJECT_TYPE,  'views'                AS FOLDER_NAME FROM DUAL    
        ),
        FILE_ENDINGS AS (
            SELECT 'PACKAGE BODY'           AS OBJECT_TYPE,  'pkb'                  AS FILE_ENDING FROM DUAL UNION ALL
            SELECT 'PACKAGE'                AS OBJECT_TYPE,  'pks'                  AS FILE_ENDING FROM DUAL UNION ALL
            SELECT 'TYPE BODY'              AS OBJECT_TYPE,  'tpb'                  AS FILE_ENDING FROM DUAL UNION ALL
            SELECT 'TYPE'                   AS OBJECT_TYPE,  'tps'                  AS FILE_ENDING FROM DUAL UNION ALL
            SELECT 'PROCEDURE'              AS OBJECT_TYPE,  'prc'                  AS FILE_ENDING FROM DUAL UNION ALL
            SELECT 'TRIGGER'                AS OBJECT_TYPE,  'trg'                  AS FILE_ENDING FROM DUAL UNION ALL
            SELECT 'VIEW'                   AS OBJECT_TYPE,  'vw'                   AS FILE_ENDING FROM DUAL UNION ALL
            SELECT 'FUNCTION'               AS OBJECT_TYPE,  'fnc'                  AS FILE_ENDING FROM DUAL
        ),
        PROXIES AS (
            SELECT 
                'ALTER USER ' || P.CLIENT || ' GRANT CONNECT THROUGH ' || P.PROXY || ';' STMT
            FROM 
                PROXY_USERS P
            WHERE 
                P.CLIENT IN (SELECT OWNER FROM OWNERS)
        ),        
        PROFILES AS (
            SELECT DISTINCT 
                'CREATE PROFILE ' || PROFILE || ' LIMIT ' || chr(10) || LISTAGG((RESOURCE_NAME || ' ' || LIMIT), chr(10)) 
                WITHIN GROUP (ORDER BY RESOURCE_NAME) OVER (PARTITION BY PROFILE) || ';' STMT
            FROM 
                DBA_PROFILES 
            WHERE 
                PROFILE IN (SELECT DISTINCT PROFILE FROM DBA_USERS WHERE USERNAME IN (SELECT OWNER FROM OWNERS))
                AND PROFILE != 'DEFAULT'
        ),
        QUOTAS AS (
            SELECT 
                'ALTER USER ' || Q.USERNAME || ' QUOTA ' ||
                CASE WHEN Q.MAX_BYTES = -1 THEN 'UNLIMITED' ELSE to_char(Q.MAX_BYTES)
                END || ' ON ' || Q.TABLESPACE_NAME || ';' STMT
            FROM 
                DBA_TS_QUOTAS Q
            WHERE 
                Q.USERNAME IN (SELECT OWNER FROM OWNERS)
        ),
        CONTEXTS AS (
            SELECT 
                'ALTER SESSION SET CURRENT_SCHEMA=' || C.SCHEMA || ';' || chr(10) ||
                'CREATE CONTEXT ' || NAMESPACE || ' USING ' ||
                PACKAGE || ' ' || CASE WHEN TYPE = 'ACCESSED GLOBALLY' THEN TYPE END || ';' STMT
            FROM 
                DBA_CONTEXT C
            WHERE 
                C.SCHEMA IN (SELECT OWNER FROM OWNERS)
        ),
        ROLES AS (
            SELECT 'CREATE ROLE ' || ROLE || ';' STMT FROM DBA_ROLES WHERE AUTHENTICATION_TYPE = 'NONE'
        ),
        SYS_PRIVS AS (
            SELECT 'GRANT ' || PRIVILEGE || ' TO ' || GRANTEE || 
            CASE WHEN ADMIN_OPTION = 'YES' THEN ' WITH ADMIN OPTION' END || 
            ';' STMT
            FROM 
                DBA_SYS_PRIVS P 
        ),
        ROLE_PRIVS AS (
            SELECT 'GRANT ' || GRANTED_ROLE || ' TO ' || GRANTEE || 
            CASE WHEN ADMIN_OPTION = 'YES' THEN ' WITH ADMIN OPTION' END || 
            CASE WHEN DELEGATE_OPTION = 'YES' THEN ' WITH DELEGATE OPTION' END || 
            ';' STMT
            FROM 
                DBA_ROLE_PRIVS P
            WHERE
                INHERITED = 'NO'        
        ),
        OBJECT_TYPES AS (
            SELECT 'PACKAGE'            AS OBJECT_TYPE FROM DUAL UNION ALL
            SELECT 'PACKAGE BODY'       AS OBJECT_TYPE FROM DUAL UNION ALL
            SELECT 'PROCEDURE'          AS OBJECT_TYPE FROM DUAL UNION ALL
            SELECT 'MATERIALIZED VIEW'  AS OBJECT_TYPE FROM DUAL UNION ALL
            SELECT 'SYNONYM'            AS OBJECT_TYPE FROM DUAL UNION ALL
            SELECT 'TYPE'               AS OBJECT_TYPE FROM DUAL UNION ALL
            SELECT 'TYPE BODY'          AS OBJECT_TYPE FROM DUAL UNION ALL            
            SELECT 'FUNCTION'           AS OBJECT_TYPE FROM DUAL UNION ALL
            SELECT 'TRIGGER'            AS OBJECT_TYPE FROM DUAL UNION ALL
            SELECT 'TABLE'              AS OBJECT_TYPE FROM DUAL UNION ALL
            SELECT 'VIEW'               AS OBJECT_TYPE FROM DUAL
        ),
        OBJECTS AS (
            SELECT DISTINCT
                O.OWNER, 
                O.OBJECT_NAME,
                CASE 
                    WHEN MIN(O.OBJECT_TYPE) OVER (PARTITION BY O.OWNER, O.OBJECT_NAME) = 'MATERIALIZED VIEW'
                    THEN 'TABLE'
                    ELSE O.OBJECT_TYPE
                END OBJECT_TYPE,
                CASE 
                    WHEN MIN(O.OBJECT_TYPE) OVER (PARTITION BY O.OWNER, O.OBJECT_NAME) = 'MATERIALIZED VIEW'
                    THEN 'MATERIALIZED VIEW'
                    ELSE O.OBJECT_TYPE
                END DEPLOY_OBJECT_TYPE              
            FROM
                DBA_OBJECTS O
            WHERE
                O.OBJECT_NAME NOT LIKE 'BIN$%'
                AND O.OWNER IN (SELECT OWNER FROM OWNERS)
                AND O.OBJECT_TYPE IN (SELECT OBJECT_TYPE FROM OBJECT_TYPES)
        ),
        SYNONYMS AS (
            SELECT DISTINCT
                S.OWNER, 
                S.SYNONYM_NAME, 
                S.TABLE_OWNER, 
                S.TABLE_NAME
            FROM
                DBA_SYNONYMS S 
            WHERE        
            (S.TABLE_OWNER IN (SELECT OWNER FROM OWNERS) OR S.TABLE_OWNER = 'PUBLIC')
            AND S.DB_LINK IS NULL
        ),
        RELEVANT_PUBLIC_SYNONYMS AS (
            SELECT 
                Q.OWNER,
                Q.SYNONYM_NAME,
                Q.TABLE_OWNER,
                Q.TABLE_NAME,
                'DROP PUBLIC SYNONYM ' || Q.SYNONYM_NAME || ';' || chr(10) ||
                'CREATE PUBLIC SYNONYM ' || Q.SYNONYM_NAME || ' FOR ' || Q.TABLE_OWNER || '.' || Q.TABLE_NAME || ';' STMT
            FROM 
                (
                SELECT DISTINCT
                    S.OWNER,
                    S.SYNONYM_NAME,
                    S.TABLE_OWNER,
                    S.TABLE_NAME
                FROM
                    SYNONYMS S 
                WHERE     
                    CONNECT_BY_ROOT S.TABLE_OWNER IN (SELECT OWNER FROM OWNERS)
                    OR CONNECT_BY_ROOT S.TABLE_OWNER = 'PUBLIC'
                CONNECT BY S.TABLE_OWNER = PRIOR S.OWNER
                       AND S.TABLE_NAME = PRIOR S.SYNONYM_NAME
                )Q
            WHERE
                Q.OWNER = 'PUBLIC'
        ),
        DEPENDENCIES AS (
            SELECT 
                D.OWNER,
                D.NAME,
                D.TYPE, 
                D.REFERENCED_OWNER, 
                D.REFERENCED_NAME, 
                coalesce(O.DEPLOY_OBJECT_TYPE, D.REFERENCED_TYPE) REFERENCED_TYPE
            FROM 
                DBA_DEPENDENCIES D
                LEFT JOIN OBJECTS O ON (D.REFERENCED_OWNER = O.OWNER 
                                        AND D.REFERENCED_NAME = O.OBJECT_NAME
                                        AND (D.REFERENCED_TYPE = O.OBJECT_TYPE))
            WHERE 
                (
                 (D.REFERENCED_OWNER, D.REFERENCED_NAME, D.REFERENCED_TYPE) IN (SELECT OWNER, OBJECT_NAME, OBJECT_TYPE FROM OBJECTS)
                  OR (D.REFERENCED_OWNER, D.REFERENCED_NAME, D.REFERENCED_TYPE) IN (SELECT OWNER, OBJECT_NAME, DEPLOY_OBJECT_TYPE FROM OBJECTS)
                  OR (D.REFERENCED_OWNER, D.REFERENCED_NAME, D.REFERENCED_TYPE) IN (SELECT OWNER, SYNONYM_NAME, 'SYNONYM' FROM RELEVANT_PUBLIC_SYNONYMS)
                ) 
                AND
                (
                 (D.OWNER, D.NAME, D.TYPE) IN (SELECT OWNER, OBJECT_NAME, OBJECT_TYPE FROM OBJECTS)
                  OR (D.OWNER, D.NAME, D.TYPE) IN (SELECT OWNER, OBJECT_NAME, DEPLOY_OBJECT_TYPE FROM OBJECTS)
                  OR (D.OWNER, D.NAME, D.TYPE) IN (SELECT OWNER, SYNONYM_NAME, 'SYNONYM' FROM RELEVANT_PUBLIC_SYNONYMS)
                )
                AND NOT
                (
                 D.OWNER = D.REFERENCED_OWNER AND D.NAME = D.REFERENCED_NAME AND D.TYPE = 'MATERIALIZED VIEW'
                )
        ),
        EXT_GRANTS AS (
            SELECT 'GRANT ' || LISTAGG(PRIVILEGE, ', ') WITHIN GROUP (ORDER BY PRIVILEGE) OVER (PARTITION BY P.GRANTEE, P.OWNER, P.TABLE_NAME, P.GRANTOR) ||
                   ' ON ' || P.OWNER || '.' || P.TABLE_NAME || ' TO ' || GRANTEE ||
                   CASE WHEN P.GRANTABLE = 'YES' THEN ' WITH GRANT OPTION' END || ';' STMT
            FROM 
                DBA_TAB_PRIVS P
            WHERE 
                GRANTEE IN (SELECT OWNER FROM OWNERS)
                AND OWNER NOT IN (SELECT OWNER FROM OWNERS)
                AND NOT (GRANTOR IN ('SYS', 'SYSTEM') AND TABLE_NAME IN ('SYS', 'SYSTEM') AND PRIVILEGE = 'INHERIT PRIVILEGES')
        ),
        INT_GRANTS AS (
            SELECT 
                SUB.OWNER, 
                SUB.TABLE_NAME OBJECT_NAME, 
                SUB.TYPE OBJECT_TYPE,
                LISTAGG(SUB.STMT, chr(10)) WITHIN GROUP (ORDER BY NULL) STMT
            FROM
                (
                    SELECT DISTINCT P.OWNER, P.TABLE_NAME, P.TYPE, 
                           'GRANT ' || LISTAGG(PRIVILEGE, ', ') WITHIN GROUP (ORDER BY PRIVILEGE) OVER (PARTITION BY P.GRANTEE, P.OWNER, P.TABLE_NAME, P.GRANTOR) ||
                           ' ON ' || P.OWNER || '.' || P.TABLE_NAME || ' TO ' || GRANTEE ||
                            CASE WHEN P.GRANTABLE = 'YES' THEN ' WITH GRANT OPTION' END || ';' STMT
                    FROM DBA_TAB_PRIVS P
                    WHERE (GRANTEE IN (SELECT OWNER FROM OWNERS) OR GRANTEE = 'PUBLIC')
                    AND OWNER IN (SELECT OWNER FROM OWNERS)
                )SUB
            GROUP BY 
                SUB.OWNER, 
                SUB.TABLE_NAME, 
                SUB.TYPE
        )
        SELECT SRC, OWNER, OBJECT_NAME, OBJECT_TYPE, REF_OWNER, REF_OBJECT_NAME, REF_OBJECT_TYPE, STMT FROM
            (
            SELECT 
                'PROXIES' AS SRC,
                CAST (NULL AS VARCHAR2(30)) OWNER,
                CAST (NULL AS VARCHAR2(30)) OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) OBJECT_TYPE,
                CAST (NULL AS VARCHAR2(30)) REF_OWNER,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_TYPE,
                STMT
            FROM 
                PROXIES 
            UNION ALL            
            SELECT 
                'QUOTAS' AS SRC,
                CAST (NULL AS VARCHAR2(30)) OWNER,
                CAST (NULL AS VARCHAR2(30)) OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) OBJECT_TYPE,
                CAST (NULL AS VARCHAR2(30)) REF_OWNER,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_TYPE,
                STMT
            FROM 
                QUOTAS 
            UNION ALL
            SELECT
                'ROLES' AS SRC,
                CAST (NULL AS VARCHAR2(30)) OWNER,
                CAST (NULL AS VARCHAR2(30)) OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) OBJECT_TYPE,
                CAST (NULL AS VARCHAR2(30)) REF_OWNER,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_TYPE,
                STMT    
            FROM 
                ROLES                 
            UNION ALL
            SELECT
                'CONTEXTS' AS SRC,
                CAST (NULL AS VARCHAR2(30)) OWNER,
                CAST (NULL AS VARCHAR2(30)) OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) OBJECT_TYPE,
                CAST (NULL AS VARCHAR2(30)) REF_OWNER,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_TYPE,
                STMT    
            FROM 
                CONTEXTS                 
            UNION ALL            
            SELECT
                'SYS PRIVS' AS SRC,
                CAST (NULL AS VARCHAR2(30)) OWNER,
                CAST (NULL AS VARCHAR2(30)) OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) OBJECT_TYPE,
                CAST (NULL AS VARCHAR2(30)) REF_OWNER,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_TYPE,
                STMT    
            FROM 
                SYS_PRIVS                 
            UNION ALL
            SELECT
                'ROLE PRIVS' AS SRC,
                CAST (NULL AS VARCHAR2(30)) OWNER,
                CAST (NULL AS VARCHAR2(30)) OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) OBJECT_TYPE,
                CAST (NULL AS VARCHAR2(30)) REF_OWNER,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_TYPE,
                STMT    
            FROM 
                ROLE_PRIVS                
            UNION ALL
            SELECT
                'PROFILES' AS SRC,
                CAST (NULL AS VARCHAR2(30)) OWNER,
                CAST (NULL AS VARCHAR2(30)) OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) OBJECT_TYPE,
                CAST (NULL AS VARCHAR2(30)) REF_OWNER,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_TYPE,
                STMT    
            FROM 
                PROFILES 
            UNION ALL
            SELECT
                'EXTERNAL GRANTS' AS SRC,
                CAST (NULL AS VARCHAR2(30)) OWNER,
                CAST (NULL AS VARCHAR2(30)) OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) OBJECT_TYPE,
                CAST (NULL AS VARCHAR2(30)) REF_OWNER,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_TYPE,
                STMT      
            FROM
                EXT_GRANTS
            UNION ALL    
            SELECT
                'OBJECTS' AS SRC,
                O.OWNER,
                O.OBJECT_NAME,
                O.DEPLOY_OBJECT_TYPE OBJECT_TYPE,
                CAST (NULL AS VARCHAR2(30)) REF_OWNER,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_TYPE,
                '@./' || O.OWNER || '/' ||
                coalesce(FO.FOLDER_NAME,'unknown') || '/' ||
                lower(O.OBJECT_NAME) || '.' ||
                coalesce(FI.FILE_ENDING,'sql') ||
                CASE WHEN GR.OWNER IS NOT NULL THEN chr(10) END ||
                GR.STMT STMT
            FROM 
                OBJECTS O
                LEFT JOIN FOLDER_NAMES FO ON (O.DEPLOY_OBJECT_TYPE = FO.OBJECT_TYPE)
                LEFT JOIN FILE_ENDINGS FI ON (O.DEPLOY_OBJECT_TYPE = FI.OBJECT_TYPE)
                LEFT JOIN INT_GRANTS GR ON (O.OWNER = GR.OWNER AND O.OBJECT_NAME = GR.OBJECT_NAME AND O.OBJECT_TYPE = GR.OBJECT_TYPE)
            UNION ALL
            SELECT
                'PUBLIC SYNONYMS' AS SRC,
                S.OWNER,
                S.SYNONYM_NAME OBJECT_NAME,
                'SYNONYM' OBJECT_TYPE,
                CAST (NULL AS VARCHAR2(30)) REF_OWNER,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_TYPE,
                S.STMT
            FROM
                RELEVANT_PUBLIC_SYNONYMS S
            UNION ALL
            SELECT
                'DEPENDENCIES' AS SRC,
                OWNER,
                NAME OBJECT_NAME,
                TYPE OBJECT_TYPE, 
                REFERENCED_OWNER, 
                REFERENCED_NAME, 
                REFERENCED_TYPE,
                CAST (NULL AS VARCHAR2(4000))STMT      
            FROM
                DEPENDENCIES
            )
        ORDER BY SRC, OWNER, OBJECT_NAME, OBJECT_TYPE;
            
    function hasUnresolvedDependency (i_OWNER in DBA_OBJECTS.OWNER%type, i_OBJECT_NAME in DBA_OBJECTS.OBJECT_NAME%type,
                                      i_OBJECT_TYPE in DBA_OBJECTS.OBJECT_TYPE%type) return boolean
    is
        l_obj_id            varchar2(92);
    begin
        for l_dep_idx in 1 .. l_dep.count
        loop
            if i_OWNER = l_dep(l_dep_idx).OWNER and i_OBJECT_NAME = l_dep(l_dep_idx).OBJECT_NAME 
               and i_OBJECT_TYPE = l_dep(l_dep_idx).OBJECT_TYPE then
                l_obj_id := l_dep(l_dep_idx).REF_OWNER || '.' || l_dep(l_dep_idx).REF_OBJECT_NAME || '.' || l_dep(l_dep_idx).REF_OBJECT_TYPE;
                if l_obj.exists(l_obj_id) then
                    if l_obj(l_obj_id).DONE = 0 then
                        return true;
                    end if;
                else
                    return true;
                end if;
            end if;            
        end loop;
        return false;
    end;            

    function unresolvedDependencies (i_OWNER in DBA_OBJECTS.OWNER%type, i_OBJECT_NAME in DBA_OBJECTS.OBJECT_NAME%type,
                                     i_OBJECT_TYPE in DBA_OBJECTS.OBJECT_TYPE%type) return t_dep
    is
        l_obj_id            varchar2(92);
        l_obj_dep t_dep;
    begin
        for l_dep_idx in 1 .. l_dep.count
        loop
            if i_OWNER = l_dep(l_dep_idx).OWNER and i_OBJECT_NAME = l_dep(l_dep_idx).OBJECT_NAME 
               and i_OBJECT_TYPE = l_dep(l_dep_idx).OBJECT_TYPE then
                l_obj_id := l_dep(l_dep_idx).REF_OWNER || '.' || l_dep(l_dep_idx).REF_OBJECT_NAME || '.' || l_dep(l_dep_idx).REF_OBJECT_TYPE;
                if l_obj.exists(l_obj_id) then
                    if l_obj(l_obj_id).DONE = 0 then
                        l_obj_dep(l_obj_dep.count + 1) := l_dep(l_dep_idx);
                    end if;
                else
                    l_obj_dep(l_obj_dep.count + 1) := l_dep(l_dep_idx);
                end if;
            end if;            
        end loop;
        return l_obj_dep;
    end;     
    
begin
    --fetch information from data dictionary
    for l_rec in c_dict loop
        case     
            when l_rec.SRC = 'PROXIES' then
                l_idx := l_proxies_ddl.count + 1;
                l_proxies_ddl(l_idx).STMT := l_rec.STMT;
            when l_rec.SRC = 'QUOTAS' then
                l_idx := l_quota_ddl.count + 1;
                l_quota_ddl(l_idx).STMT := l_rec.STMT;
            when l_rec.SRC = 'ROLES' then 
                l_idx := l_roles_ddl.count + 1;
            when l_rec.SRC = 'CONTEXTS' then 
                l_idx := l_contexts_ddl.count + 1;                
                l_contexts_ddl(l_idx).STMT := l_rec.STMT;
            when l_rec.SRC = 'SYS PRIVS' then 
                l_idx := l_sys_privs_ddl.count + 1;
                l_sys_privs_ddl(l_idx).STMT := l_rec.STMT;                
            when l_rec.SRC = 'ROLE PRIVS' then 
                l_idx := l_role_privs_ddl.count + 1;
                l_role_privs_ddl(l_idx).STMT := l_rec.STMT;                    
            when l_rec.SRC = 'PROFILES' then 
                l_idx := l_profiles_ddl.count + 1;
                l_profiles_ddl(l_idx).STMT := l_rec.STMT;
            when l_rec.SRC = 'EXTERNAL GRANTS' then
                l_idx := l_ext_grants_ddl.count + 1;
                l_ext_grants_ddl(l_idx).STMT := l_rec.STMT;
            when l_rec.SRC IN ('OBJECTS', 'PUBLIC SYNONYMS') then
                l_obj_id := l_rec.OWNER || '.' || l_rec.OBJECT_NAME || '.' || l_rec.OBJECT_TYPE;
                l_obj(l_obj_id).OWNER := l_rec.OWNER;
                l_obj(l_obj_id).OBJECT_NAME := l_rec.OBJECT_NAME;
                l_obj(l_obj_id).OBJECT_TYPE := l_rec.OBJECT_TYPE;
                l_obj(l_obj_id).STMT := l_rec.STMT;
                l_obj(l_obj_id).DONE := 0;
            when l_rec.SRC = 'DEPENDENCIES' then
                l_idx := l_dep.count + 1;
                l_dep(l_idx).OWNER := l_rec.OWNER;
                l_dep(l_idx).OBJECT_NAME := l_rec.OBJECT_NAME;
                l_dep(l_idx).OBJECT_TYPE := l_rec.OBJECT_TYPE;
                l_dep(l_idx).REF_OWNER := l_rec.REF_OWNER;
                l_dep(l_idx).REF_OBJECT_NAME := l_rec.REF_OBJECT_NAME;
                l_dep(l_idx).REF_OBJECT_TYPE := l_rec.REF_OBJECT_TYPE;
        end case;
    end loop;
    
    --repeat loop over objects until all dependencies are resolved or unresolvable
    l_previous_schema := 'SYS';
    for l in 1 .. l_max_loops loop
        l_added_cnt := 0;
        l_obj_id := l_obj.first;
        while l_obj_id is not null loop
            if l_obj(l_obj_id).DONE = 0 then
                if not hasUnresolvedDependency (l_obj(l_obj_id).OWNER, l_obj(l_obj_id).OBJECT_NAME, l_obj(l_obj_id).OBJECT_TYPE) then
                    if l_obj(l_obj_id).OWNER != l_previous_schema then
                        l_ddl(l_ddl.count + 1).STMT := 'ALTER SESSION SET CURRENT_SCHEMA=' || l_obj(l_obj_id).OWNER || ';';
                        l_previous_schema := l_obj(l_obj_id).OWNER;
                    end if;
                    l_ddl(l_ddl.count + 1).STMT := l_obj(l_obj_id).STMT;
                    l_added_cnt := l_added_cnt + 1;
                    l_obj(l_obj_id).DONE := 1;
                end if;
            end if;
            l_obj_id := l_obj.next(l_obj_id);
        end loop;
        dbms_output.put_line('-- ' || to_char(l) || ': Add ' || to_char(l_added_cnt) || ' objects');
        l_added_total := l_added_total + l_added_cnt;
        if l_added_cnt = 0 then
            exit;
        end if;
    end loop;
    dbms_output.put_line('-- Resolved dependencies for ' || to_char(l_added_total) || ' / ' || to_char(l_obj.count) || ' objects');

    --list unresolved dependencies
    l_obj_id := l_obj.first;
    while l_obj_id is not null loop
        if l_obj(l_obj_id).DONE = 0 then    
            dbms_output.put_line('-- Could not resolve all dependencies for object ' || l_obj(l_obj_id).OWNER ||
                                 '.' || l_obj(l_obj_id).OBJECT_NAME || ' (' || l_obj(l_obj_id).OBJECT_TYPE || ')');
            l_obj_dep := unresolvedDependencies (i_OWNER => l_obj(l_obj_id).OWNER, i_OBJECT_NAME => l_obj(l_obj_id).OBJECT_NAME,
                                                 i_OBJECT_TYPE => l_obj(l_obj_id).OBJECT_TYPE);
            for l_idx in 1 .. l_obj_dep.count loop
                dbms_output.put_line('--     ' || l_obj_dep(l_idx).REF_OWNER || '.' || l_obj_dep(l_idx).REF_OBJECT_NAME ||
                                     ' (' || l_obj_dep(l_idx).REF_OBJECT_TYPE || ')');
            end loop;
        end if;
        l_obj_id := l_obj.next(l_obj_id);
    end loop;    
    
    dbms_output.put_line('SET DEFINE OFF;'); 
    dbms_output.put_line('SET HEADING OFF;');
    dbms_output.put_line('SET LINESIZE 32767;');
    dbms_output.put_line('SET PAGESIZE 0;');
    dbms_output.put_line('SET TRIMOUT ON;');
    --dbms_output.put_line('SET TERMOUT OFF;');
    dbms_output.put_line('SET ESCCHAR $;');
    
    --dbms_output.put_line('SPOOL install_by_dependencies.log;');

    --create profiles
    for l_profiles_ddl_idx in 1 .. l_profiles_ddl.count loop
        dbms_output.put_line(l_profiles_ddl(l_profiles_ddl_idx).STMT);
    end loop;        

    --create users
    dbms_output.put_line('@install-user.sql');
    dbms_output.put_line('@PIBICS/user/create_PIBICS.sql');

    --grant proxy connect
    for l_proxies_ddl_idx in 1 .. l_proxies_ddl.count loop
        dbms_output.put_line(l_proxies_ddl(l_proxies_ddl_idx).STMT);
    end loop;        
    
    --set quota
    for l_quota_ddl_idx in 1 .. l_quota_ddl.count loop
        dbms_output.put_line(l_quota_ddl(l_quota_ddl_idx).STMT);
    end loop;  
    
    --create roles
    for l_roles_ddl_idx in 1 .. l_roles_ddl.count loop
        dbms_output.put_line(l_roles_ddl(l_roles_ddl_idx).STMT);
    end loop;
    
    --create contexts
    for l_contexts_ddl_idx in 1 .. l_contexts_ddl.count loop
        dbms_output.put_line(l_contexts_ddl(l_contexts_ddl_idx).STMT);
    end loop;    
    dbms_output.put_line('ALTER SESSION SET CURRENT_SCHEMA=SYS;');
    
    --grant system privileges
    for l_sys_privs_ddl_idx in 1 .. l_sys_privs_ddl.count loop
        dbms_output.put_line(l_sys_privs_ddl(l_sys_privs_ddl_idx).STMT);
    end loop;       
    
    --grant role privileges
    for l_role_privs_ddl_idx in 1 .. l_role_privs_ddl.count loop
        dbms_output.put_line(l_role_privs_ddl(l_role_privs_ddl_idx).STMT);
    end loop;       
    
    --install sequences
    dbms_output.put_line('@install-sequences.sql');    

    --install db-links
    dbms_output.put_line('@install-db_links.sql');
    dbms_output.put_line('@install-public_db_links.sql');
    
    --create db-link to simulate PIBICS database_links
    dbms_output.put_line(
        'DECLARE ' ||
        '    v_exec VARCHAR2(4000); ' ||
        'BEGIN ' ||
            'SELECT ''CREATE PUBLIC DATABASE LINK PIBICS_PROD CONNECT TO PIBICS IDENTIFIED BY PIBICS USING ' ||
                    '''''(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=''||HOST_NAME||'')(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=''||INSTANCE_NAME||'')))'''''' ' ||
            'INTO v_exec '||
            'FROM v$instance; ' ||
            'EXECUTE IMMEDIATE v_exec; ' ||
        'END;' || chr(10) || '/'
        );

    --create PIBICS tables
    dbms_output.put_line('@PIBICS/tables/immigration.sql');
    dbms_output.put_line('@PIBICS/tables/immigrationhist.sql');
    dbms_output.put_line('@PIBICS/tables/tminout.sql');
    dbms_output.put_line('@PIBICS/tables/tminout_ma.sql');
    dbms_output.put_line('@PIBICS/tables/tmmain.sql');
    dbms_output.put_line('@PIBICS/tables/tm2.sql');
    
    --set grants from other schemas    
    for l_grn_ext_idx in 1 .. l_ext_grants_ddl.count loop
        dbms_output.put_line(l_ext_grants_ddl(l_grn_ext_idx).STMT);
    end loop;
    
    --deploy objects
    for l_ddl_idx in 1 .. l_ddl.count loop
        dbms_output.put_line('SELECT ' || l_ddl_idx || ' DDL# FROM DUAL;');
        dbms_output.put_line(l_ddl(l_ddl_idx).STMT);
    end loop;    
    
    --repeat table ddl to make sure all ref constraints will be installed
    dbms_output.put_line('@install-tables.sql');
    
    --install jobs and schedules
    dbms_output.put_line('@install-jobs.sql');
    dbms_output.put_line('@install-dbms_jobs.sql');
    dbms_output.put_line('@install-schedules.sql'); 
    
    --refresh materialized_views
    dbms_output.put_line('declare');
    dbms_output.put_line('  l_number_of_failures BINARY_INTEGER;');
    dbms_output.put_line('begin');
    dbms_output.put_line('  DBMS_MVIEW.REFRESH_ALL_MVIEWS (l_number_of_failures, NULL, NULL, true, false, false);');
    dbms_output.put_line('end;');
    dbms_output.put_line('/');
    
    
    dbms_output.put_line('quit'); 
   
end;
/
EOF
}


function zipArchive {
    tar -czf "$SCRIPTPATH/$(basename "$EXPORTDIR").tar.gz" "$EXPORTDIR"
}

###############################################################

while getopts "Dfld:s:x:corpwa:i:hzevk" opt; do
  case $opt in
    D)
        FUNCDEBUG="true"
        ;;
    f)
        exportCreateUser="exportCreateUser"
        exportObjects="exportObjects"
        exportRESTModules="exportRESTModules"
        exportExecutePriviligeSQLs="exportExecutePriviligeSQLs"
        exportWorkspace="exportWorkspace"
        exportStaticWSFiles="exportStaticWSFiles"
        exportAPEXApp="exportAPEXApp"
        createInstallDraft="createInstallDraft"
        makeInstallScript="makeInstallScript"
        getLookups="getLookups"
        zipArchive="zipArchive"
        ;;
    v)
        getLookups="getLookups"
        ;;
    k)
        makeInstallScript="makeInstallScript"
        ;;
    z)
        zipArchive="zipArchive"
        ;;
    l)
        DL_BORDERCONTROL_PROXY="TRUE"
        ;;
    d)
        EXPORTDIR="$OPTARG"
        ;;
    s)
        HOST_PORT_SERVICE="$OPTARG"
        ;;
    x)
        SYSTEMPASS="$OPTARG"
        ;;
    c)
        exportCreateUser="exportCreateUser"
        ;;
    o)
        exportObjects="exportObjects"
        ;;
    r)
        exportRESTModules="exportRESTModules"
        ;;
    p)
        exportExecutePriviligeSQLs="exportExecutePriviligeSQLs"
        ;;
    w)
        exportWorkspace="exportWorkspace"
        ;;
    e)
        exportStaticWSFiles="exportStaticWSFiles"
        ;;
    a)
        exportAPEXApp="exportAPEXApp"
        if [ "$OPTARG" != "-" ]; then
            APEXApps=$( echo "$OPTARG" | sed 's/,/\ /')
        fi
        ;;
    i)
        createInstallDraft="createInstallDraft"
        PREFIX="$OPTARG"
        ;;
    h)
        showUsage
        exit 1
        ;;
    \?)
        echo "Invalid option: -$OPTARG" >&2
        exit 1
        ;;
    :)
        echo "Option -$OPTARG requires an argument." >&2
        exit 1
        ;;
  esac
done

if [ $(whoami) != "oracle" ]; then
    echo "Must be executed as oracle user on the DB host (due to 'sqlplus / as sysdba' call)"
    exit 0
fi

#############
# log to file
LOGFILE=$(basename $0)-$(date +%F_%H%M%S).log
test -d "$EXPORTDIR" || mkdir -p "$EXPORTDIR"
exec > >(tee -a "$EXPORTDIR/$LOGFILE")
exec 2>&1
hostname -f
cat "$SCRIPTPATH/$(basename "$0")" >> "$EXPORTDIR/$LOGFILE"
echo "$@" >> "$EXPORTDIR/$LOGFILE"
############

$exportCreateUser
$exportObjects

if [ ! -z "$exportRESTModules" ]; then
    getModules | while read MODULE; do
        exportRESTModules "$MODULE"
    done
fi

$exportExecutePriviligeSQLs
$exportWorkspace
$exportStaticWSFiles
if [ ! -z "$exportAPEXApp" ]; then
    for APP in $APEXApps; do
        exportAPEXApp "$APP"
    done
fi
$createInstallDraft
$makeInstallScript
$getLookups

# There are some commonly spread grants that makes it impossible to diff sources. Use the following command to eliminate them before diff'ing:
# find . -type f -exec sed -i '/CREATE UNIQUE INDEX.*SYS_.*/d; /GRANT.*PIBICSDM2.*$/d; /GRANT.*APPSUP.*$/d; /GRANT.*TESTADM.*$/d; /GRANT.*TRAINEE.*$/d; /GRANT.*PIBICSAPP.*$/d; /GRANT.*DERMALOG_PROXY.*$/d; /GRANT.*SERVAPP.*$/d; /GRANT.*BIO_BD.*$/d;' "{}" \;

$zipArchive
