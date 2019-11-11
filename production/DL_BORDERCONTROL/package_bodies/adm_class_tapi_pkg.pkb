CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."ADM_CLASS_TAPI_PKG" IS

 /*******************************************************************************
  * This package defines the Table API for the ADM_CLASS_*-tables which are used
  * to provide the usage and administration of administrative classifications of
  * the country (in this case: Thailand)
  *
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------*
  * CHageman  02.03.2018  Body added
  *******************************************************************************/

  /**
   * saves the given record into the table adm_class_region
   *  (*) if there is no key_value set a new datasate will be created
   *  (*) if there is a key_value set the existing dataset will be updated
   *
   * this definition can only contain english translations (locale = en_US)
   * for other translations use the procedure save_region_trans
   *
   * Fields that need to be filled:
   *   (*) key_value (on update)
   *   (*) display_value (english)
   *   (*) display_code
   *
   * @param p_adm_class_region_rec Record of table adm_class_region
   */
  PROCEDURE save_region (p_adm_class_region_rec IN OUT t_adm_class_region)
  IS

    l_region_rec  adm_class_tapi_pkg.t_adm_class_region := p_adm_class_region_rec;

  BEGIN

    -- TODO: Could insert validations here

    -- INSERT
    IF l_region_rec.key_value IS NULL
    THEN

      INSERT
        INTO adm_class_region
      VALUES l_region_rec
      RETURNING key_value INTO l_region_rec.key_value;

    -- UPDATE
    ELSE

      UPDATE adm_class_region
         SET row = l_region_rec
       WHERE key_value = l_region_rec.key_value;

    END IF;

    p_adm_class_region_rec := l_region_rec;

  END save_region;

  /**
   * saves the given record into the table adm_class_region$i18n
   * all other locale definitions (not allowed: en_US) can be inserted
   *
   * Fields that need to be filled:
   *   (*) key_value
   *   (*) locale
   *   (*) display_value
   *
   * @param p_adm_class_region_rec Record of table adm_class_region
   */
  PROCEDURE save_region_trans (p_adm_class_region_trans_rec IN OUT t_adm_class_region_trans)
  IS

    l_region_trans_rec  adm_class_tapi_pkg.t_adm_class_region_trans := p_adm_class_region_trans_rec;
    l_check             PLS_INTEGER := 0;

  BEGIN

    -- TODO: Could insert validations here

    -- check if a translation for this combination already exists
    BEGIN

      SELECT 1
        INTO l_check
        FROM adm_class_region$i18n
       WHERE key_value = l_region_trans_rec.key_value
         AND locale    = l_region_trans_rec.locale;

    EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
        NULL;
    END;

    -- INSERT
    IF l_check = 0
    THEN

      INSERT
        INTO adm_class_region$i18n
      VALUES l_region_trans_rec;

    -- UPDATE
    ELSE

      UPDATE adm_class_region$i18n
         SET row = l_region_trans_rec
       WHERE key_value = l_region_trans_rec.key_value
         AND locale    = l_region_trans_rec.locale;

    END IF;

    p_adm_class_region_trans_rec := l_region_trans_rec;

  END save_region_trans;

  /**
   * deletes the dataset that is found by the given primary key value
   * all other translations are also deleted
   *
   * @param p_key_value PK-value of the dataset that should be deleted
   */
  PROCEDURE del_region_by_pk (p_key_value IN adm_class_region.key_value%TYPE)
  IS

  BEGIN

    -- TODO: Could insert validations here

    DELETE FROM adm_class_region
     WHERE key_value = p_key_value;

  END del_region_by_pk;

  /**
   * saves the given record into the table adm_class_province
   *  (*) if there is no key_value set a new datasate will be created
   *  (*) if there is a key_value set the existing dataset will be updated
   *
   * this definition can only contain english translations (locale = en_US)
   * for other translations use the procedure save_province_trans
   *
   * Fields that need to be filled:
   *   (*) key_value (on update)
   *   (*) display_value (english)
   *   (*) display_code
   *
   * @param p_adm_class_province_rec Record of table adm_class_province
   */
  PROCEDURE save_province (p_adm_class_province_rec IN OUT t_adm_class_province)
  IS

    l_province_rec  adm_class_tapi_pkg.t_adm_class_province := p_adm_class_province_rec;

  BEGIN

    -- TODO: Could insert validations here

    -- INSERT
    IF l_province_rec.key_value IS NULL
    THEN

      INSERT
        INTO adm_class_province
      VALUES l_province_rec
      RETURNING key_value INTO l_province_rec.key_value;

    -- UPDATE
    ELSE

      UPDATE adm_class_province
         SET row = l_province_rec
       WHERE key_value = l_province_rec.key_value;

    END IF;

    p_adm_class_province_rec := l_province_rec;

  END save_province;

  /**
   * saves the given record into the table adm_class_province$i18n
   * all other locale definitions (not allowed: en_US) can be inserted
   *
   * Fields that need to be filled:
   *   (*) key_value
   *   (*) locale
   *   (*) display_value
   *
   * @param p_adm_class_province_rec Record of table adm_class_province
   */
  PROCEDURE save_province_trans (p_adm_class_province_trans_rec IN OUT t_adm_class_province_trans)
  IS

    l_province_trans_rec  adm_class_tapi_pkg.t_adm_class_province_trans := p_adm_class_province_trans_rec;
    l_check               PLS_INTEGER := 0;

  BEGIN

    -- TODO: Could insert validations here

    -- check if a translation for this combination already exists
    BEGIN

      SELECT 1
        INTO l_check
        FROM adm_class_province$i18n
       WHERE key_value = l_province_trans_rec.key_value
         AND locale    = l_province_trans_rec.locale;

    EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
        NULL;
    END;

    -- INSERT
    IF l_check = 0
    THEN

      INSERT
        INTO adm_class_province$i18n
      VALUES l_province_trans_rec;

    -- UPDATE
    ELSE

      UPDATE adm_class_province$i18n
         SET row = l_province_trans_rec
       WHERE key_value = l_province_trans_rec.key_value
         AND locale    = l_province_trans_rec.locale;

    END IF;

    p_adm_class_province_trans_rec := l_province_trans_rec;

  END save_province_trans;

  /**
   * deletes the dataset that is found by the given primary key value
   * all other translations are also deleted
   *
   * @param p_key_value PK-value of the dataset that should be deleted
   */
  PROCEDURE del_province_by_pk (p_key_value IN adm_class_province.key_value%TYPE)
  IS

  BEGIN

    -- TODO: Could insert validations here

    DELETE FROM adm_class_province
     WHERE key_value = p_key_value;

  END del_province_by_pk;

  /**
   * saves the given record into the table adm_class_district
   *  (*) if there is no key_value set a new datasate will be created
   *  (*) if there is a key_value set the existing dataset will be updated
   *
   * this definition can only contain english translations (locale = en_US)
   * for other translations use the procedure save_district_trans
   *
   * Fields that need to be filled:
   *   (*) key_value (on update)
   *   (*) display_value (english)
   *   (*) display_code
   *
   * @param p_adm_class_district_rec Record of table adm_class_district
   */
  PROCEDURE save_district (p_adm_class_district_rec IN OUT t_adm_class_district)
  IS

    l_district_rec  adm_class_tapi_pkg.t_adm_class_district := p_adm_class_district_rec;

  BEGIN

    -- TODO: Could insert validations here

    -- INSERT
    IF l_district_rec.key_value IS NULL
    THEN

      INSERT
        INTO adm_class_district
      VALUES l_district_rec
      RETURNING key_value INTO l_district_rec.key_value;

    -- UPDATE
    ELSE

      UPDATE adm_class_district
         SET row = l_district_rec
       WHERE key_value = l_district_rec.key_value;

    END IF;

    p_adm_class_district_rec := l_district_rec;

  END save_district;

  /**
   * saves the given record into the table adm_class_district$i18n
   * all other locale definitions (not allowed: en_US) can be inserted
   *
   * Fields that need to be filled:
   *   (*) key_value
   *   (*) locale
   *   (*) display_value
   *
   * @param p_adm_class_district_rec Record of table adm_class_district
   */
  PROCEDURE save_district_trans (p_adm_class_district_trans_rec IN OUT t_adm_class_district_trans)
  IS

    l_district_trans_rec  adm_class_tapi_pkg.t_adm_class_district_trans := p_adm_class_district_trans_rec;
    l_check               PLS_INTEGER := 0;

  BEGIN

    -- TODO: Could insert validations here

    -- check if a translation for this combination already exists
    BEGIN

      SELECT 1
        INTO l_check
        FROM adm_class_district$i18n
       WHERE key_value = l_district_trans_rec.key_value
         AND locale    = l_district_trans_rec.locale;

    EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
        NULL;
    END;

    -- INSERT
    IF l_check = 0
    THEN

      INSERT
        INTO adm_class_district$i18n
      VALUES l_district_trans_rec;

    -- UPDATE
    ELSE

      UPDATE adm_class_district$i18n
         SET row = l_district_trans_rec
       WHERE key_value = l_district_trans_rec.key_value
         AND locale    = l_district_trans_rec.locale;

    END IF;

    p_adm_class_district_trans_rec := l_district_trans_rec;

  END save_district_trans;

  /**
   * deletes the dataset that is found by the given primary key value
   * all other translations are also deleted
   *
   * @param p_key_value PK-value of the dataset that should be deleted
   */
  PROCEDURE del_district_by_pk (p_key_value IN adm_class_district.key_value%TYPE)
  IS

  BEGIN

    -- TODO: Could insert validations here

    DELETE FROM adm_class_district
     WHERE key_value = p_key_value;

  END del_district_by_pk;

  /**
   * saves the given record into the table adm_class_subdistrict
   *  (*) if there is no key_value set a new datasate will be created
   *  (*) if there is a key_value set the existing dataset will be updated
   *
   * this definition can only contain english translations (locale = en_US)
   * for other translations use the procedure save_subdistrict_trans
   *
   * Fields that need to be filled:
   *   (*) key_value (on update)
   *   (*) display_value (english)
   *   (*) display_code
   *
   * @param p_adm_class_subdistrict_rec Record of table adm_class_subdistrict
   */
  PROCEDURE save_subdistrict (p_adm_class_subdistrict_rec IN OUT t_adm_class_subdistrict)
  IS

    l_subdistrict_rec  adm_class_tapi_pkg.t_adm_class_subdistrict := p_adm_class_subdistrict_rec;

  BEGIN

    -- TODO: Could insert validations here

    -- INSERT
    IF l_subdistrict_rec.key_value IS NULL
    THEN

      INSERT
        INTO adm_class_subdistrict
      VALUES l_subdistrict_rec
      RETURNING key_value INTO l_subdistrict_rec.key_value;

    -- UPDATE
    ELSE

      UPDATE adm_class_subdistrict
         SET row = l_subdistrict_rec
       WHERE key_value = l_subdistrict_rec.key_value;

    END IF;

    p_adm_class_subdistrict_rec := l_subdistrict_rec;

  END save_subdistrict;

  /**
   * saves the given record into the table adm_class_subdistrict$i18n
   * all other locale definitions (not allowed: en_US) can be inserted
   *
   * Fields that need to be filled:
   *   (*) key_value
   *   (*) locale
   *   (*) display_value
   *
   * @param p_adm_class_subdistrict_rec Record of table adm_class_subdistrict
   */
  PROCEDURE save_subdistrict_trans (p_adm_class_subdistrict_trans_rec IN OUT t_adm_class_subdistrict_trans)
  IS

    l_subdistrict_trans_rec  adm_class_tapi_pkg.t_adm_class_subdistrict_trans := p_adm_class_subdistrict_trans_rec;
    l_check                  PLS_INTEGER := 0;

  BEGIN

    -- TODO: Could insert validations here

    -- check if a translation for this combination already exists
    BEGIN

      SELECT 1
        INTO l_check
        FROM adm_class_subdistrict$i18n
       WHERE key_value = l_subdistrict_trans_rec.key_value
         AND locale    = l_subdistrict_trans_rec.locale;

    EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
        NULL;
    END;

    -- INSERT
    IF l_check = 0
    THEN

      INSERT
        INTO adm_class_subdistrict$i18n
      VALUES l_subdistrict_trans_rec;

    -- UPDATE
    ELSE

      UPDATE adm_class_subdistrict$i18n
         SET row = l_subdistrict_trans_rec
       WHERE key_value = l_subdistrict_trans_rec.key_value
         AND locale    = l_subdistrict_trans_rec.locale;

    END IF;

    p_adm_class_subdistrict_trans_rec := l_subdistrict_trans_rec;

  END save_subdistrict_trans;

  /**
   * deletes the dataset that is found by the given primary key value
   * all other translations are also deleted
   *
   * @param p_key_value PK-value of the dataset that should be deleted
   */
  PROCEDURE del_subdistrict_by_pk (p_key_value IN adm_class_subdistrict.key_value%TYPE)
  IS

  BEGIN

    -- TODO: Could insert validations here

    DELETE FROM adm_class_subdistrict
     WHERE key_value = p_key_value;

  END del_subdistrict_by_pk;


END;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."ADM_CLASS_TAPI_PKG" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."ADM_CLASS_TAPI_PKG" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."ADM_CLASS_TAPI_PKG" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."ADM_CLASS_TAPI_PKG" TO "BIOSAADM";
