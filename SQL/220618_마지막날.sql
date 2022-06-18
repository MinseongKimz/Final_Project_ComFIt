SELECT CASE TRUNC(SQRT((SUM(USER_EXP))/2))
       			WHEN 0
       			THEN 1
       			ELSE TRUNC(SQRT((SUM(USER_EXP))/2)) 
       			END AS USER_MY_LEVEL
		FROM USER_MYPAGE_INFO
		WHERE U_ID = 'test33';
EXEC ADD_SUGGEST(200000, '2022-06-19', '14:00:00', '��õ ûõ', '����', 'test2', 'dire_42');        

SELECT U_POINT as V_POINT
FROM ALL_USER_POINT_VIEW2
WHERE U_ID = 'test2';
SELECT *
FROM SEQ;

-- �� �ش� ��ǰ�� ���������� �ϳ��� �޷��ִٸ� ���ڹ�ȯ, ������ 0��ȯ
SELECT COUNT(*) AS SL_CHECK
FROM SUGGEST_LIST
WHERE DIRE_PD_ID = 'dire_2';

-- �� �ش� ��ǰ�� ������ �ϳ��� �޷��ִٸ� ���ڹ�ȯ, ������ 0 ��ȯ(����, ���� �Ұ�)
SELECT COUNT(*) AS BL_CHECK
FROM BID_LIST
WHERE DELI_PD_ID = 'deli_1';

-- �� �ش� ��ǰ�� ���� ������ �Ͽ��ٸ� ���� ��ȯ
SELECT COUNT(*) AS UB_CHECK
FROM BID_LIST
WHERE DELI_PD_ID = 'deli_1' AND U_ID = 'test';

SELECT *
FROM BID_LIST
WHERE DELI_PD_ID = 'deli_1';

-- �� ��� ���� ������ '0' ��ȯ�ϴ� ������
SELECT  ROUND(REMAIN_DATE-SYSDATE) AS END_DATE
FROM
(
SELECT (PD_REGIT_DATE+5) AS REMAIN_DATE
		FROM DELI_PD_LIST_REALVIEW
		WHERE PD_ID = 'deli_1'
) ;




-- �� �ش� ��ǰ�� �ش� ȸ���� ���������� �ߴٸ� :
SELECT COUNT(*) AS US_CHECK
FROM SUGGEST_LIST
WHERE DIRE_PD_ID = 'dire_2' AND U_ID = 'test';
     
