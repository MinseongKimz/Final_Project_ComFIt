
--==>> ���������� �ڼ�������
SELECT U_EMAIL, U_NICKNAME, U_NAME
, SUBSTR(CRYPTPACK.DECRYPT(U_PASSWORD,'1234'),1,1) 
|| LPAD('*',LENGTH(CRYPTPACK.DECRYPT(U_PASSWORD,'1234'))-1,'*') as U_PASSWORD
, U_TEL, U_ADDRESS
FROM USER_INFORMATION
WHERE U_ID = 'test1';


--==>>
/*
issac1162@test.com	���̿�	        1***	010-2988-1162	��õ������ �߱� ���ﵿ1�� 6-4
kkk@naver.com	    �μ�Ŵ��Ȱ��	1***	010-2222-3333	����Ư���� �߱� ������ 5�� 223-4
hjui78@naver.com	���	        1***	010-1111-1111	��õ ��籸 ������ 112���� 12 405�� 1703ȣ
*/

--==>> MYPAGE ��¿�
SELECT U_NICKNAME, U_PROFILE
FROM USER_INFORMATION
WHERE U_ID = 'test1';


--==>> ����� ���� VIEW �����
CREATE OR REPLACE VIEW MONEY_INOUT_VIEW
AS
SELECT IN_M_ID AS M_ID, IN_DATE AS M_DATE, IN_MONEY AS M_MONEY, U_ID   
FROM INPUT_MONEY
UNION
SELECT OUT_M_ID AS M_ID, OUT_DATE AS M_DATE, OUT_MONEY AS M_MONEY, U_ID
FROM OUTPUT_MONEY;

SELECT *
FROM MONEY_INOUT_VIEW;

--==>>
/*
inm_1	2022-06-10	500000	test1
outm_1	2022-06-10	500000	test1
*/

--==>> ������������ �����ֱ� ���� �� �߰�+�� �̸� ��ȯ, ��¥�� ����
--> �������� �ش��ι��� ����ݳ��� ���
SELECT M_DATE, M_MONEY
, CASE WHEN SUBSTR(M_ID,1,3) = 'inm' THEN '�Ա�'
        WHEN SUBSTR(M_ID,1,4) = 'outm' THEN '���'
    ELSE '����' END AS INOUT
FROM MONEY_INOUT_VIEW
WHERE U_ID = 'test1';

SELECT POINT
FROM ALL_USER_POINT_VIEW
WHERE U_ID = 'test1';

--==>> �Ǹ� ������	���� �ݾ�	��ǰ����	���	���� ���	���ŷ� ���� �Ͻ�	���� �ŷ� �Ͻ�	����
--BIDCOUNT = ���� ����
--�ŷ����� : ���� �޴� ��(����/���� ����)              : BIDCOUNT = 0
--         : ��� ��(����/���� �Ұ���)                 : BIDCOUNT > 0
--         : �ŷ� ��(���� �Ϸ�)                        : SUCCESSCOUNT = 1, COMPLETECOUNT = 0
--         : ����Ȯ�� �����(����Ȯ���ϸ� �ŷ��Ϸ�)    : SELLCOUNT = 1, BUYCOUNT = 0
--         : �Ǹ�Ȯ�� �����(�Ǹ�Ȯ���ϸ� �ŷ��Ϸ�)    : BUYCOUNT = 1, SELLCOUNT = 0
--         : �ŷ� �Ϸ�(�Ǹ��ڰ� POINT�� ���� ����)     : COMPLETECOUNT = 2

SELECT DP.DELI_PD_ID, DP.PD_TITLE, DP.PD_START_PRICE, DP.PD_REGIT_DATE, DP.U_ID, DP.IMD_PRICE
, (SELECT COUNT(*)
            FROM BID_LIST
            WHERE DELI_PD_ID = DP.DELI_PD_ID) AS BIDCOUNT
FROM DELIVERY_PRODUCT DP
    JOIN BID_LIST BL
    ON BL.DELI_PD_ID = DP.DELI_PD_ID
    JOIN BID_SUCCESS BS
    ON BS.BID_CODE = BL.BID_CODE
    JOIN DELI_COMPLETE_SELL DCS
    ON DCS.BS_ID = BS.BS_ID
    JOIN DELI_COMPLETE_BUY DCV
    ON DCV.BS_ID = BS.BS_ID;
    
SELECT *
FROM BID_LIST;




SELECT *
FROM DIRE_PD_LIST_REALVIEW;

SELECT *
FROM DIRECT_PRODUCT;
