CREATE OR REPLACE EDITIONABLE TRIGGER "PIBICSDM2"."IMMIGRATIONSEQ_TRG2" BEFORE UPDATE OR INSERT ON PIBICSDM2.IMMIGRATION
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
    --SEQNO COUNTRY
    IF :NEW.NATIONCD IS NOT NULL THEN
        :NEW.COUNT_SEQNO := GET_NATIONSEQNO(:NEW.NATIONCD);
    ELSE
        :NEW.COUNT_SEQNO := NULL;
    END IF;
   --SEQNO VISATYPE
    IF :NEW.VISATYPECD IS NOT NULL THEN
        :NEW.VISATYPE_SEQNO := GET_VISATYPESEQNO(:NEW.VISATYPECD);
    ELSE
        :NEW.VISATYPE_SEQNO := NULL;
    END IF;
   --SEQNO DEPARTMENT
    IF :NEW.DEPTCD IS NOT NULL THEN
        :NEW.DEPT_SEQNO := GET_DEPTSEQNO(:NEW.DEPTCD);
    ELSE
        :NEW.DEPT_SEQNO := NULL;
    END IF;
   --SEQNO CONVEYANCE
    IF :NEW.CONVCD IS NOT NULL THEN
        :NEW.CONV_SEQNO := GET_CONVSEQNO(:NEW.CONVCD);
    ELSE
        :NEW.CONV_SEQNO := NULL;
    END IF;
   --SEQNO PERMITTYPE
    IF :NEW.PERMITCD IS NOT NULL THEN
        :NEW.PERMIT_SEQNO := GET_PERMITSEQNO(:NEW.PERMITCD);
    ELSE
        :NEW.PERMIT_SEQNO := NULL;
    END IF;
END;
/
ALTER TRIGGER "PIBICSDM2"."IMMIGRATIONSEQ_TRG2" ENABLE;