CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BLACKLIST"."PKG_BLACKLIST_CASE" AUTHID DEFINER IS

    -- Author  : E1NKLAMANN
    -- Created : 2018-05-18 13:53:38
    -- Purpose : Handling of table BLACKLIST_CASE

    -- Public type declarations
    -- https://jira.dc.dermalog.com/browse/THA20675-485

    -- change
    -- 28.06.2018 e1jkropp  fingerprints_to_json, faces_to_json in spec.
    -- 27.01.2019 e1mtheis  handle CT_PARTIAL_DATE

    PROCEDURE delete_case(pi_case_id IN pkg_utils.id_t
                         ,po_return  OUT NOCOPY json_object_t);
    PROCEDURE insert_case$json(pi_json   IN json_object_t
                              ,po_return OUT NOCOPY json_object_t);

    -- biometrics don't get updated
    PROCEDURE update_case$json(pi_json   IN json_object_t
                              ,po_return OUT NOCOPY json_object_t);

    PROCEDURE get_case$json(pi_case_id IN pkg_utils.id_t
                           ,po_case    OUT NOCOPY json_object_t
                           ,po_return  OUT NOCOPY json_object_t);

    PROCEDURE get_faces_by_identity$json(pi_identity_id IN pkg_utils.id_t
                                        ,po_biometrics  OUT NOCOPY json_array_t
                                        ,po_return      OUT NOCOPY json_object_t);

    PROCEDURE get_cases_by_identity$json(pi_identity_id IN pkg_utils.id_t
                                        ,po_cases       OUT NOCOPY json_array_t
                                        ,po_return      OUT NOCOPY json_object_t);

    FUNCTION fingerprints_to_json(pi_fingerprints IN pkg_db_access.fingerprint_guid_1_tt) RETURN json_array_t;
    FUNCTION faces_to_json(pi_faces IN pkg_db_access.face_guid_1_tt) RETURN json_array_t;

END pkg_blacklist_case;
/
