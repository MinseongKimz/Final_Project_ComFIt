SELECT COUNT(*)
FROM TAB
WHERE TABTYPE = 'VIEW';
--==>> 49
--==>> 76

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

-- �� �ش� �ù��ǰ�� ���� ���� �� ���� �������� ��ȯ'
SELECT B.BID_PRICE
FROM 
(
SELECT BID_PRICE
FROM BID_LIST
ORDER BY BID_DATE DESC;
) B
WHERE B.RANK = 1;

SELECT *
FROM BID_LIST;
-- �� ���� ���ν��� ����
CREATE OR REPLACE PROCEDURE ADD_BID
(
    V_PRICE IN BID_LIST.BID_PRICE%TYPE  -- ����
  , V_ADDRESS IN BID_LIST.ADDRESS%TYPE  -- �ּ�
  , V_ADDR_DETAIL IN BID_LIST.ADDR_DETAIL%TYPE  -- �ּһ�
  , V_U_ID  IN BID_LIST.U_ID%TYPE -- ����ڵ�
  , V_DELI_PD_ID IN BID_LIST.DELI_PD_ID%TYPE --  ��ǰ�ڵ�  

)
IS
    V_POINT             NUMBER := 0;
    V_HIGHPRICE         NUMBER := 0;
    V_BID_CHECK         NUMBER := 0; 
    V_ST_PRICE          NUMBER := 0;
    V_IMD_PRICE         NUMBER := 0;
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    
    -- ����Ʈ Ȯ��
    SELECT U_POINT INTO V_POINT
    FROM ALL_USER_POINT_VIEW2
    WHERE U_ID = V_U_ID;
    
    -- ����Ʈ�� �Է��� ���ݺ��� ���ٸ� ���Է�
    IF V_POINT < V_PRICE
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
       
    -- �ش� ��ǰ�� ������Ͽ� �ִ��� Ȯ�� ������ 0 ��ȯ
    SELECT COUNT(*) INTO V_BID_CHECK
     FROM BID_LIST
    WHERE DELI_PD_ID = V_DELI_PD_ID;
    
    -- ���۰���Ȯ��
    SELECT PD_START_PRICE INTO V_ST_PRICE
     FROM DELIVERY_PRODUCT
    WHERE DELI_PD_ID = V_DELI_PD_ID;
    
    -- ��ñ��Ű� Ȯ��
    SELECT IMD_PRICE INTO V_IMD_PRICE
     FROM DELIVERY_PRODUCT
    WHERE DELI_PD_ID = V_DELI_PD_ID;
    
    IF V_IMD_PRICE < V_PRICE
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
     -- �ִٸ� ����Ȯ�� V_HIGHPRICE
    IF V_BID_CHECK != 0
        THEN
         SELECT B.BID_PRICE INTO V_HIGHPRICE
          FROM
            (
             SELECT BID_PRICE, RANK() OVER(ORDER BY BID_PRICE DESC) AS RANK
             FROM BID_LIST
             WHERE DELI_PD_ID = V_DELI_PD_ID
            )B
          WHERE B.RANK = 1;
    END IF;

    
    -- ��������Ʈ �����ϸ鼭, ������ ������ ������ ������ �ְ����� ���ٸ� �ٷ� �μ�Ʈ
    IF V_BID_CHECK != 0 AND V_PRICE > V_HIGHPRICE AND V_PRICE > V_ST_PRICE        
        THEN    -- �Է�
            INSERT INTO BID_LIST(BID_CODE, BID_PRICE, ADDRESS, ADDR_DETAIL, U_ID, DELI_PD_ID)
            VALUES (CONCAT('bid_', TO_CHAR(BID_SEQ.NEXTVAL) ), V_PRICE, V_ADDRESS, V_ADDR_DETAIL, V_U_ID, V_DELI_PD_ID);
    -- ��������Ʈ�� �������� �����鼭(ù��°�����̸鼭) ������ ������ ���۰����� ���ٸ� �ٷ� �μ�Ʈ            
    ELSIF V_BID_CHECK = 0 AND V_PRICE > V_ST_PRICE        
        THEN
            INSERT INTO BID_LIST(BID_CODE, BID_PRICE, ADDRESS, ADDR_DETAIL, U_ID, DELI_PD_ID)
            VALUES (CONCAT('bid_', TO_CHAR(BID_SEQ.NEXTVAL) ), V_PRICE, V_ADDRESS, V_ADDR_DETAIL, V_U_ID, V_DELI_PD_ID);
    ELSE   
        RAISE USER_DEFINE_ERROR;
    END IF;
    
       
    COMMIT;    

    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003, '�μ�Ʈ���� �߻�');
            ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;     
END ADD_BID;
--==>> Procedure ADD_BID��(��) �����ϵǾ����ϴ�.

-- �� ���� ���ν��� ȣ��(1) ���� ������ ���۰����� �������
EXEC ADD_BID( 1, '��õ������ �߱� ����2��', '����Ʈ�ջ�Ÿ�', 'test36', 'deli_20');     
--==>> ORA-20003: �μ�Ʈ���� �߻�
-- �� ���� ���ν��� ȣ��(2) �� ����Ʈ���� ���� �����õ��ϴ� ���
EXEC ADD_BID( 333333333, '��õ������ �߱� ����2��', '����Ʈ�ջ�Ÿ�', 'test36', 'deli_20');    
--==>> ORA-20003: �μ�Ʈ���� �߻�
-- �� ���� ���ν��� ȣ��(3) ���������� �����ϴ� ���
EXEC ADD_BID( 200003, '��õ������ �߱� ����2��', '����Ʈ�ջ�Ÿ�', 'test36', 'deli_20');    
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
SELECT *
 FROM BID_LIST;
WHERE DELI_PD_ID = 'deli_20';
--==>> deli_9	2022-06-19	200003	��õ������ �߱� ����2��	����Ʈ�ջ�Ÿ�	test36	deli_20	1    
-- �� ���� ���ν��� ȣ��(4) ���� ���ݺ��� �����ϴ� ���
EXEC ADD_BID( 200001, '��õ������ �߱� ����2��', '����Ʈ�ջ�Ÿ�', 'test36', 'deli_20');        
--==>> ORA-20003: �μ�Ʈ���� �߻�
COMMIT;

--==>> �����ְ� ���� 
SELECT B.BID_PRICE
     FROM
        (
         SELECT BID_PRICE, RANK() OVER(ORDER BY BID_PRICE DESC) AS RANK
         FROM BID_LIST
         WHERE DELI_PD_ID = 'deli_20'
        )B
     WHERE B.RANK = 1; 
    
SELECT IMD_PRICE
FROM DELIVERY_PRODUCT
WHERE DELI_PD_ID = 'deli_20';

-- �� ����Ʈ��ȸ
SELECT *
FROM ALL_USER_POINT_VIEW2;

-- �� �ش� ��ǰ�� ������ �ִ��� ��ȯ
SELECT *
 FROM BID_LIST
WHERE DELI_PD_ID = 'deli_1';

ROLLBACK;

SELECT *
FROM BID_LIST;
COMMIT;    
INSERT INTO BID_LIST(BID_CODE, BID_PRICE, ADDRESS, ADDR_DETAIL, U_ID, DELI_PD_ID)
VALUES (CONCAT('bid_', TO_CHAR(BID_SEQ.NEXTVAL) ), 160000, '��õ������ �߱� ����2��', '����Ʈ�ջ�Ÿ�', 'test33', 'deli_1');

ROLLBACK;
-- �������� ����
SELECT BID_PRICE
FROM
(
SELECT BID_PRICE, RANK() OVER(ORDER BY BID_PRICE DESC) AS RANK
FROM BID_LIST
WHERE DELI_PD_ID = 'deli_1'
)B
WHERE B.RANK = 1;
     
     
SELECT COUNT(*) AS COUNT
FROM BID_LIST
WHERE DELI_PD_ID = 'deli_1';

COMMIT;

CREATE SEQUENCE BID_SEQ
NOCACHE;

-- �� ��� ���� ������ '0' ��ȯ�ϴ� ������
SELECT  ROUND(REMAIN_DATE-SYSDATE) AS END_DATE
FROM
(
SELECT (PD_REGIT_DATE+5) AS REMAIN_DATE
		FROM DELI_PD_LIST_REALVIEW
		WHERE PD_ID = 'deli_1'
) ;


-- �� �������� ���ν��� ����
-- ���� ���� �Ϸ� -> ��ñ��Ű��� ����
-- �����Ϸ�Ǹ�
-- �������� ���̺� �μ�Ʈ(BS_ID, BID_CODE)
INSERT INTO BID_SUCCESS(BS_ID, BID_CODE)
VALUES(CONCAT('bs_', BS_SEQ.NEXTVAL), (SELECT BID_CODE
                                         FROM BID_LIST
                                        WHERE BID_CODE = 'deli_9'));
ROLLBACK;
SELECT *
FROM SEQ;
COMMIT;
SELECT BID_CODE
FROM BID_LIST
WHERE BID_CODE = 'deli_9';

CREATE SEQUENCE BS_SEQ
NOCACHE;
--==>> Sequence BS_SEQ��(��) �����Ǿ����ϴ�.

SELECT *
FROM BID_SUCCESS;


INSERT INTO BID_SUCCESS(BS_ID, BID_CODE)
VALUES(CONCAT('bs_', BS_SEQ.NEXTVAL), BID_CODE);

SELECT * FROM BID_LIST WHERE BID_CODE = 'bid_9'
;
                                        
DELETE
FROM BID_LIST
WHERE BID_CODE = 'deli_15';                                        

COMMIT;

FROM BID_SUCCESS
WHERE BS_ID = 'bis_3';
COMMIT;
-- �� �ش� ��ǰ�� �ش� ȸ���� ���������� �ߴٸ� :
SELECT COUNT(*) AS US_CHECK
FROM SUGGEST_LIST
WHERE DIRE_PD_ID = 'dire_2' AND U_ID = 'test';

-- �� �� ����
CREATE OR REPLACE VIEW USER_SELL_COUNT_VIEW
AS
SELECT SELL_CODE, U_ID
FROM
(
SELECT DCS.DIRE_COMP_SELL_ID AS SELL_CODE, DP.U_ID AS U_ID
FROM DIRE_COMPLETE_SELL DCS JOIN SELECTED S
     ON DCS.SELECTED_ID = S.SELECTED_ID
        JOIN SUGGEST_LIST SL
          ON S.SUGGEST_CODE = SL.SUGGEST_CODE
             JOIN DIRECT_PRODUCT DP 
               ON SL.DIRE_PD_ID = DP.DIRE_PD_ID
UNION ALL
SELECT DCS.DELI_COMP_SELL_ID AS SELL_CODE, DP.U_ID AS U_ID
FROM DELI_COMPLETE_SELL DCS JOIN BID_SUCCESS BS
     ON DCS.BS_ID = BS.BS_ID
        JOIN BID_LIST BL
          ON BS.BID_CODE = BL.BID_CODE
             JOIN DELIVERY_PRODUCT DP
               ON BL.DELI_PD_ID = DP.DELI_PD_ID
) US;
--==>> View USER_SELL_COUNT_VIEW��(��) �����Ǿ����ϴ�.

SELECT BID_CODE, U_NICKNAME, PRICE, BID_DATE, ADDRESS, PROFILE
		FROM BID_LIST_REALVIEW
		WHERE DELI_PD_ID = 'deli_20'
		ORDER BY PRICE desc;

COMMIT;


SELECT * FROM BID_LIST WHERE DELI_PD_ID = 'deli_20' AND U_ID = 'test33';

SELECT *
FROM BID_SUCCESS;
WHERE BS_ID ='bs_4';

DELETE
FROM BID_LIST;

DELETE
FROM BID_LIST
WHERE BID_CODE = 'bid_16';
-- �� �ش� ��ǰ�� ���� �Ǿ����� ��ȸ
SELECT BS.BS_ID AS BS_ID, BS.BID_CODE AS BID_CODE, BL.BID_PRICE AS FINAL_PRICE
     , BL.U_ID AS U_ID, BL.DELI_PD_ID AS PD_ID
FROM BID_SUCCESS BS JOIN BID_LIST BL
     ON BS.BID_CODE = BL.BID_CODE
WHERE BL.DELI_PD_ID = 'deli_1' ;
--==>> bs_1	bid_1	155000	test1	deli_1


COMMIT;
-- �� �ش� ��ǰ�� ���� �Ǿ����� ��ȸ
SELECT COUNT(*) AS BUY_COUNT
FROM BID_SUCCESS BS JOIN BID_LIST BL
     ON BS.BID_CODE = BL.BID_CODE
WHERE BL.DELI_PD_ID = 'deli_1';

-- �� �ش� ��ǰ�� ������ ����� �����Ͽ����� ��ȸ
SELECT COUNT(*) AS BS_COUNT
FROM BID_SUCCESS BS JOIN BID_LIST BL
     ON BS.BID_CODE = BL.BID_CODE
WHERE BL.DELI_PD_ID = 'deli_20' AND BL.U_ID = 'test33';
SELECT *
FROM BID_LIST;

-- �� ������ ��ǰ�� �����ڵ�� ������ ��ȸ
SELECT BL.BID_CODE, BL.BID_PRICE AS FINAL_PRICE
FROM BID_SUCCESS BS JOIN BID_LIST BL
      ON BS.BID_CODE = BL.BID_CODE
WHERE BL.DELI_PD_ID = 'd320';      

SELECT ROUND(SYSDATE - PD_HOPE_EDATE) AS END_DATE
FROM DIRECT_PRODUCT
WHERE DIRE_PD_ID = 'dire_1';


-- �� ���� ������ ��ȸ
SELECT BID_PRICE
FROM BID_LIST
WHERE DELI_PD_ID = 'deli_3';



-- �� ���簡�ݿ��� ���� �������� ��ȸ
SELECT B.BID_PRICE AS NOW_PRICE
  FROM
            (
             SELECT BID_PRICE, RANK() OVER(ORDER BY BID_PRICE DESC) AS RANK
             FROM BID_LIST
             WHERE DELI_PD_ID = 'deli_3'
            )B
WHERE B.RANK = 1;
          
-- �� ������ �����Ѵٸ�
SELECT COUNT(*)
FROM BID_LIST
WHERE DELI_PD_ID='deli_3'
          
deli_9
deli_12





