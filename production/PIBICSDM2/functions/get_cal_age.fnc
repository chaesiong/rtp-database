CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_CAL_AGE" (
  DATE_PARAM IN VARCHAR2
) RETURN VARCHAR2 AS 

rs VARCHAR2(5) := '';
sys_year NUMBER(4) := to_char(sysdate, 'yyyy');
sys_month NUMBER(2) := to_char(sysdate, 'mm');
sys_date NUMBER(2) := to_char(sysdate, 'dd');
bir_date NUMBER(2);
bir_month NUMBER(2);
bir_year NUMBER(4);

BEGIN
BEGIN
    if INSTR(DATE_PARAM,'/',1)!=0 THEN
    if INSTR(DATE_PARAM,'/',1,2)!=0 THEN
        if INSTR(substr(DATE_PARAM,1, 2) ,'/',1)=0 THEN
                begin
                    bir_date :=substr(DATE_PARAM,1, 2) ;
                    Exception When VALUE_ERROR Then bir_date := 0;
                end;
            else
             bir_date :=null;
        end if;
         if INSTR(substr(DATE_PARAM,INSTR(DATE_PARAM,'/',1)+1, 2) ,'/',1)=0 THEN
                begin
                    bir_month :=substr(DATE_PARAM,INSTR(DATE_PARAM,'/',1)+1, 2) ;
                    Exception When VALUE_ERROR Then bir_month := 0;
                end;
            else
            bir_month :=null;
        end if;
        if INSTR(substr(DATE_PARAM,INSTR(DATE_PARAM,'/',1,2)+1, 4) ,'/',1)=0 THEN
            if length(substr(DATE_PARAM,INSTR(DATE_PARAM,'/',1,2)+1, 4))=4 THEN
                  begin
                        bir_year :=substr(DATE_PARAM,INSTR(DATE_PARAM,'/',1,2)+1, 4);
                      Exception When VALUE_ERROR Then bir_year := 0;
                  end;
                else
                bir_year :=null;
            end if;           
        end if;
     end if;
    end if;
     if INSTR(DATE_PARAM,'/',1)=0 THEN
    if INSTR(DATE_PARAM,'/',1,2)=0 THEN
      if length(DATE_PARAM)=4 THEN
                bir_year :=DATE_PARAM;
                else
                bir_year :=null;
            end if;  
     end if;
    end if;

  rs := sys_year - bir_year;

  IF bir_month is not null THEN
     
    IF sys_month = bir_month THEN
        IF bir_date is not null and bir_date > sys_date THEN
            IF bir_year < sys_year THEN
           rs := rs - 1;
            END IF ;
        END IF ;        
     END IF ; 
      
     IF bir_month > sys_month THEN
       IF bir_year < sys_year THEN
       rs := rs - 1;
     END IF ;
     END IF ;
     
  END IF ;
  
  Exception When VALUE_ERROR Then rs :=  '';
  END;
  
  RETURN rs ;
END get_CAL_AGE;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_CAL_AGE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_CAL_AGE" TO "BIOSAADM";
