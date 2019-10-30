CREATE OR REPLACE EDITIONABLE FUNCTION "DL_USER_MANAGEMENT"."VALUE4LOOKUPS$IS_ACTIVE" (p_VALID_FROM in date
                                                                     ,p_VALID_TO   in date
                                                                      --
                                                                      ) return varchar2 deterministic is
  --
  --
  /*******************************************************************************
  * Returns 1 if i_base_date is in between of i_valid_from(incl) and i_valid_to(excl)*
  *           else 0                                                             *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * Herzog    17/06/2014  initial                                                *
  * Wilmsh.   09/06/2015  remove sysdate in function                             *
              and added as optional parameter                        *
  * MThierhoff 21/02/2017  return 1 if valid_from is null (and base_date < valid_to) *
  * WWirns     27/11/2017  Copied into DL_COMMON and return Y if valid_from is null (and base_date < valid_to)
  * WWirns     29/11/2017  Refactored
  * SRuseva    20/12/2017  Copied to user_management
  * WWirns    12.03.2018  Replace USER_MANAGEMENT by DL_USER_MANAGEMENT
  *******************************************************************************/
  --
  v_Curr_Date date := sysdate;
  --
begin
  if (
     --
      (p_VALID_FROM <= v_Curr_Date or p_VALID_FROM is null)
     --
      and (v_Curr_Date < p_VALID_TO or p_VALID_TO is null)
     --
     )
  then
    return 'Y';
  else
    return 'N';
  end if;
end Value4LOOKUPS$IS_ACTIVE;
/
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."VALUE4LOOKUPS$IS_ACTIVE" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."VALUE4LOOKUPS$IS_ACTIVE" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."VALUE4LOOKUPS$IS_ACTIVE" TO "BIOSUPPORT";
