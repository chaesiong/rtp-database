
REM INSERTING into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES
SET DEFINE OFF;
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('REGION','M','ADMIN_HIERARCHY','Y',1);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('PROVINCE','M','ADMIN_HIERARCHY','Y',2);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('AMPUR','M','ADMIN_HIERARCHY','Y',3);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('TAMBON','M','ADMIN_HIERARCHY','Y',4);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('CONTINENT','M','VISABYNATION','Y',1);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('COUNTRY','M','VISABYNATION','Y',2);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('VISATYPE','M','VISABYNATION','Y',3);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('VISABYNATION','M','VISABYNATION','Y',4);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('CONVEYANCE','M',null,'Y',null);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('DEPARTMENT','M',null,'Y',null);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('FLIGHTNUMBERS','M',null,'Y',null);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('FS_SLIPSYSTEM','M',null,'Y',null);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('OCCUPATION','M',null,'Y',null);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('PAYMENTRATE','M',null,'Y',null);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('PERMITTYPE','M',null,'Y',null);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('RANKCRW','M',null,'Y',null);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('SUFFIX','M',null,'Y',null);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('TRAVELDOCTYPE','M',null,'Y',null);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('CREW','B',null,'N',null);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('FS_FEES','B',null,'N',null);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('FS_FEESDETAIL','B',null,'N',null);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('FS_FINES','B',null,'N',null);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('FS_FINESDETAIL','B',null,'N',null);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('LOSTPASSPORT','B',null,'Y',null);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('THAIPASSPORT','B',null,'Y',null);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('TMINOUT','B',null,'Y',null);
Insert into DL_STAGING4PIBICS.OPS_PIBICS_LOAD_PROCESSES (PROCESS_NAME,KIND,PROCESS_CLUSTER,SHALL_BE_SYNCED,PROCESS_CLUSTER_SEQUENCE) values ('WATCHLIST','B',null,'Y',null);

27 rows selected. 

