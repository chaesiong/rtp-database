		 (D.OWNER, D.NAME, D.TYPE) IN (SELECT OWNER, OBJECT_NAME, OBJECT_TYPE FROM OBJECTS)
                         *
ERROR at line 234:
ORA-06550: line 234, column 26:
PL/SQL: ORA-00920: invalid relational operator
ORA-06550: line 33, column 9:
PL/SQL: SQL Statement ignored
ORA-06550: line 401, column 56:
PLS-00103: Encountered the symbol "UNTIL" when expecting one of the following:
. ( * @ % & = - + ; < / > at in is mod remainder not rem
<an exponent (**)> <> or != or ~= >= <= <> and or like like2
like4 likec between || multiset member submultiset


