CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."V_XXTMP_VISABYNATION_PRD" ("VISAN_SEQNO", "COUNTCD", "VISATYPECD", "DEFAULTVISA", "ACTFLAG", "CREATE_BY", "CREATE_DATE", "UPDATE_BY", "UPDATE_DATE", "VERSION", "COUNT_SEQNO", "VISA_SEQNO", "VISATYPECDORG", "FIXDEPTLINE") AS 
  SELECT 
    visan_seqno,
    countcd,
    visatypecd,
    defaultvisa,
    actflag,
    create_by,
    create_date,
    update_by,
    update_date,
    version,
    count_seqno,
    visa_seqno,
    visatypecdorg,
    fixdeptline
FROM pibics.visabynation@pibics_prod;
