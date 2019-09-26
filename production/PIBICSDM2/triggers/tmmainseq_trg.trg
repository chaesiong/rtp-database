CREATE OR REPLACE EDITIONABLE TRIGGER "PIBICSDM2"."TMMAINSEQ_TRG" 
BEFORE UPDATE OR INSERT ON PIBICSDM2.TMMAIN
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
    --SEQNO COUNTRY IN
    IF :NEW.NATIONCD IS NOT NULL THEN
        :NEW.COUNT_SEQNO := GET_NATIONSEQNO(:NEW.NATIONCD);
    ELSE
        :NEW.COUNT_SEQNO := NULL;
    END IF;
   --SEQNO VISATYPE IN
    IF :NEW.INVISATYPECD IS NOT NULL THEN
        :NEW.INVISATYPE_SEQNO := GET_VISATYPESEQNO(:NEW.INVISATYPECD);
    ELSE
        :NEW.INVISATYPE_SEQNO := NULL;
    END IF;
   --SEQNO DEPARTMENT IN
    IF :NEW.INDEPTCD IS NOT NULL THEN
        :NEW.INDEPT_SEQNO := GET_DEPTSEQNO(:NEW.INDEPTCD);
    ELSE
        :NEW.INDEPT_SEQNO := NULL;
    END IF;
   --SEQNO CONVEYANCE IN
    IF :NEW.INCONVCD IS NOT NULL THEN
        :NEW.INCONV_SEQNO := GET_CONVSEQNO(:NEW.INCONVCD);
    ELSE
        :NEW.INCONV_SEQNO := NULL;
    END IF;
   --SEQNO PERMITTYPE IN
    IF :NEW.INPERMITCD IS NOT NULL THEN
        :NEW.INPERMIT_SEQNO := GET_PERMITSEQNO(:NEW.INPERMITCD);
    ELSE
        :NEW.INPERMIT_SEQNO := NULL;
    END IF;
   --SEQNO VISATYPE OUT
    IF :NEW.OUTVISATYPECD IS NOT NULL THEN
        :NEW.OUTVISATYPE_SEQNO := GET_VISATYPESEQNO(:NEW.OUTVISATYPECD);
    ELSE
        :NEW.OUTVISATYPE_SEQNO := NULL;
    END IF;
   --SEQNO DEPARTMENT OUT
    IF :NEW.OUTDEPTCD IS NOT NULL THEN
        :NEW.OUTDEPT_SEQNO := GET_DEPTSEQNO(:NEW.OUTDEPTCD);
    ELSE
        :NEW.OUTDEPT_SEQNO := NULL;
    END IF;
   --SEQNO CONVEYANCE OUT
    IF :NEW.OUTCONVCD IS NOT NULL THEN
        :NEW.OUTCONV_SEQNO := GET_CONVSEQNO(:NEW.OUTCONVCD);
    ELSE
        :NEW.OUTCONV_SEQNO := NULL;
    END IF;
   --SEQNO PERMITTYPE OUT
    IF :NEW.OUTPERMITCD IS NOT NULL THEN
        :NEW.OUTPERMIT_SEQNO := GET_PERMITSEQNO(:NEW.OUTPERMITCD);
    ELSE
        :NEW.OUTPERMIT_SEQNO := NULL;
    END IF;
END;
/
ALTER TRIGGER "PIBICSDM2"."TMMAINSEQ_TRG" ENABLE;
