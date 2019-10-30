CREATE TABLE "DL_COMMON"."APEX_LISTS" 
   (	"KEY_VALUE" NUMBER(15,0), 
	"PARENT_KEY_VALUE" NUMBER(15,0), 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"LIST_NAME" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"TARGET" VARCHAR2(4000 CHAR), 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_CURRENT_LIST_ENTRY" VARCHAR2(3 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"IMAGE" VARCHAR2(255 CHAR), 
	"IMAGE_ATTRIBUTE" VARCHAR2(255 CHAR), 
	"IMAGE_ALT_ATTRIBUTE" VARCHAR2(255 CHAR), 
	"ATTRIBUTE1" VARCHAR2(255 CHAR), 
	"ATTRIBUTE2" VARCHAR2(255 CHAR), 
	"ATTRIBUTE3" VARCHAR2(255 CHAR), 
	"ATTRIBUTE4" VARCHAR2(255 CHAR), 
	"ATTRIBUTE5" VARCHAR2(255 CHAR), 
	"ATTRIBUTE6" VARCHAR2(255 CHAR), 
	"ATTRIBUTE7" VARCHAR2(255 CHAR), 
	"ATTRIBUTE8" VARCHAR2(255 CHAR), 
	"ATTRIBUTE9" VARCHAR2(255 CHAR), 
	"ATTRIBUTE10" VARCHAR2(255 CHAR), 
	"IS_EXTERNAL" VARCHAR2(1 CHAR), 
	"AUTHORIZATION_SCHEME" VARCHAR2(255 CHAR), 
	"AUTH_OBJECT_ID" VARCHAR2(32 CHAR), 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"APP_ALIAS" VARCHAR2(255 CHAR), 
	"PAGE_ID" NUMBER(10,0), 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"OWNER" VARCHAR2(128 CHAR) DEFAULT null NOT NULL ENABLE, 
	"CHILD_PAGES" VARCHAR2(64 CHAR), 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_COMMON"."APEX_LISTS" ADD CONSTRAINT "APEX_LISTS$CHK$C00" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."APEX_LISTS" ADD CONSTRAINT "APEX_LISTS$CHK$C01" CHECK (DML_TYPE in ('I','U')) ENABLE;
  ALTER TABLE "DL_COMMON"."APEX_LISTS" ADD CONSTRAINT "APEX_LISTS$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."APEX_LISTS" ADD CONSTRAINT "APEX_LISTS$FK00" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."PARENT_KEY_VALUE" IS 'Key Value from Parent';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."LIST_NAME" IS 'Name of the list';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."DISPLAY_VALUE" IS 'Text to appear as list Entry';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."TARGET" IS 'Target URL to branch to when list entry is selected';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."IS_CURRENT_LIST_ENTRY" IS 'Flag: Y.es or N.o';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."IMAGE" IS 'Icon of Apex Menu Entrance';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."IMAGE_ATTRIBUTE" IS 'Icon Attribute';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."IMAGE_ALT_ATTRIBUTE" IS 'Image Alt Attribute';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."ATTRIBUTE1" IS 'Substitution string #A01#';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."ATTRIBUTE2" IS 'Substitution string #A02#';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."ATTRIBUTE3" IS 'Substitution string #A03#';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."ATTRIBUTE4" IS 'Substitution string #A04#';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."ATTRIBUTE5" IS 'Substitution string #A05#';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."ATTRIBUTE6" IS 'Substitution string #A06#';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."ATTRIBUTE7" IS 'Substitution string #A07#';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."ATTRIBUTE8" IS 'Substitution string #A08#';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."ATTRIBUTE9" IS 'Substitution string #A09#';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."ATTRIBUTE10" IS 'Substitution string #A010#';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."IS_EXTERNAL" IS 'Is external link?';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."AUTHORIZATION_SCHEME" IS 'Authorization scheme to be authorized against';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."AUTH_OBJECT_ID" IS 'Object ID to be authorized against';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."APP_ALIAS" IS 'Application Alias where the Page belongs to';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."PAGE_ID" IS 'Page ID from Application';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."OWNER" IS 'Owner who has inserted and is responsible for this row.';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."CHILD_PAGES" IS 'Pages that have the same Menu Entry comma separated';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON TABLE "DL_COMMON"."APEX_LISTS"  IS 'List items for a dynamic list that builds the hierarchical list in APEX';
  CREATE INDEX "DL_COMMON"."APEX_LISTS$IX00" ON "DL_COMMON"."APEX_LISTS" ("DISPLAY_VALUE", "DISPLAY_ORDER") 
  ;
CREATE INDEX "DL_COMMON"."APEX_LISTS$IX01" ON "DL_COMMON"."APEX_LISTS" ("OWNER") 
  ;
CREATE INDEX "DL_COMMON"."APEX_LISTS$IX02" ON "DL_COMMON"."APEX_LISTS" ("LIST_NAME") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."APEX_LISTS$PK" ON "DL_COMMON"."APEX_LISTS" ("KEY_VALUE") 
  ;
  GRANT SELECT ON "DL_COMMON"."APEX_LISTS" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."APEX_LISTS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."APEX_LISTS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."APEX_LISTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."APEX_LISTS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."APEX_LISTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."APEX_LISTS" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."APEX_LISTS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."APEX_LISTS" TO "BIOSUPPORT";
