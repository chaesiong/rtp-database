CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BLACKLIST"."BIOMETRICS_SUMMARY" ("BLACKLIST_CASE_ID", "IMAGE_DIGEST", "CNT_FACES", "CNT_FINGERPRINTS") AS 
  SELECT blacklist_case_id
      ,listagg(id) within GROUP(ORDER BY id) AS image_digest
      ,SUM(cnt_faces) AS cnt_faces
      ,SUM(cnt_fingerprints) AS cnt_fingerprints
FROM (SELECT i.id
            ,b.blacklist_case_id
            ,1                   AS  cnt_faces
            ,0                   AS cnt_fingerprints
      FROM images i
      INNER JOIN faces fa
      ON fa.image_id = i.id
      INNER JOIN biometrics b
      ON b.id = fa.biometric_id
      UNION
      SELECT i.id
            ,b.blacklist_case_id
            ,0                   AS cnt_faces
            ,1                   AS cnt_fingerprints
      FROM images i
      INNER JOIN fingerprints fp
      ON fp.image_id = i.id
      INNER JOIN biometrics b
      ON b.id = fp.biometric_id)
GROUP BY blacklist_case_id;
   COMMENT ON TABLE "DL_BLACKLIST"."BIOMETRICS_SUMMARY"  IS 'Summary of biometric in relation to images';
  GRANT SELECT ON "DL_BLACKLIST"."BIOMETRICS_SUMMARY" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."BIOMETRICS_SUMMARY" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."BIOMETRICS_SUMMARY" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."BIOMETRICS_SUMMARY" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."BIOMETRICS_SUMMARY" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."BIOMETRICS_SUMMARY" TO "TESTADM";
