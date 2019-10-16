CREATE OR REPLACE EDITIONABLE TYPE BODY "DL_COMMON"."OT_DB_OWNER" is
  --
  -- *** STATICS ***
  --
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    15.02.2018  DL_COMMON.OT_DB_OWNER:Added
  *******************************************************************************/
  --
  static function Get_OBJECT_NAME return varchar2 deterministic is
  begin
    return $$plsql_unit_owner || '.' || $$plsql_unit;
  end;
  --
  static function Get_OBJECT_COPYRIGHT return varchar2 deterministic is
  begin
    return 'Copyright: DERMALOG Identification Systems GmbH, Hamburg - Germany, 2013-' || standard.to_char(sysdate
                                                                                                          ,'yyyy');
  end;
  --
  static function Get_OBJECT_VERSION$VC return varchar2 deterministic is
    --v_OT_VERSION OT_VERSION;
  begin
    --
    Raise_application_error(-20000
                           ,'Not implemented, yet!');
    return null;
    --
    /*
    --
    -- !!! INCREMENT THIS VERSIONS ON EACH CHANGE INSIDE THE DB-OBJECT !!!
    --
    v_OT_VERSION := OT_VERSION(Title  => null
                              ,Remark => null
                              ,Major  => 1
                              ,Minor  => 0
                              ,Patch  => 0
                               --
                               );
    --
    --
    return v_OT_VERSION.to_String();
    --
    */
    --
  end;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    15.02.2018  XX:Added
  *******************************************************************************/
  --
  static function Construct(p_OBJ_TYPE          in varchar2
                           ,p_OBJ_OWNER         in varchar2
                           ,p_Is_Case_Sensitive in pls_integer default 0
                            --
                            ) return OT_DB_OWNER is
    --
    v_Result OT_DB_OWNER;
    --
  begin
    v_Result := new OT_DB_OWNER(null);
    v_Result.Initialize(p_OBJ_TYPE
                       ,p_OBJ_OWNER
                       ,p_Is_Case_Sensitive);
    return v_Result;
  end Construct;
  --
  static function Construct(p_OBJ_OWNER         in varchar2
                           ,p_Is_Case_Sensitive in pls_integer default 0
                            --
                            ) return OT_DB_OWNER is
  begin
    return Construct(null
                    ,p_OBJ_OWNER
                    ,p_Is_Case_Sensitive);
  end Construct;
  --
  -- *** CONSTRUCTORS ***
  --
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    08.02.2018  XX:Added
  *******************************************************************************/
  --
  constructor function OT_DB_OWNER(self      in out nocopy OT_DB_OWNER
                                  ,OBJ_TYPE  in varchar2
                                  ,OBJ_OWNER in varchar2
                                   --
                                   ) return self as result is
  begin
    --
    self.Initialize(OBJ_TYPE
                   ,OBJ_OWNER);
    --
    return;
    --
  end OT_DB_OWNER;
  --
  constructor function OT_DB_OWNER(self        in out nocopy OT_DB_OWNER
                                  ,p_OBJ_OWNER in varchar2
                                   --
                                   ) return self as result is
  begin
    --
    self.Initialize(p_OBJ_OWNER);
    --
    return;
    --
  end OT_DB_OWNER;
  --
  -- *** FINAL MEMBERS ***
  --
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    08.02.2018  XX:Added
  *******************************************************************************/
  --
  final member procedure Initialize(self                in out nocopy OT_DB_OWNER
                                   ,p_OBJ_TYPE          in varchar2
                                   ,p_OBJ_OWNER         in varchar2
                                   ,p_Is_Case_Sensitive in pls_integer default 0
                                    --
                                    ) is
    --
    /*
    $if dbms_db_version.ver_le_11 $then
    v_Max_Identifier_Length pls_integer := 30;
    $else
    v_Max_Identifier_Length pls_integer := 128;
    $end
    */
    --
  begin
    --
    --
    /*
    select * from v$parameter
    where upper(name) = upper('COMPATIBLE')
     ==> t.value >= 12.2.0  -- means long ident names support

    or read from dba_tab_columns the length of the identifier from the dictionary!
    */
    --
    --
    --
    /*
    2.8 Database Object Names and Qualifiers
    Some database objects are made up of parts that you can or must name, such as the columns in a table or view, index and table partitions and subpartitions, integrity constraints on a table, and objects that are stored within a package, including procedures and stored functions. This section provides:

    Rules for naming database objects and database object location qualifiers

    Guidelines for naming database objects and qualifiers

    Note:

    Oracle uses system-generated names beginning with "SYS_" for implicitly generated database objects and subobjects, and names beginning with "ORA_" for some Oracle-supplied objects. Oracle discourages you from using these prefixes in the names you explicitly provide to your database objects and subobjects to avoid possible conflict in name resolution.

    2.8.1 Database Object Naming Rules
    Every database object has a name. In a SQL statement, you represent the name of an object with a quoted identifier or a nonquoted identifier.

    A quoted identifier begins and ends with double quotation marks ("). If you name a schema object using a quoted identifier, then you must use the double quotation marks whenever you refer to that object.

    A nonquoted identifier is not surrounded by any punctuation.

    You can use either quoted or nonquoted identifiers to name any database object. However, database names, global database names, database link names, disk group names, and pluggable database (PDB) names are always case insensitive and are stored as uppercase. If you specify such names as quoted identifiers, then the quotation marks are silently ignored.

    See Also:

    CREATE USER for additional rules for naming users and passwords

    Note:

    Oracle does not recommend using quoted identifiers for database object names. These quoted identifiers are accepted by SQL*Plus, but they may not be valid when using other tools that manage database objects.

    The following list of rules applies to both quoted and nonquoted identifiers unless otherwise indicated:

    The maximum length of identifier names depends on the value of the COMPATIBLE initialization parameter.

    If COMPATIBLE is set to a value of 12.2 or higher, then names must be from 1 to 128 bytes long with these exceptions:

    Names of databases are limited to 8 bytes.

    Names of disk groups, pluggable databases (PDBs), rollback segments, tablespaces, and tablespace sets are limited to 30 bytes.

    If an identifier includes multiple parts separated by periods, then each attribute can be up to 128 bytes long. Each period separator, as well as any surrounding double quotation marks, counts as one byte. For example, suppose you identify a column like this:

    "schema"."table"."column"
    The schema name can be 128 bytes, the table name can be 128 bytes, and the column name can be 128 bytes. Each of the quotation marks and periods is a single-byte character, so the total length of the identifier in this example can be up to 392 bytes.

    If COMPATIBLE is set to a value lower than 12.2, then names must be from 1 to 30 bytes long with these exceptions:

    Names of databases are limited to 8 bytes.

    Names of database links can be as long as 128 bytes.

    If an identifier includes multiple parts separated by periods, then each attribute can be up to 30 bytes long. Each period separator, as well as any surrounding double quotation marks, counts as one byte. For example, suppose you identify a column like this:

    "schema"."table"."column"
    The schema name can be 30 bytes, the table name can be 30 bytes, and the column name can be 30 bytes. Each of the quotation marks and periods is a single-byte character, so the total length of the identifier in this example can be up to 98 bytes.

    Nonquoted identifiers cannot be Oracle SQL reserved words. Quoted identifiers can be reserved words, although this is not recommended.

    Depending on the Oracle product you plan to use to access a database object, names might be further restricted by other product-specific reserved words.

    Note:

    The reserved word ROWID is an exception to this rule. You cannot use the uppercase word ROWID, either quoted or nonquoted, as a column name. However, you can use the uppercase word as a quoted identifier that is not a column name, and you can use the word with one or more lowercase letters (for example, "Rowid" or "rowid") as any quoted identifier, including a column name.

    See Also:

    Oracle SQL Reserved Words for a listing of all Oracle SQL reserved words

    The manual for a specific product, such as Oracle Database PL/SQL Language Reference, for a list of the reserved words of that product

    The Oracle SQL language contains other words that have special meanings. These words include data types, schema names, function names, the dummy system table DUAL, and keywords (the uppercase words in SQL statements, such as DIMENSION, SEGMENT, ALLOCATE, DISABLE, and so forth). These words are not reserved. However, Oracle uses them internally in specific ways. Therefore, if you use these words as names for objects and object parts, then your SQL statements may be more difficult to read and may lead to unpredictable results.

    In particular, do not use words beginning with SYS_ or ORA_ as schema object names, and do not use the names of SQL built-in functions for the names of schema objects or user-defined functions.

    See Also:

    Oracle SQL Keywords for information how to obtain a list of keywords

    Data Types, About SQL Functions, and Selecting from the DUAL Table

    You should use characters from the ASCII repertoire in database names, global database names, and database link names, because these characters provide optimal compatibility across different platforms and operating systems. You must use only characters from the ASCII repertoire in names of common users and common roles in a multitenant container database (CDB).

    You can include multibyte characters in passwords.

    Nonquoted identifiers must begin with an alphabetic character from your database character set. Quoted identifiers can begin with any character.

    Nonquoted identifiers can contain only alphanumeric characters from your database character set and the underscore (_), dollar sign ($), and pound sign (#). Database links can also contain periods (.) and "at" signs (@).

    Quoted identifiers can contain any characters and punctuations marks as well as spaces. However, neither quoted nor nonquoted identifiers can contain double quotation marks or the null character (\0).

    Within a namespace, no two objects can have the same name.

    The following schema objects share one namespace:

    Packages

    Private synonyms

    Sequences

    Stand-alone procedures

    Stand-alone stored functions

    Tables

    User-defined operators

    User-defined types

    Views

    Each of the following schema objects has its own namespace:

    Clusters

    Constraints

    Database triggers

    Dimensions

    Indexes

    Materialized views (When you create a materialized view, the database creates an internal table of the same name. This table has the same namespace as the other tables in the schema. Therefore, a schema cannot contain a table and a materialized view of the same name.)

    Private database links

    Because tables and sequences are in the same namespace, a table and a sequence in the same schema cannot have the same name. However, tables and indexes are in different namespaces. Therefore, a table and an index in the same schema can have the same name.

    Each schema in the database has its own namespaces for the objects it contains. This means, for example, that two tables in different schemas are in different namespaces and can have the same name.

    Each of the following nonschema objects also has its own namespace:

    Editions

    Parameter files (PFILEs) and server parameter files (SPFILEs)

    Profiles

    Public database links

    Public synonyms

    Tablespaces

    User roles

    Because the objects in these namespaces are not contained in schemas, these namespaces span the entire database.

    Nonquoted identifiers are not case sensitive. Oracle interprets them as uppercase. Quoted identifiers are case sensitive.

    By enclosing names in double quotation marks, you can give the following names to different objects in the same namespace:

    "employees"
    "Employees"
    "EMPLOYEES"
    Note that Oracle interprets the following names the same, so they cannot be used for different objects in the same namespace:

    employees
    EMPLOYEES
    "EMPLOYEES"
    When Oracle stores or compares identifiers in uppercase, the uppercase form of each character in the identifiers is determined by applying the uppercasing rules of the database character set. Language-specific rules determined by the session setting NLS_SORT are not considered. This behavior corresponds to applying the SQL function UPPER to the identifier rather than the function NLS_UPPER.

    The database character set uppercasing rules can yield results that are incorrect when viewed as being in a certain natural language. For example, small letter sharp s ("ß"), used in German, does not have an uppercase form according to the database character set uppercasing rules. It is not modified when an identifier is converted into uppercase, while the expected uppercase form in German is the sequence of two characters capital letter S ("SS"). Similarly, the uppercase form of small letter i, according to the database character set uppercasing rules, is capital letter I. However, the expected uppercase form in Turkish and Azerbaijani is capital letter I with dot above.

    The database character set uppercasing rules ensure that identifiers are interpreted the same in any linguistic configuration of a session. If you want an identifier to look correctly in a certain natural language, then you can quote it to preserve the lowercase form or you can use the linguistically correct uppercase form whenever you use that identifier.

    Columns in the same table or view cannot have the same name. However, columns in different tables or views can have the same name.

    Procedures or functions contained in the same package can have the same name, if their arguments are not of the same number and data types. Creating multiple procedures or functions with the same name in the same package with different arguments is called overloading the procedure or function.

    2.8.2 Schema Object Naming Examples
    The following examples are valid schema object names:

    last_name
    horse
    hr.hire_date
    "EVEN THIS & THAT!"
    a_very_long_and_valid_name
    All of these examples adhere to the rules listed in Database Object Naming Rules.

    2.8.3 Schema Object Naming Guidelines
    Here are several helpful guidelines for naming objects and their parts:

    Use full, descriptive, pronounceable names (or well-known abbreviations).

    Use consistent naming rules.

    Use the same name to describe the same entity or attribute across tables.

    When naming objects, balance the objective of keeping names short and easy to use with the objective of making names as descriptive as possible. When in doubt, choose the more descriptive name, because the objects in the database may be used by many people over a period of time. Your counterpart ten years from now may have difficulty understanding a table column with a name like pmdd instead of payment_due_date.

    Using consistent naming rules helps users understand the part that each table plays in your application. One such rule might be to begin the names of all tables belonging to the FINANCE application with fin_.

    Use the same names to describe the same things across tables. For example, the department number columns of the sample employees and departments tables are both named department_id.



    E.1 Oracle SQL Reserved Words
    This section lists Oracle SQL reserved words. You cannot use Oracle SQL reserved words as nonquoted identifiers. Quoted identifiers can be reserved words, although this is not recommended.

    Note:

    In addition to the following reserved words, Oracle uses system-generated names beginning with "SYS_" for implicitly generated schema objects and subobjects. Oracle discourages you from using this prefix in the names you explicitly provide to your schema objects and subobjects to avoid possible conflict in name resolution.

    The V$RESERVED_WORDS data dictionary view provides additional information on each reserved word, including whether it is always reserved or is reserved only for particular uses. Refer to Oracle Database Reference for more information.

    Words followed by an asterisk (*) are also ANSI reserved words.

    ACCESS
    ADD
    ALL *
    ALTER *
    AND *
    ANY *
    AS *
    ASC
    AUDIT
    BETWEEN *
    BY *
    CHAR *
    CHECK *
    CLUSTER
    COLUMN *
    COLUMN_VALUE (See Note 1 at the end of this list)
    COMMENT
    COMPRESS
    CONNECT *
    CREATE *
    CURRENT *
    DATE *
    DECIMAL *
    DEFAULT *
    DELETE *
    DESC
    DISTINCT *
    DROP *
    ELSE *
    EXCLUSIVE
    EXISTS *
    FILE
    FLOAT *
    FOR *
    FROM *
    GRANT *
    GROUP *
    HAVING *
    IDENTIFIED
    IMMEDIATE
    IN *
    INCREMENT
    INDEX
    INITIAL
    INSERT *
    INTEGER *
    INTERSECT *
    INTO *
    IS *
    LEVEL
    LIKE *
    LOCK
    LONG
    MAXEXTENTS
    MINUS
    MLSLABEL
    MODE
    MODIFY
    NESTED_TABLE_ID (See Note 1 at the end of this list)
    NOAUDIT
    NOCOMPRESS
    NOT *
    NOWAIT
    NULL *
    NUMBER
    OF *
    OFFLINE
    ON *
    ONLINE
    OPTION
    OR *
    ORDER *
    PCTFREE
    PRIOR
    PUBLIC
    RAW
    RENAME
    RESOURCE
    REVOKE *
    ROW *
    ROWID (See Note 2 at the end of this list)
    ROWNUM
    ROWS *
    SELECT *
    SESSION
    SET *
    SHARE
    SIZE
    SMALLINT *
    START *
    SUCCESSFUL
    SYNONYM
    SYSDATE
    TABLE *
    THEN *
    TO *
    TRIGGER *
    UID
    UNION *
    UNIQUE *
    UPDATE *
    USER *
    VALIDATE
    VALUES *
    VARCHAR *
    VARCHAR2
    VIEW
    WHENEVER *
    WHERE *
    WITH *
    Note 1: This keyword is only reserved for use as an attribute name.

    Note 2: You cannot use the uppercase word ROWID, either quoted or nonquoted, as a column name. However, you can use the uppercase word as a quoted identifier that is not a column name, and you can use the word with one or more lowercase letters (for example, "Rowid" or "rowid") as any quoted identifier, including a column name.



    E.2 Oracle SQL Keywords
    Oracle SQL keywords are not reserved. However, Oracle uses them internally in specific ways. Therefore, if you use these words as names for objects and object parts, then your SQL statements may be more difficult to read and may lead to unpredictable results.

    You can obtain a list of keywords by querying the V$RESERVED_WORDS data dictionary view. All keywords in the view that are not listed as always reserved or reserved for a specific use are Oracle SQL keywords. Refer to Oracle Database Reference for more information.
    */
    --
    --
    --
    /*
    --
    --           dots    qoutes
    -- 128 * 3 + 1 * 2 + 2 * 3
    -- TYPE, TABLE, VIEW, ...
      OBJECT_TYPE  varchar2(23 byte),
      OBJECT_OWNER varchar2(128 byte),
      OBJECT_NAME  varchar2(128 byte)
    -- include subname in under object! proc-, func- and method-names are NOT subnames!
    -- '$VSN_1'..'$VSN_n' for types if they are altered
    --SUBOBJECT_NAME varchar2(128 byte)
    */
    --
    --
    self.OBJ_TYPE := upper(trim(p_OBJ_TYPE));
    --
    --
    if (nvl(p_Is_Case_Sensitive
           ,0) != 0)
    then
      self.OBJ_OWNER := p_OBJ_OWNER;
    else
      self.OBJ_OWNER := upper(trim(p_OBJ_OWNER));
    end if;
    --
    --
    /*
    if (regexp_like(trim(p_OBJECT_NAME)
                   ,'^[a-z][a-z0-9_#$]{0,' || trim(v_Max_Length - 1) || '}$'
                   ,'i'))
    then
      self.OBJECT_NAME := upper(trim(p_OBJECT_NAME));
    elsif (regexp_like(trim(p_OBJECT_NAME)
                      ,'^(")([a-z][a-z0-9_#$]{0,' || trim(v_Max_Length - 1) || '})(")$'
                      ,'i'))
    then
      self.OBJECT_NAME := regexp_replace(trim(p_OBJECT_NAME)
                                        ,'^(")([a-z][a-z0-9_#$]{0,' || trim(v_Max_Length - 1) || '})(")$'
                                        ,'\2'
                                        ,1
                                        ,1
                                        ,'i');
    else
      Raise_application_error(-20000
                             ,'Invalid identifier as p_OBJECT_NAME[''' || p_OBJECT_NAME || ''']!');
    end if;
    */
    --
    --
    if (self.OBJ_TYPE not in ('CLUSTER'
                             ,'CONSUMER GROUP'
                             ,'CONTAINER'
                             ,'CONTEXT'
                             ,'DATABASE LINK'
                             ,'DESTINATION'
                             ,'DIRECTORY'
                             ,'EDITION'
                             ,'EVALUATION CONTEXT'
                             ,'FUNCTION'
                             ,'INDEX'
                             ,'INDEX PARTITION'
                             ,'INDEXTYPE'
                             ,'JAVA CLASS'
                             ,'JAVA DATA'
                             ,'JAVA RESOURCE'
                             ,'JAVA SOURCE'
                             ,'JOB'
                             ,'JOB CLASS'
                             ,'LIBRARY'
                             ,'LOB'
                             ,'LOB PARTITION'
                             ,'LOCKDOWN PROFILE'
                             ,'OPERATOR'
                             ,'PACKAGE'
                             ,'PACKAGE BODY'
                             ,'PROCEDURE'
                             ,'PROGRAM'
                             ,'QUEUE'
                             ,'RESOURCE PLAN'
                             ,'RULE'
                             ,'RULE SET'
                             ,'SCHEDULE'
                             ,'SCHEDULER GROUP'
                             ,'SEQUENCE'
                             ,'SYNONYM'
                             ,'TABLE'
                             ,'TABLE PARTITION'
                             ,'TABLE SUBPARTITION'
                             ,'TRIGGER'
                             ,'TYPE'
                             ,'TYPE BODY'
                             ,'UNDEFINED'
                             ,'UNIFIED AUDIT POLICY'
                             ,'VIEW'
                             ,'WINDOW'
                             ,'XML SCHEMA'
                              --
                              ))
    then
      Raise_application_error(-20000
                             ,'Got unexpected self.OBJ_TYPE[''' || self.OBJ_TYPE || ''']!');
    end if;
    --
  end Initialize;
  --
  final member procedure Initialize(self                in out nocopy OT_DB_OWNER
                                   ,p_OBJ_OWNER         in varchar2
                                   ,p_Is_Case_Sensitive in pls_integer default 0
                                    --
                                    ) is
  begin
    --
    self.Initialize(null
                   ,p_OBJ_OWNER
                   ,p_Is_Case_Sensitive);
    --
  end Initialize;
  --
end;
/
