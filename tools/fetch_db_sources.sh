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
BORDERPOSTS
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
TERMINALS
X_VISARUN_RULES
EOFTABLES
}

function DL_BORDERCONTROL_DATAMART { #grepme
cat <<-'EOFTABLES'
EVENT_TYPES
EOFTABLES
}

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
OBJECT_PAGE_RELOBJECTS
OBJECTS
PARAMETER_SETTINGS
ROLE_OBJECT_GRANT_REL
ROLES
USER_ROLE_REL
USERS
USERS$SGD
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
    <property name="user" value="system" />
    <property name="password" value="$SYSTEMPASS" />
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
    while read TYPEPATH; do
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

    set timing on
    timing start TIMER_REST_EXPORT

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

    timing stop TIMER_REST_EXPORT
EOF

    REST_MODULES="$EXPORTDIR/DL_BORDERCONTROL"
    test -d "$REST_MODULES" || mkdir -p "$REST_MODULES"
    sed -i  's/\(^-- Schema: DL_BORDERCONTROL\)\(.*\)/\1 Date: removed for diff/' /tmp/restmodules-$VALIDFILENAME.sql
    mv /tmp/restmodules-$VALIDFILENAME.sql "$REST_MODULES/restmodules-$VALIDFILENAME.sql"
    [ -z "$DL_BORDERCONTROL_PROXY" ] || { removeProxyConnectDL_BORDERCONTROL; trap - EXIT ; }
}

function getLookups {
    LOOKUPS="$EXPORTDIR/LOOKUPS"
    test -d "$LOOKUPS" || mkdir -p "$LOOKUPS"
    grep "^function.*#grepme" "$SCRIPTPATH/$(basename "$0")" | cut -d ' ' -f2 | while read SCHEMA; do
        $SCHEMA | while read TABLE; do
        echo $SCHEMA.$TABLE
        sql -S / as SYSDBA <<EOF > $LOOKUPS/${SCHEMA}-${TABLE}.sql
SET SQLFORMAT INSERT
select * from $SCHEMA.$TABLE;
quit;
EOF
        done
    done
}

function zipArchive {
    tar -czf "$SCRIPTPATH/$(basename "$EXPORTDIR").tar.gz" "$EXPORTDIR"
}

###############################################################

while getopts "Dfld:s:x:corpwa:i:hzev" opt; do
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
        getLookups="getLookups"
        zipArchive="zipArchive"
        ;;
    v)
        getLookups="getLookups"
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
$getLookups

# There are some commonly spread grants that makes it impossible to diff sources. Use the following command to eliminate them before diff'ing:
# find . -type f -exec sed -i '/CREATE UNIQUE INDEX.*SYS_.*/d; /GRANT.*PIBICSDM2.*$/d; /GRANT.*APPSUP.*$/d; /GRANT.*TESTADM.*$/d; /GRANT.*TRAINEE.*$/d; /GRANT.*PIBICSAPP.*$/d; /GRANT.*DERMALOG_PROXY.*$/d; /GRANT.*SERVAPP.*$/d; /GRANT.*BIO_BD.*$/d;' "{}" \;

$zipArchive
