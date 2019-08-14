CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."PKG_IDENTITIES" IS

  /*******************************************************************************
  * Defines several functions to manage the identity information or the abis status
  * information of a person
  *
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------*
  * CHageman  18.10.2018  Added
  *******************************************************************************/

  c_scope_prefix constant varchar2(62 char) := lower($$plsql_unit_owner) || '.' || lower($$plsql_unit) || '.';

  /**
   * Saves the given information into the table identities
   *
   * @param p_identity_rec Record of the identity
   * @return identities.key_value%TYPE  Key value of the inserted or updated identity
   */
  FUNCTION save_identity (p_identity_rec IN dl_bordercontrol.identities%ROWTYPE)
  RETURN identities.key_value%TYPE
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'save_identity';
    l_params logger.tab_param;
    --
    l_result identities.key_value%TYPE;

  BEGIN

    logger.append_param(l_params, 'p_identity_rec.identity', p_identity_rec.identity);
    logger.append_param(l_params, 'p_identity_rec.brddocid', p_identity_rec.brddocid);
    logger.append_param(l_params, 'p_identity_rec.source', p_identity_rec.source);
    logger.log('SAVE IDENTITY: start', l_scope, null, l_params);

    IF p_identity_rec.key_value IS NULL
    THEN

      INSERT INTO identities
      VALUES p_identity_rec
      RETURNING key_value INTO l_result;

    ELSE

      UPDATE identities
         SET identity = p_identity_rec.identity
            ,source = p_identity_rec.source
       WHERE key_value = p_identity_rec.key_value;

       l_result := p_identity_rec.key_value;
    END IF;

    logger.append_param(l_params, 'l_result', l_result);
    logger.log('SAVE IDENTITY: done', l_scope, null, l_params);

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('SAVE IDENTITY: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END save_identity;

  /**
   * Returns a new biometric / bio id to save new information or a new identity into
   * the bio_identitites table
   *
   * @return bio_identities.bio_id Key of new identity
   */
  FUNCTION get_new_bio_id
  RETURN identities.identity%TYPE
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'get_new_bio_id';
    l_params logger.tab_param;
    --
    l_result identities.identity%TYPE;

  BEGIN

    logger.log('GET NEW BIO ID: start', l_scope, null, l_params);

    l_result := SYS_GUID();

    logger.append_param(l_params, 'l_result', l_result);
    logger.log('GET NEW BIO ID: done', l_scope, null, l_params);
    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('GET NEW BIO ID: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END get_new_bio_id;

  /**
   * Merges the given identities by the newest passport / document
   *
   * @param p_borderdocuments_tab Table of Borderdocuments that should be changed
   * @param p_merge_borderdocument Borderdocument that called this function
   * @return identities.identity%TYPE Identity ID of the table IDENTITY (to group all the given borderdocuments)
   */
  FUNCTION merge_identities (p_borderdocuments_tab  IN pkg_borderdocuments.t_borderdocuments_tab
                            ,p_merge_borderdocument IN borderdocuments%ROWTYPE)
  RETURN identities.identity%TYPE
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'merge_identities';
    l_params logger.tab_param;
    --
    l_result                    identities.identity%TYPE;
    l_result_borderdocument_rec borderdocuments%ROWTYPE;
    --
    l_change_brddocids          t_varchar32_tab;

  BEGIN

    logger.append_param(l_params, 'p_borderdocuments_tab.COUNT', p_borderdocuments_tab.COUNT); -- TODO: Funktioniert das auch mit einem leeren Array?
    logger.append_param(l_params, 'p_merge_borderdocument.brddocid', p_merge_borderdocument.brddocid);
    logger.log('MERGE IDENTITIES: start', l_scope, null, l_params);

    -- get the newest passport to change the identities
    l_result_borderdocument_rec := p_merge_borderdocument;
    l_change_brddocids(1) := p_merge_borderdocument.brddocid;

    IF p_borderdocuments_tab.COUNT > 0
    THEN

      FOR i IN 1 .. p_borderdocuments_tab.COUNT
      LOOP

        CASE
          WHEN p_borderdocuments_tab(i).expirydate > l_result_borderdocument_rec.expirydate THEN l_result_borderdocument_rec := p_borderdocuments_tab(i);
          ELSE NULL;
        END CASE;

        l_change_brddocids(l_change_brddocids.COUNT + 1) := p_borderdocuments_tab(i).brddocid;
      END LOOP;

      -- select identity
      BEGIN
        SELECT identity
          INTO l_result
          FROM identities
         WHERE brddocid = l_result_borderdocument_rec.brddocid;

      EXCEPTION
        WHEN NO_DATA_FOUND
        THEN
          l_result := get_new_bio_id();
      END;

      -- loop borderdocuments to change the identities
      FOR l_identities_rec IN (SELECT *
                                FROM identities
                                WHERE brddocid IN (SELECT column_value
                                                    FROM TABLE(l_change_brddocids)))
      LOOP

        l_identities_rec.identity  := l_result;
        l_identities_rec.key_value := save_identity(l_identities_rec);
      END LOOP;
    END IF;

    logger.append_param(l_params, 'l_result', l_result);
    logger.log('MERGE IDENTITIES: done', l_scope, null, l_params);

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('MERGE IDENTITIES: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END merge_identities;

END;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_IDENTITIES" TO "DERMALOG_PROXY";
