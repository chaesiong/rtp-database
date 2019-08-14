CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BLACKLIST"."PKG_OPERATING" AUTHID DEFINER IS

    -- Author  : E1NKLAMANN
    -- Created : 2018-05-22
    -- Purpose : Operations

    -- set lifetime to 84400 for all images which are no longer referenced by fases or fingerprints
    PROCEDURE reset_lifetime_unreferenced_images;

    PROCEDURE delete_case(pi_case_id IN pkg_utils.id_t);

    PROCEDURE delete_cases_for_abis_id(pi_abis_id IN NUMBER);
    -- dont use this in production !
    PROCEDURE delete_cases_without_biometric;

END pkg_operating;
/
