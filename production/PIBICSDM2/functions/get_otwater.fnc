CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_OTWATER" (esyear char,esmonth char,card_id_tmp varchar) return number is 
tmp number;
begin
    begin
        /*select waterfees  into tmp  from(
        select waterfees  from WELFARE_WATERDETAILOT where fscyear=esyear and month=to_number(esmonth) and profile_seqno=pid order by update_date desc )
        where rownum =1;*/
        /*select BILL_SUMAMT into tmp from WF_BILL a, wf_process_control b where (a.PROFILE_SEQNO=pid) and (a.BILL_YEAR = esyear and a.BILL_MONTH=to_number(esmonth))
        and (b.PC_YEAR= esyear and  b.PC_MONTH= to_number(esmonth)) and PC_CALBILL='Y' and pc_tenant='Y';*/
     select bill_sumamt into tmp from wf_bill a, wf_process_control b, hr_profile_ot c where (a.profile_seqno=c.profile_seqno) and (a.bill_year = esyear and a.bill_month=to_number(esmonth))
        and (b.pc_year= esyear and  b.pc_month= to_number(esmonth)) and pc_calbill='Y' and pc_tenant='Y' and c.card_id = card_id_tmp;           
            
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
