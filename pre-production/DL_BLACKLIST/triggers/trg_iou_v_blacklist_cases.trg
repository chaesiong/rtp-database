CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BLACKLIST"."TRG_IOU_V_BLACKLIST_CASES" 
    INSTEAD OF UPDATE ON dl_blacklist.v_blacklist_cases
    FOR EACH ROW
DECLARE
    l_blacklist_case_id dl_blacklist.blacklist_cases.id%TYPE;
    l_rec               dl_blacklist.pkg_db_access.case_1_r;
BEGIN
    l_rec.id                            := :new.id;
    l_rec.authority                     := :new.authority;
    l_rec.behavior                      := :new.behavior;
    l_rec.case_number                   := :new.case_number;
    l_rec.secret_level                  := :new.secret_level;
    l_rec.reason                        := :new.reason;
    l_rec.is_active                     := :new.is_active;
    l_rec.urgent_contact                := :new.urgent_contact;
    l_rec.contact_information           := :new.contact_information;
    l_rec.target_code                   := :new.target_code;
    l_rec.action_code                   := :new.action_code;
    l_rec.notice                        := :new.notice;
    l_rec.reference_document            := :new.reference_document;
    l_rec.warrant_arrested_type         := :new.warrant_arrested_type;
    l_rec.criminal_case_number          := :new.criminal_case_number;
    l_rec.arrested_description          := :new.arrested_description;
    l_rec.arrested_status               := :new.arrested_status;
    l_rec.decided_case_number           := :new.decided_case_number;
    l_rec.arrested_warrant_expiry_date  := :new.arrested_warrant_expiry_date;
    l_rec.related_document              := :new.related_document;
    l_rec.arrested_warrant_number       := :new.arrested_warrant_number;
    l_rec.arrested_warrant_date         := :new.arrested_warrant_date;
    l_rec.arrested_warrant_year         := :new.arrested_warrant_year;
    l_rec.undecided_case_number         := :new.undecided_case_number;
    l_rec.travel_permit                 := :new.travel_permit;
    l_rec.travel_permit_from            := :new.travel_permit_from;
    l_rec.travel_permit_to              := :new.travel_permit_to;
    l_rec.travel_permit_date_insert     := :new.travel_permit_date_insert;
    l_rec.travel_permit_date_delete     := :new.travel_permit_date_delete;
    l_rec.travel_permit_note            := :new.travel_permit_note;
    l_rec.owner_data                    := :new.owner_data;
    l_rec.other_description             := :new.other_description;
    l_rec.contact_telephone_number      := :new.contact_telephone_number;
    l_rec.contact_owner_data            := :new.contact_owner_data;
    l_rec.associated_behavior           := :new.associated_behavior;
    l_rec.other                         := :new.other;
    l_rec.case_type                     := :new.case_type;
    l_rec.ostay_creation_date           := :new.ostay_creation_date;
    l_rec.ostay_self_indictment         := :new.ostay_self_indictment;
    l_rec.ostay_status                  := :new.ostay_status;
    l_rec.ostay_no_days                 := :new.ostay_no_days;
    l_rec.ostay_arrival_date            := :new.ostay_arrival_date;
    l_rec.ostay_departure_date          := :new.ostay_departure_date;
    l_rec.ostay_tm6                     := :new.ostay_tm6;
    l_rec.ostay_block_period            := :new.ostay_block_period;
    l_rec.ostay_notice                  := :new.ostay_notice;
    l_rec.lost_pp_lost_date             := :new.lost_pp_lost_date;
    l_rec.lost_pp_last_place            := :new.lost_pp_last_place;
    l_rec.lost_pp_notify_date           := :new.lost_pp_notify_date;
    l_rec.lost_pp_notify_place          := :new.lost_pp_notify_place;
    l_rec.lost_pp_visa_on_arriv         := :new.lost_pp_visa_on_arriv;
    l_rec.lost_pp_visa_exp_date         := :new.lost_pp_visa_exp_date;
    l_rec.lost_pp_notice                := :new.lost_pp_notice;
    l_rec.lost_pp_new_pp_type           := :new.lost_pp_new_pp_type;
    l_rec.lost_pp_new_pp_number         := :new.lost_pp_new_pp_number;
    l_rec.lost_pp_new_pp_issue_date     := :new.lost_pp_new_pp_issue_date;
    l_rec.lost_pp_new_pp_place_of_issue := :new.lost_pp_new_pp_place_of_issue;
    l_rec.lost_pp_new_pp_expire_date    := :new.lost_pp_new_pp_expire_date;

    dl_blacklist.pkg_db_access.put_blacklistcase(pi_case         => l_rec,
                                                 po_blacklist_id => l_blacklist_case_id);

    dl_blacklist.pkg_camunda_rest.update_biometrics(i_biometric_json    => :new.biometric_json,
                                                    i_blacklist_case_id => :new.id);

END trg_iou_v_blacklist_cases;
/
ALTER TRIGGER "DL_BLACKLIST"."TRG_IOU_V_BLACKLIST_CASES" ENABLE;
