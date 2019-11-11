CREATE GLOBAL TEMPORARY TABLE "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" OF "DL_USER_MANAGEMENT"."OT_LDAP_ROLE" 
   ( "ID" NOT NULL ENABLE, 
	 "DN" NOT NULL ENABLE, 
	 "SID" NOT NULL ENABLE, 
	 "CN" NOT NULL ENABLE, 
	 "ROLE_NAME" NOT NULL ENABLE
   ) ON COMMIT PRESERVE ROWS ;
  ALTER TABLE "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" ADD CONSTRAINT "LDAP_ROLES$GT$PK" PRIMARY KEY ("DN") ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" ADD CONSTRAINT "LDAP_ROLES$GT$UQ00" UNIQUE ("ROLE_NAME") ENABLE;
  CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."LDAP_ROLES$GT$PK" ON "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" ("DN") ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."LDAP_ROLES$GT$UQ00" ON "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" ("ROLE_NAME") ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."SYS_C00201939" ON "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" ("SYS_NC_OID$") ;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" TO "APPSUP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" TO "BIOSAADM";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" TO "BIOSAADM";
  GRANT INDEX ON "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" TO "BIOSAADM";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" TO "BIOSAADM";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" TO "BIOSAADM";
  GRANT READ ON "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" TO "BIOSAADM";
  GRANT UNDER ON "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" TO "BIOSAADM";
  GRANT DEBUG ON "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_USER_MANAGEMENT"."LDAP_ROLES$GT" TO "BIOSAADM";
