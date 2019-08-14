CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."ADM_CLASS_TAPI_PKG" IS

 /*******************************************************************************
  * This package defines the Table API for the ADM_CLASS_*-tables which are used
  * to provide the usage and administration of administrative classifications of
  * the country (in this case: Thailand)
  *
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------*
  * CHageman  01.03.2018  Added
  *******************************************************************************/

  /****************************************
   * ========== TYPE DEFINITIONS ==========
   ****************************************/
  SUBTYPE t_adm_class_region              IS dl_bordercontrol.adm_class_region%ROWTYPE;
  SUBTYPE t_adm_class_region_trans        IS dl_bordercontrol.adm_class_region$i18n%ROWTYPE;
  SUBTYPE t_adm_class_province            IS dl_bordercontrol.adm_class_province%ROWTYPE;
  SUBTYPE t_adm_class_province_trans      IS dl_bordercontrol.adm_class_province$i18n%ROWTYPE;
  SUBTYPE t_adm_class_district            IS dl_bordercontrol.adm_class_district%ROWTYPE;
  SUBTYPE t_adm_class_district_trans      IS dl_bordercontrol.adm_class_district$i18n%ROWTYPE;
  SUBTYPE t_adm_class_subdistrict         IS dl_bordercontrol.adm_class_subdistrict%ROWTYPE;
  SUBTYPE t_adm_class_subdistrict_trans   IS dl_bordercontrol.adm_class_subdistrict$i18n%ROWTYPE;

  /************************************************
   * ========== FUNCTIONS AND PROCEDURES ==========
   ************************************************/

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
  PROCEDURE save_region (p_adm_class_region_rec IN OUT t_adm_class_region);

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
  PROCEDURE save_region_trans (p_adm_class_region_trans_rec IN OUT t_adm_class_region_trans);

  /**
   * deletes the dataset that is found by the given primary key value
   * all other translations are also deleted
   *
   * @param p_key_value PK-value of the dataset that should be deleted
   */
  PROCEDURE del_region_by_pk (p_key_value IN adm_class_region.key_value%TYPE);

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
  PROCEDURE save_province (p_adm_class_province_rec IN OUT t_adm_class_province);

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
  PROCEDURE save_province_trans (p_adm_class_province_trans_rec IN OUT t_adm_class_province_trans);

  /**
   * deletes the dataset that is found by the given primary key value
   * all other translations are also deleted
   *
   * @param p_key_value PK-value of the dataset that should be deleted
   */
  PROCEDURE del_province_by_pk (p_key_value IN adm_class_province.key_value%TYPE);

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
  PROCEDURE save_district (p_adm_class_district_rec IN OUT t_adm_class_district);

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
  PROCEDURE save_district_trans (p_adm_class_district_trans_rec IN OUT t_adm_class_district_trans);

  /**
   * deletes the dataset that is found by the given primary key value
   * all other translations are also deleted
   *
   * @param p_key_value PK-value of the dataset that should be deleted
   */
  PROCEDURE del_district_by_pk (p_key_value IN adm_class_district.key_value%TYPE);

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
  PROCEDURE save_subdistrict (p_adm_class_subdistrict_rec IN OUT t_adm_class_subdistrict);

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
  PROCEDURE save_subdistrict_trans (p_adm_class_subdistrict_trans_rec IN OUT t_adm_class_subdistrict_trans);

  /**
   * deletes the dataset that is found by the given primary key value
   * all other translations are also deleted
   *
   * @param p_key_value PK-value of the dataset that should be deleted
   */
  PROCEDURE del_subdistrict_by_pk (p_key_value IN adm_class_subdistrict.key_value%TYPE);

END;
/
