CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_TRAVELDOCTYPEBYSEQ" (tdtSeqno_tmp number,flag char) return varchar2 is
enm varchar2(200);
tnm varchar2(200);
tmp varchar2(200);
begin
    begin
    select tdtenm,tdttnm into enm,tnm  from traveldoctype where tdt_seqno=tdtSeqno_tmp;
    if flag = 'T' then
       tmp := tnm;
    elsif flag = 'E' then
       tmp := enm;
    else tmp := tnm;
    end if;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_TRAVELDOCTYPEBYSEQ" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_TRAVELDOCTYPEBYSEQ" TO "BIOSAADM";
