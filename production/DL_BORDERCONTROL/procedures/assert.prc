CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_BORDERCONTROL"."ASSERT" (
    p_condition in boolean,
    p_message   in varchar2,
    p_sqlcode   in Integer := -20000)
as
begin
  if not p_condition or p_condition is null then
    raise_application_error(p_sqlcode, p_message);
  end if;
end assert;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."ASSERT" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."ASSERT" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."ASSERT" TO "BIOSUPPORT";
