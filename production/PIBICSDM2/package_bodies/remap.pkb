CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PIBICSDM2"."REMAP" as
  function null_lob(col blob)
    return blob is
    eblob blob;
  begin
    return null;
  end null_lob;
end remap;
/