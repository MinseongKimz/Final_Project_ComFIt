-- ■ 비밀번호 암호화 

SELECT USER 
FROM DUAL;
--==>> COMFIT

SELECT *
FROM USER_INFORMATION;
/*
issac1162@test.com	오이삭	인천광역시 중구 신흥동1가 6-4	1234	010-2988-1162	오이삭입니다.	삭이오	2022-06-10	test1
kkk@naver.com	김민성	서울특별시 중구 을지로 5가 223-4	1234	010-2222-3333	C:\Downloads	민성킴의활약	2022-06-11	test2
*/



-- 상품 1개 (상세페이지) 조회 쿼리
SELECT * 
FROM AD_PD_LIST_REALVIEW;

SELECT *
FROM DIRE_PRODUCT_VIEW;

ALTER TABLE DIRECT_PRODUCT
ADD  CF_PRICE NUMBER DEFAULT 0;
--==>> Table DIRECT_PRODUCT이(가) 변경되었습니다.

ALTER TABLE DELIVERY_PRODUCT
ADD   CF_PRICE NUMBER DEFAULT 0;
---==>> Table DELIVERY_PRODUCT이(가) 변경되었습니다.


COMMIT;

SELECT *
FROM DIRECT_PRODUCT;

-- ○직거래 상품 뷰
CREATE OR REPLACE VIEW DIRE_PD_LIST_REALVIEW
AS
SELECT DP.DIRE_PD_ID AS PD_ID, DP.PD_TITLE, DP.PD_NAME, DP.PD_PHOTO, DP.PD_AS_REMAIN, DP.PD_HITCOUNT
     , DP.PD_HOPEPRICE AS PRICE, DP.PD_HOPE_SDATE, DP.PD_HOPE_EDATE, DP.PD_HOPE_STIME, DP.PD_HOPE_ETIME
     , DP.PD_HOPE_PLACE, DP.PD_REGIT_DATE, DP.PD_MAKER_ID, DP.PD_AS_ID, PA.PD_AS_NAME, PC.CATEGORY_NAME
     , DP.U_ID AS SELLER, UI.U_NICKNAME, PM.MAKER_NAME, PM.MAKER_NAME2, DP.CF_PRICE, NVL(DP.COMMENTS, '특이사항 없음') AS COMMENTS
FROM DIRECT_PRODUCT DP JOIN PRODUCT_MAKER PM
     ON DP.PD_MAKER_ID = PM.PD_MAKER_ID 
        JOIN PRODUCT_CATEGORY PC
          ON PM.PD_CATEGORY_ID = PC.PD_CATEGORY_ID
             JOIN PRODUCT_AS PA
               ON DP.PD_AS_ID = PA.PD_AS_ID
                  JOIN COMFIT_USER CU
                    ON DP.U_ID = CU.U_ID
                       JOIN USER_INFORMATION UI
                         ON CU.U_ID = UI.U_ID;
--==>> View DIRE_PD_LIST_REALVIEW이(가) 생성되었습니다.


-- ○택배거래 상품 뷰
CREATE OR REPLACE VIEW DELI_PD_LIST_REALVIEW
AS
SELECT DP.DELI_PD_ID AS PD_ID, DP.PD_TITLE, DP.PD_NAME, DP.PD_PHOTO, DP.PD_AS_REMAIN, DP.PD_HITCOUNT
     , DP.PD_START_PRICE AS PRICE, DP.PD_REGIT_DATE, DP.PD_MAKER_ID, DP.PD_AS_ID, PA.PD_AS_NAME, PC.CATEGORY_NAME
     , DP.U_ID AS SELLER, UI.U_NICKNAME, PM.MAKER_NAME, PM.MAKER_NAME2, DP.CF_PRICE, NVL(DP.COMMENTS, '특이사항 없음') AS COMMENTS
     , NVL(DP.IMD_PRICE, 0) AS IMDPRICE
FROM DELIVERY_PRODUCT DP JOIN PRODUCT_MAKER PM
     ON DP.PD_MAKER_ID = PM.PD_MAKER_ID 
        JOIN PRODUCT_CATEGORY PC
          ON PM.PD_CATEGORY_ID = PC.PD_CATEGORY_ID
             JOIN PRODUCT_AS PA
               ON DP.PD_AS_ID = PA.PD_AS_ID
                  JOIN COMFIT_USER CU
                    ON DP.U_ID = CU.U_ID
                       JOIN USER_INFORMATION UI
                         ON CU.U_ID = UI.U_ID;


CREATE OR REPLACE VIEW PD_LIST_MAIN_VIEW
AS
SELECT PD_ID, PD_NAME, PRICE
FROM DELI_PD_LIST_REALVIEW
UNION ALL
SELECT PD_ID, PD_NAME, PRICE
FROM DIRE_PD_LIST_REALVIEW;
--==>> View PD_LIST_MAIN_VIEW이(가) 생성되었습니다.

SELECT PD_ID, PD_NAME, PRICE
FROM PD_LIST_MAIN_VIEW;
/*
deli_1	intel I-7 8700	150000
dire_1	GeForce RTX 3060 Ti	1000000
*/

-- ○ 클릭된 직거래 상품을 조회하는 쿼리문
SELECT PD_ID, PD_TITLE, PD_NAME, PD_PHOTO, PD_AS_REMAIN, PD_HITCOUNT, PRICE
     , SUBSTR(TO_CHAR(PD_HOPE_SDATE), 1, 10) AS PD_HOPE_SDATE, SUBSTR(TO_CHAR(PD_HOPE_EDATE), 1, 10) AS PD_HOPE_EDATE
     , PD_HOPE_STIME, PD_HOPE_ETIME, PD_HOPE_PLACE
     , PD_REGIT_DATE, PD_MAKER_ID, PD_AS_ID, PD_AS_NAME, CATEGORY_NAME, SELLER
     , U_NICKNAME, MAKER_NAME, MAKER_NAME2, CF_PRICE, COMMENTS
     , PD_HOPE_EDATE + ROUND(TO_NUMBER(SUBSTR(PD_HOPE_ETIME, 1, 2)-4)/24, 10) AS REMAIN_DATE
FROM DIRE_PD_LIST_REALVIEW
WHERE PD_ID = 'dire_1';



SELECT SELLER
FROM DIRE_PD_LIST_REALVIEW;

-- ○ 택배거래 상품 조회 쿼리문
SELECT PD_ID, PD_TITLE, PD_NAME, PD_PHOTO, PD_AS_REMAIN, PD_HITCOUNT, PRICE
     , PD_REGIT_DATE, PD_MAKER_ID, PD_AS_ID, PD_AS_NAME, CATEGORY_NAME, SELLER
     , U_NICKNAME, MAKER_NAME, MAKER_NAME2, CF_PRICE, COMMENTS, IMDPRICE, (PD_REGIT_DATE+5) AS REMAIN_DATE
FROM DELI_PD_LIST_REALVIEW
WHERE PD_ID = 'deli_1';

ALTER TABLE DELIVERY_PRODUCT
ADD IMD_PRICE NUMBER;

COMMIT; 

SELECT *
FROM DELIVERY_PRODUCT;
COMMIT;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

-- ○ 남은날짜까지의 타이머 환산(220614)
SELECT (PD_REGIT_DATE+5) AS REMAIN_DATE
FROM DELIVERY_PRODUCT
WHERE DELI_PD_ID = 'deli_1';

SELECT *
FROM TAB;



-- 구매확정내역에서 한 명의 회원의 내역 조회
CREATE OR REPLACE VIEW USER_BUY_COUNT_VIEW
AS
SELECT SUM(B.BUY) AS BUY_SUM
FROM
(
SELECT NVL(COUNT(*), 0) AS BUY
FROM DELI_COMPLETE_BUY DCB JOIN BID_SUCCESS BS
     ON DCB.BS_ID = BS.BS_ID
        JOIN BID_LIST BL
          ON BS.BID_CODE = BL.BID_CODE
WHERE BL.U_ID = 'test1';
UNION ALL
SELECT NVL(COUNT(*), 0) AS BUY
FROM DIRE_COMPLETE_BUY DCB JOIN SELECTED S
     ON DCB.SELECTED_ID = S.SELECTED_ID
        JOIN SUGGEST_LIST SL
          ON S.SUGGEST_CODE = SL.SUGGEST_CODE
WHERE U_ID = 'test1'
) B;
--==>> View USER_BUY_COUNT_VIEW이(가) 생성되었습니다.

SELECT BUY_SUM
FROM USER_BUY_COUNT_VIEW;


CREATE OR REPLACE VIEW USER_SELL_COUNT_VIEW
AS;
SELECT SUM(S.SELL) AS SELL_SUM
FROM
(
SELECT NVL(COUNT(*), 0) AS SELL
FROM DELI_COMPLETE_SELL DCS JOIN BID_SUCCESS BS
     ON DCS.BS_ID = BS.BS_ID
        JOIN BID_LIST BL
          ON BS.BID_CODE = BL.BID_CODE
WHERE U_ID = 'test1'
UNION ALL
SELECT NVL(COUNT(*), 0) AS SELL
FROM DIRE_COMPLETE_SELL DCS JOIN SELECTED S
     ON DCS.SELECTED_ID = S.SELECTED_ID
        JOIN SUGGEST_LIST SL
          ON S.SUGGEST_CODE = SL.SUGGEST_CODE
WHERE U_ID = 'test1'
) S;
--==>> View USER_SELL_COUNT_VIEW이(가) 생성되었습니다.






SELECT CASE 
       WHEN SUM(BS.EXP) = 3
       THEN 1
       ELSE 0
       END AS LEVEL
FROM
(
SELECT SUM(B.BUY) AS EXP
FROM
(
SELECT NVL(COUNT(*), 0) AS BUY
FROM DELI_COMPLETE_BUY DCB JOIN BID_SUCCESS BS
     ON DCB.BS_ID = BS.BS_ID
        JOIN BID_LIST BL
          ON BS.BID_CODE = BL.BID_CODE
WHERE BL.U_ID = 'test1'
UNION ALL
SELECT NVL(COUNT(*), 0) AS BUY
FROM DIRE_COMPLETE_BUY DCB JOIN SELECTED S
     ON DCB.SELECTED_ID = S.SELECTED_ID
        JOIN SUGGEST_LIST SL
          ON S.SUGGEST_CODE = SL.SUGGEST_CODE
WHERE U_ID = 'test1'
) B
UNION ALL
SELECT SUM(S.SELL)*2 AS EXP
FROM
(
SELECT NVL(COUNT(*), 0) AS SELL
FROM DELI_COMPLETE_SELL DCS JOIN BID_SUCCESS BS
     ON DCS.BS_ID = BS.BS_ID
        JOIN BID_LIST BL
          ON BS.BID_CODE = BL.BID_CODE
WHERE U_ID = 'test1'
UNION ALL
SELECT NVL(COUNT(*), 0) AS SELL
FROM DIRE_COMPLETE_SELL DCS JOIN SELECTED S
     ON DCS.SELECTED_ID = S.SELECTED_ID
        JOIN SUGGEST_LIST SL
          ON S.SUGGEST_CODE = SL.SUGGEST_CODE
WHERE U_ID = 'test1'
) S
) BS;



SELECT BS.EXP
FROM
(
SELECT SUM(B.BUY) AS EXP
FROM
(
SELECT NVL(COUNT(*), 0) AS BUY
FROM DELI_COMPLETE_BUY DCB JOIN BID_SUCCESS BS
     ON DCB.BS_ID = BS.BS_ID
        JOIN BID_LIST BL
          ON BS.BID_CODE = BL.BID_CODE
UNION ALL
SELECT NVL(COUNT(*), 0) AS BUY
FROM DIRE_COMPLETE_BUY DCB JOIN SELECTED S
     ON DCB.SELECTED_ID = S.SELECTED_ID
        JOIN SUGGEST_LIST SL
          ON S.SUGGEST_CODE = SL.SUGGEST_CODE
) B
UNION ALL
SELECT SUM(S.SELL)*2 AS EXP
FROM
(
SELECT NVL(COUNT(*), 0) AS SELL
FROM DELI_COMPLETE_SELL DCS JOIN BID_SUCCESS BS
     ON DCS.BS_ID = BS.BS_ID
        JOIN BID_LIST BL
          ON BS.BID_CODE = BL.BID_CODE
UNION ALL
SELECT NVL(COUNT(*), 0) AS SELL
FROM DIRE_COMPLETE_SELL DCS JOIN SELECTED S
     ON DCS.SELECTED_ID = S.SELECTED_ID
        JOIN SUGGEST_LIST SL
          ON S.SUGGEST_CODE = SL.SUGGEST_CODE
) S
) BS;


-- 직거래 구매완료
SELECT DCB.DIRE_COMP_BUY_ID AS BUY_CODE, SL.U_ID AS U_ID
FROM DIRE_COMPLETE_BUY DCB JOIN SELECTED S
     ON DCB.SELECTED_ID = S.SELECTED_ID
        JOIN SUGGEST_LIST SL
          ON S.SUGGEST_CODE = SL.SUGGEST_CODE;



-- 직거래판매완료
SELECT DCS.DIRE_COMP_SELL_ID AS SELL_CODE, SL.U_ID AS U_ID
FROM DIRE_COMPLETE_SELL DCS JOIN SELECTED S
     ON DCS.SELECTED_ID = S.SELECTED_ID
        JOIN SUGGEST_LIST SL
          ON S.SUGGEST_CODE = SL.SUGGEST_CODE;

-- 택배 구매완료
SELECT DCB.DELI_COMP_BUY_ID AS BUY_CODE, BL.U_ID AS U_ID
FROM DELI_COMPLETE_BUY DCB JOIN BID_SUCCESS BS
     ON DCB.BS_ID = BS.BS_ID
        JOIN BID_LIST BL
          ON BS.BID_CODE = BL.BID_CODE;
          

-- 택배판매완료
SELECT DCS.DELI_COMP_SELL_ID AS SELL_CODE, BL.U_ID AS U_ID
FROM DELI_COMPLETE_SELL DCS JOIN BID_SUCCESS BS
     ON DCS.BS_ID = BS.BS_ID
        JOIN BID_LIST BL
          ON BS.BID_CODE = BL.BID_CODE;


-- 구매완료 UNION
SELECT DCB.DIRE_COMP_BUY_ID AS BUY_CODE, SL.U_ID AS U_ID
FROM DIRE_COMPLETE_BUY DCB JOIN SELECTED S
     ON DCB.SELECTED_ID = S.SELECTED_ID
        JOIN SUGGEST_LIST SL
          ON S.SUGGEST_CODE = SL.SUGGEST_CODE
UNION ALL
SELECT DCB.DELI_COMP_BUY_ID AS BUY_CODE, BL.U_ID AS U_ID
FROM DELI_COMPLETE_BUY DCB JOIN BID_SUCCESS BS
     ON DCB.BS_ID = BS.BS_ID
        JOIN BID_LIST BL
          ON BS.BID_CODE = BL.BID_CODE;

-- 판매완료 UNION
SELECT DCS.DIRE_COMP_SELL_ID AS SELL_CODE, SL.U_ID AS U_ID
FROM DIRE_COMPLETE_SELL DCS JOIN SELECTED S
     ON DCS.SELECTED_ID = S.SELECTED_ID
        JOIN SUGGEST_LIST SL
          ON S.SUGGEST_CODE = SL.SUGGEST_CODE
UNION ALL
SELECT DCS.DELI_COMP_SELL_ID AS SELL_CODE, BL.U_ID AS U_ID
FROM DELI_COMPLETE_SELL DCS JOIN BID_SUCCESS BS
     ON DCS.BS_ID = BS.BS_ID
        JOIN BID_LIST BL
          ON BS.BID_CODE = BL.BID_CODE;


-- 구매 / 판매 UNION
CREATE OR REPLACE VIEW USER_EXP_VIEW
AS
SELECT SUBSTR(EX.BUY_CODE, 3, 1) AS CODE, EX.U_ID
FROM
(
SELECT DCB.DIRE_COMP_BUY_ID AS BUY_CODE, SL.U_ID AS U_ID
FROM DIRE_COMPLETE_BUY DCB JOIN SELECTED S
     ON DCB.SELECTED_ID = S.SELECTED_ID
        JOIN SUGGEST_LIST SL
          ON S.SUGGEST_CODE = SL.SUGGEST_CODE
UNION ALL
SELECT DCB.DELI_COMP_BUY_ID AS BUY_CODE, BL.U_ID AS U_ID
FROM DELI_COMPLETE_BUY DCB JOIN BID_SUCCESS BS
     ON DCB.BS_ID = BS.BS_ID
        JOIN BID_LIST BL
          ON BS.BID_CODE = BL.BID_CODE
UNION ALL
SELECT DCS.DIRE_COMP_SELL_ID AS SELL_CODE, SL.U_ID AS U_ID
FROM DIRE_COMPLETE_SELL DCS JOIN SELECTED S
     ON DCS.SELECTED_ID = S.SELECTED_ID
        JOIN SUGGEST_LIST SL
          ON S.SUGGEST_CODE = SL.SUGGEST_CODE
UNION ALL
SELECT DCS.DELI_COMP_SELL_ID AS SELL_CODE, BL.U_ID AS U_ID
FROM DELI_COMPLETE_SELL DCS JOIN BID_SUCCESS BS
     ON DCS.BS_ID = BS.BS_ID
        JOIN BID_LIST BL
          ON BS.BID_CODE = BL.BID_CODE
) EX
;
--==>> View USER_EXP_VIEW이(가) 생성되었습니다.


CREATE OR REPLACE VIEW USER_LEVEL_VIEW
AS
SELECT CASE WHEN CODE = 'b' OR CODE = 'B'
            THEN 2
            WHEN CODE = 's' OR CODE = 'S'
            THEN 1
            ELSE 0
            END AS USER_EXP
            , U_ID
FROM USER_EXP_VIEW;
--==>> View USER_LEVEL_VIEW이(가) 생성되었습니다.

-- ○ 특정회원의 레벨 조회 쿼리문
SELECT CASE TRUNC(SQRT((SUM(USER_EXP))/2))
       WHEN 0
       THEN 1
       ELSE TRUNC(SQRT((SUM(USER_EXP))/2)) 
       END AS USER_LEVEL
FROM USER_LEVEL_VIEW
WHERE U_ID = 'test1';

SELECT U_ID
FROM DELIVERY_PRODUCT
WHERE DELI_PD_ID = 'deli_1';


-- ○ 특정 회원의 누적거래수 조회 쿼리문
SELECT COUNT(*) AS TA_COUNT
FROM USER_EXP_VIEW
WHERE U_ID = 'test1';
--==>> 2
                              
-- ○ 특정 회원의 판매횟수 조회 뷰
CREATE OR REPLACE VIEW USER_SELL_COUNT_VIEW
AS
SELECT *
FROM
(
SELECT DCS.DIRE_COMP_SELL_ID AS SELL_CODE, SL.U_ID AS U_ID
FROM DIRE_COMPLETE_SELL DCS JOIN SELECTED S
     ON DCS.SELECTED_ID = S.SELECTED_ID
        JOIN SUGGEST_LIST SL
          ON S.SUGGEST_CODE = SL.SUGGEST_CODE
UNION ALL
SELECT DCS.DELI_COMP_SELL_ID AS SELL_CODE, BL.U_ID AS U_ID
FROM DELI_COMPLETE_SELL DCS JOIN BID_SUCCESS BS
     ON DCS.BS_ID = BS.BS_ID
        JOIN BID_LIST BL
          ON BS.BID_CODE = BL.BID_CODE
) US
;
--==>> View USER_SELL_COUNT_VIEW이(가) 생성되었습니다.

-- ○ 판매누적회수조회쿼리문
SELECT COUNT(*) AS SELL_COUNT
FROM USER_SELL_COUNT_VIEW
WHERE U_ID = 'test1';
--==>> 2

-- ○ 특정 회원의 구매 횟수 조회 뷰
CREATE OR REPLACE VIEW USER_BUY_COUNT_VIEW
AS
SELECT *
FROM
(
SELECT DCB.DIRE_COMP_BUY_ID AS BUY_CODE, SL.U_ID AS U_ID
FROM DIRE_COMPLETE_BUY DCB JOIN SELECTED S
     ON DCB.SELECTED_ID = S.SELECTED_ID
        JOIN SUGGEST_LIST SL
          ON S.SUGGEST_CODE = SL.SUGGEST_CODE
UNION ALL
SELECT DCB.DELI_COMP_BUY_ID AS BUY_CODE, BL.U_ID AS U_ID
FROM DELI_COMPLETE_BUY DCB JOIN BID_SUCCESS BS
     ON DCB.BS_ID = BS.BS_ID
        JOIN BID_LIST BL
          ON BS.BID_CODE = BL.BID_CODE
) UB
;
--==>> View USER_BUY_COUNT_VIEW이(가) 생성되었습니다.
SELECT COUNT(*) AS BUY_COUNT
FROM USER_BUY_COUNT_VIEW
WHERE U_ID = 'test1';
                          
                              
                                                                        
COMMIT;    

                                                                                        


