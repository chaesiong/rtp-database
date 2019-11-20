CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VIEW_FN_DEPT" ("DEPT_SEQNO", "DEPT1", "DEPT2", "PV_DESC", "PV_SEQNO", "NUM_HOTEL") AS 
  SELECT   d1.dept_seqno,
              d1.depttnm AS dept1,
              d2.depttnm AS dept2,
              v.pv_desc,
              v.pv_seqno,
              v.num_hotel
       FROM         department d2
                 LEFT JOIN
                    department d1
                 ON d2.rel_code = d1.dept_seqno
              LEFT JOIN
                 province v
              ON d2.dept_seqno = v.dept_seqno
      WHERE   d2.deptlevel = 2
   GROUP BY   d1.dept_seqno,
              d1.depttnm,
              d2.depttnm,
              v.pv_desc,
              v.pv_seqno,
              v.num_hotel ;
  GRANT SELECT ON "PIBICSDM2"."VIEW_FN_DEPT" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VIEW_FN_DEPT" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VIEW_FN_DEPT" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VIEW_FN_DEPT" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VIEW_FN_DEPT" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VIEW_FN_DEPT" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VIEW_FN_DEPT" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VIEW_FN_DEPT" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VIEW_FN_DEPT" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VIEW_FN_DEPT" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VIEW_FN_DEPT" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VIEW_FN_DEPT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VIEW_FN_DEPT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VIEW_FN_DEPT" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VIEW_FN_DEPT" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VIEW_FN_DEPT" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VIEW_FN_DEPT" TO "BIOSAADM";
