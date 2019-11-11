CREATE OR REPLACE EDITIONABLE FUNCTION "DL_USER_MANAGEMENT"."IS_CURRENT" (i_valid_from in date
                                                        ,i_valid_to   in date
                                                        ,i_base_date  in date default sysdate
                                                         --
                                                         ) return integer deterministic as
  --
  --
  /*******************************************************************************
  * Returns 1 if i_base_date is in between of i_valid_from(incl) and i_valid_to(excl)*
  *           else 0                                                             *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * Herzog    17/06/2014  initial
  * Wilmsh.   09/06/2015  remove sysdate in function
              and added as optional parameter
  * MThierhoff 21/02/2017  return 1 if valid_from is null (and base_date < valid_to)
  * WWirns    12.03.2018  Replace USER_MANAGEMENT by DL_USER_MANAGEMENT
  *******************************************************************************/
  --
begin
  if ((i_valid_from <= i_base_date or (i_valid_from is null)) and (i_base_date < i_valid_to or (i_valid_to is null)))
  then
    return 1;
  else
    return 0;
  end if;
end IS_CURRENT;
/
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."IS_CURRENT" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."IS_CURRENT" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."IS_CURRENT" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."IS_CURRENT" TO "BIOSAADM";
