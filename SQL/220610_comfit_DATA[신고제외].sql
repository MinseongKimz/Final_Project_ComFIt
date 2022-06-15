-- [������ �Է� : 2022-06-10, ���̻� / ����]

SELECT USER
FROM DUAL;
--==>> COMFIT

-- �� ��ǰī�װ�
INSERT INTO PRODUCT_CATEGORY(PD_CATEGORY_ID, CATEGORY_NAME)
VALUES (1, 'CPU');
INSERT INTO PRODUCT_CATEGORY(PD_CATEGORY_ID, CATEGORY_NAME)
VALUES (2, '�׷���ī��');
INSERT INTO PRODUCT_CATEGORY(PD_CATEGORY_ID, CATEGORY_NAME)
VALUES (3, '�޸�');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 3

SELECT *
FROM PRODUCT_CATEGORY;
/*
1	CPU
2	�׷���ī��
3	RAM
4	���κ���
5	SSD
6	HDD
7	����HDD/SSD
8	PC���̽�
9	�Ŀ����ö���
10	Ű����
11	���콺
12	�����
13	PC����Ŀ
14	������
15	������
16	��Ʈ��
*/

UPDATE PRODUCT_CATEGORY
SET CATEGORY_NAME = '���ձ�'
WHERE PD_CATEGORY_ID = '14';


--------------------------------------------------------------------------------
DESC PRODUCT_MAKER;
-- �� ������
INSERT INTO PRODUCT_MAKER(PD_MAKER_ID, MAKER_NAME, MAKER_NAME2, PD_CATEGORY_ID)
VALUES('maker_1', '����', 'Intel', 1);
INSERT INTO PRODUCT_MAKER(PD_MAKER_ID, MAKER_NAME, MAKER_NAME2, PD_CATEGORY_ID)
VALUES('maker_2', 'AMD', '���̿���', 1);

INSERT INTO PRODUCT_MAKER(PD_MAKER_ID, MAKER_NAME, MAKER_NAME2, PD_CATEGORY_ID)
VALUES('maker_3', 'NVIDIA', '������', 2);
INSERT INTO PRODUCT_MAKER(PD_MAKER_ID, MAKER_NAME, MAKER_NAME2, PD_CATEGORY_ID)
VALUES('maker_4', 'AMD', '���̿���', 2);

INSERT INTO PRODUCT_MAKER(PD_MAKER_ID, MAKER_NAME, MAKER_NAME2, PD_CATEGORY_ID)
VALUES('maker_5', '�Ｚ', 'SAMSUNG', 3);
INSERT INTO PRODUCT_MAKER(PD_MAKER_ID, MAKER_NAME, MAKER_NAME2, PD_CATEGORY_ID)
VALUES('maker_6', 'Micron', '����ũ��', 3);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 6

SELECT *
FROM PRODUCT_MAKER;
/*
maker_1	����	Intel	        1
maker_2	AMD	    ���̿���	    1
maker_3	NVIDIA	������    	2
maker_4	AMD	    ���̿���	    2
maker_5	�Ｚ	SAMSUNG	        3
maker_6	Micron	����ũ��	    3
*/
--------------------------------------------------------------------------------
DESC PRODUCT_AS;

INSERT INTO PRODUCT_AS(PD_AS_ID, PD_AS_NAME)
VALUES(1, '���󰡴�');
INSERT INTO PRODUCT_AS(PD_AS_ID, PD_AS_NAME)
VALUES(2, '���󰡴�');
INSERT INTO PRODUCT_AS(PD_AS_ID, PD_AS_NAME)
VALUES(3, '�Ұ���');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 3

SELECT *
FROM PRODUCT_AS;
/*
1	���󰡴�
2	���󰡴�
3	�Ұ���
*/

--------------------------------------------------------------------------------
-- �� ��ǰ�Ű���� ī�װ�
DESC PD_REP_CATEGORY;

INSERT INTO PD_REP_CATEGORY(PD_REP_CID, REP_CATE_NAME)
VALUES(1, '��������');
INSERT INTO PD_REP_CATEGORY(PD_REP_CID, REP_CATE_NAME)
VALUES(2, '�ҹ�ȫ����');
INSERT INTO PD_REP_CATEGORY(PD_REP_CID, REP_CATE_NAME)
VALUES(3, '���ظ�ü��');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 3

SELECT *
FROM PD_REP_CATEGORY;
/*
1	��������
2	�ҹ�ȫ����
3	���ظ�ü��
*/

COMMIT;
--==>> Ŀ�� �Ϸ�.

--------------------------------------------------------------------------------
-- �� �ŷ��Ű���� ī�װ�
DESC TRANS_REP_CATEGORY;

INSERT INTO TRANS_REP_CATEGORY(TRANS_REP_CID, REP_CATE_NAME)
VALUES(1, 'NOSHOW');
INSERT INTO TRANS_REP_CATEGORY(TRANS_REP_CID, REP_CATE_NAME)
VALUES(2, '��ǰ�Ǻ���');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 2

SELECT *
FROM TRANS_REP_CATEGORY;
/*
1	NOSHOW
2	��ǰ�Ǻ���
*/
--------------------------------------------------------------------------------
-- �� �������� ī�װ�
INSERT INTO AUTH_CATEGORY(AU_CATE_ID,AU_NAME)
VALUES(1, '�����ȵ�');
INSERT INTO AUTH_CATEGORY(AU_CATE_ID,AU_NAME)
VALUES(2, '������');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 2

SELECT *
FROM AUTH_CATEGORY;
/*
1	�����ȵ�
2	������
*/

--------------------------------------------------------------------------------
-- �� ���� ī�װ�
INSERT INTO BANK(BANK_ID,BANK_NAME)
VALUES(1, 'KB��������');
INSERT INTO BANK(BANK_ID,BANK_NAME)
VALUES(2, '��������');
INSERT INTO BANK(BANK_ID,BANK_NAME)
VALUES(3, '����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 3

SELECT *
FROM BANK;
/*
1	KB��������
2	��������
3	����
*/


--------------------------------------------------------------------------------
-- �� �������� ī�װ�
INSERT INTO ANNOUNCE_CATEGORY(ANOUN_CATE_ID,ANOUN_CATE_NAME)
VALUES(1, '����/������Ʈ');
INSERT INTO ANNOUNCE_CATEGORY(ANOUN_CATE_ID,ANOUN_CATE_NAME)
VALUES(2, '�̺�Ʈ');
INSERT INTO ANNOUNCE_CATEGORY(ANOUN_CATE_ID,ANOUN_CATE_NAME)
VALUES(3, '����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 3

SELECT *
FROM  ANNOUNCE_CATEGORY;
/*
1	����/������Ʈ
2	�̺�Ʈ
3	����
*/

--------------------------------------------------------------------------------
-- �� ���� ī�װ�
INSERT INTO ASK_CATEGORY(ASK_CATE_ID,ASK_CATE_NAME)
VALUES(1, '�Ǹ�');
INSERT INTO ASK_CATEGORY(ASK_CATE_ID,ASK_CATE_NAME)
VALUES(2, '����');
INSERT INTO ASK_CATEGORY(ASK_CATE_ID,ASK_CATE_NAME)
VALUES(3, '�Ű�');
INSERT INTO ASK_CATEGORY(ASK_CATE_ID,ASK_CATE_NAME)
VALUES(4, '����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 4

SELECT *
FROM  ASK_CATEGORY;
/*
1	�Ǹ�
2	����
3	�Ű�
4	����
*/

--------------------------------------------------------------------------------
-- �� ���� ī�װ�
INSERT INTO BAN_CATEGORY(BAN_CATE_ID,BAN_CATE_NAME)
VALUES(1, '3������');
INSERT INTO BAN_CATEGORY(BAN_CATE_ID,BAN_CATE_NAME)
VALUES(2, '7������');
INSERT INTO BAN_CATEGORY(BAN_CATE_ID,BAN_CATE_NAME)
VALUES(3, '30������');
INSERT INTO BAN_CATEGORY(BAN_CATE_ID,BAN_CATE_NAME)
VALUES(4, '��������');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 4

SELECT *
FROM BAN_CATEGORY;
/*
1	3������
2	7������
3	30������
4	��������
*/


--------------------------------------------------------------------------------
DESC REP_HANDLE_CATEGORY;
-- �� �Ű�ó���з� ī�װ�
INSERT INTO REP_HANDLE_CATEGORY(HAN_CATE_ID, HAN_CATE_NAME)
VALUES(1, '�Ű����г�Ƽ');
INSERT INTO REP_HANDLE_CATEGORY(HAN_CATE_ID, HAN_CATE_NAME)
VALUES(2, '�ǽŰ����г�Ƽ');
INSERT INTO REP_HANDLE_CATEGORY(HAN_CATE_ID, HAN_CATE_NAME)
VALUES(3, '�Ѵ��г�Ƽ');
INSERT INTO REP_HANDLE_CATEGORY(HAN_CATE_ID, HAN_CATE_NAME)
VALUES(4, '�Ѵ��г�Ƽ����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 4

SELECT *
FROM REP_HANDLE_CATEGORY;
/*
1	�Ű����г�Ƽ
2	�ǽŰ����г�Ƽ
3	�Ѵ��г�Ƽ
4	�Ѵ��г�Ƽ����
*/

COMMIT;
--------------------------------------------------------------------------------

-- �� �Ű������� ī�װ�
INSERT INTO REPORTER_CATEGORY(REPORTER_ID, REPORTER_PROP)
VALUES(1, '������');
INSERT INTO REPORTER_CATEGORY(REPORTER_ID, REPORTER_PROP)
VALUES(2, '�Ǹ���');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 2

SELECT *
FROM REPORTER_CATEGORY;
/*
1	������
2	�Ǹ���
*/
--------------------------------------------------------------------------------
-- [ �˶�Ȯ�ο��� ���̺� ���� ]
--  �˶� Ȯ�ο��� �ڵ带 �����ϴ� ���̺� �÷� �߰�
-- 1. �������          �Ϸ�
-- 2. �������ȵ��      �Ϸ�
-- 3. ����              �Ϸ�
-- 4. ä��              �Ϸ�
-- 5. ����              �Ϸ�
CREATE TABLE ALARM_OK
( ALARM_CODE        NUMBER
, ALARM_COMMIT      VARCHAR2(20)    NOT NULL
, CONSTRAINT ALARM_CODE_PK PRIMARY KEY(ALARM_CODE)
);
--==>> Table ALARM_OK ��(��) �����Ǿ����ϴ�.

INSERT INTO ALARM_OK(ALARM_CODE, ALARM_COMMIT)
VALUES(1, '��Ȯ��');
INSERT INTO ALARM_OK(ALARM_CODE, ALARM_COMMIT)
VALUES(2, 'Ȯ��');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 2
SELECT *
FROM ALARM_OK;

COMMIT;
--==>> Ŀ�� �Ϸ�.

--------------------------------------------------------------------------------
-- 2022-06-10 16:00 ������ �Է�
-- [���ŷ���ǰ���]
COMMIT;

DESC DIRECT_PRODUCT;

ALTER TABLE DIRECT_PRODUCT
MODIFY PD_TITLE VARCHAR2(200);

ALTER TABLE DIRECT_PRODUCT
MODIFY PD_HOPE_STIME VARCHAR2(20);

ALTER TABLE DIRECT_PRODUCT
MODIFY PD_HOPE_ETIME VARCHAR2(20);

INSERT INTO DIRECT_PRODUCT(DIRE_PD_ID, PD_TITLE, PD_NAME, PD_PHOTO, PD_AS_REMAIN
                         , PD_HOPEPRICE, PD_HOPE_SDATE, PD_HOPE_EDATE
                         , PD_HOPE_STIME, PD_HOPE_ETIME 
                         , PD_HOPE_PLACE, PD_HOPE_MGRS
                         , PD_MAKER_ID, PD_AS_ID, U_ID)
VALUES('dire_1', 'NVIDIA �׷���ī�� ����ó', 'GeForce RTX 3060 Ti', 'C:\Downloads', '6����'
                         , 1000000, TO_DATE('2022-06-10', 'YYYY-MM-DD'), TO_DATE('2022-06-15', 'YYYY-MM-DD')
                         , '14:00', '17:00'
                         , '���� ������ ����õ�� 50�� 44', '37.6568258/127.0178972'
                         , 'maker_3', 2, 'test1' 
       );
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
       
                         
SELECT *
FROM DIRECT_PRODUCT;
--==>> dire_1	NVIDIA �׷���ī�� ����ó	GeForce RTX 3060 Ti	C:\Downloads	6����	0	1000000	2022-06-10	2022-06-15	14:00	17:00	���� ������ ����õ�� 50�� 44	37.6568258/127.0178972	2022-06-10	maker_3	2	test1

-- [�������ȵ��] ������ �Է�
INSERT INTO SUGGEST_LIST(SUGGEST_CODE, SUGGEST_PRICE, SUGGEST_TIME
                       , SUGGEST_PLACE, PLACE_DETAIL, U_ID, DIRE_PD_ID)
VALUES('suggest_1', 950000, TO_DATE('2022-06-12 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), '���� ������ ����õ�� 50�� 40', '�츲���۾�', 'test2', 'dire_1');                      
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM DELIVERY_PRODUCT;

-- �ù�ŷ���ǰ���
INSERT INTO DELIVERY_PRODUCT(DELI_PD_ID, PD_TITLE, PD_NAME, PD_PHOTO, PD_AS_REMAIN
                         , PD_START_PRICE, PD_HITCOUNT, PD_REGIT_DATE, PD_MAKER_ID, PD_AS_ID, U_ID, CF_PRICE)
VALUES('deli_1', 'i-7 8700 �����ϰ� �Ǹ�', 'intel I-7 8700', 'C:\Downloads', '1�� 3����'
                         , 150000, 0, TO_DATE('2022-06-10', 'YYYY-MM-DD'), 
                         , 'maker_1', 1, 'test2', 0);




SELECT *
FROM SUGGEST_LIST;

desc DELIVERY_PRODUCT;
/*
suggest_1	950000	2022-06-12	2022-06-10	���� ������ ����õ�� 50�� 40	�츲���۾�	test2	dire_1	1
*/


DESC SELECTED;

-- [ä��]���̺� �������Է�
INSERT INTO SELECTED(SELECTED_ID, BUYER_CODE, SELLER_CODE, SUGGEST_CODE)
VALUES('sel_1', 'abc123', 'def456', 'suggest_1');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM SELECTED;
/*
sel_1	2022-06-10	abc123	def456	suggest_1	1
*/
ALTER TABLE DIRE_COMPLETE_BUY
MODIFY REVIEW VARCHAR2(100);

INSERT INTO DIRE_COMPLETE_SELL(DIRE_COMP_SELL_ID, REVIEW, SELECTED_ID)
VALUES('rcSell_1', '���Ҿ��', 'sel_1');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO DIRE_COMPLETE_BUY(DIRE_COMP_BUY_ID, REVIEW, SELECTED_ID)
VALUES('rcBuy_1', '���Ҿ��', 'sel_1');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.



-- [FAQ] ���̺� ������ �Է�                         
INSERT INTO FAQ(FAQ_ID, FAQ_TITLE, FAQ_CONTENTS)
VALUES(1, '����Ȯ���̶�?', '����Ȯ���̶� �ŷ��� �Ϸ�� ���� �ŷ��� �� ����Ǿ����� Ȯ�ν����ִ� �����Դϴ�. �������������� �����Ͻ� �� �ֽ��ϴ�.');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


ALTER TABLE ASK_ANSWER
MODIFY ANSWER_DATE DATE DEFAULT SYSDATE;

-- [��������] ���̺� ������ �Է�

INSERT INTO ANNOUNCE(ANNOUNCE_ID, ANNOUNCE_TITLE, ANNOUNCE_CONTENTS, ANOUN_CATE_ID)
VALUES('ann_1', '����� ���ǵ��� ���� ���˾ȳ�', '��� �� 22:30 ~ 23:30 �� ���������� ���� �����Դϴ�.'
     , 1);


-- [���ǵ��] ���̺� ������ �Է�
INSERT INTO ASK(ASK_ID, ASK_TITLE, ASK_CONTENTS, U_ID, ASK_CATE_ID)
VALUES('ask_1', '�Ű�� ����ϳ���??', '�̻��� �Խù��� �ôµ� ��� �Ű��ϴ��� �ñ��մϴ�.', 'test2', 3);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO ASK_ANSWER(ASK_ID, ANSWER_CONTENTS, AD_ID)
VALUES('ask_1', '����/���������� �ִ°�� �Ű�� �Ұ��մϴ�, ����/���������� ���� �Խù��� ��� �ش� ��ǰ�� ������������ �Ű��ϱ� ��ư�� ���� �Ű� �����մϴ�.'
     , 'cf_admin');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


INSERT INTO ADMIN(AD_ID, AD_PW)
VALUES('cf_admin', 'comfit006$');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


     
COMMIT;