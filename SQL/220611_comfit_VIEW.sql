-- 뷰VIEW 작업 실시 2022-06-11, 김상기

SELECT USER
FROM DUAL;
--==>> COMFIT

-- ●● 관리자용 뷰 ●● --
-- * 회원 관리
-- 1. 일반회원관리 [ AD_USER_LIST_REALVIEW ]
-- 출력 데이터 : 이메일, 이름, 닉네임, 전화, 레벨, 가입일, 상태, 누적차단횟수()


INSERT INTO DELIVERY_PD_REPORT(REP_ID, REP_CONTENTS, U_ID, PD_REP_CID, DELI_PD_ID)
VALUES('delirep_1', '유해한 내용 업로드', 'test1', 3, 'deli_1');

INSERT INTO DELI_PD_REP_HANDLE(REP_ID, AD_ID, HAN_CATE_ID)
VALUES('delirep_1', 'cf_admin', 2);

INSERT INTO DELI_PD_BANNED(BAN_ID, BAN_REA_DETAIL, REP_ID, BAN_CATE_ID)
VALUES('ban_1', '유해한 내용을 업로드한 것을 확인함', 'delirep_1', 1);

COMMIT;


-- 택배 상품 누적 차단 카운트를 위한 view
CREATE OR REPLACE VIEW DELIVERY_PD_BANNED_VIEW
AS
SELECT DPR.REP_ID, DPR.REP_CONTENTS, DPR.REP_DATE, DPR.PD_REP_CID, DPR.DELI_PD_ID
     , DPH.REP_HAN_DATE, DPH.HAN_CATE_ID
     , DPB.BAN_ID, DPB.BAN_REA_DETAIL, DPB.BAN_DATE, DPB.BAN_CATE_ID
     , DP.PD_TITLE, DP.PD_REGIT_DATE,DPR.U_ID AS REPORTER, DP.U_ID AS REPORTED , DPH.AD_ID
FROM DELIVERY_PD_REPORT DPR 
    JOIN DELI_PD_REP_HANDLE DPH 
    ON DPR.REP_ID = DPH.REP_ID 
    JOIN DELI_PD_BANNED DPB
    ON DPH.REP_ID = DPB.REP_ID
    JOIN DELIVERY_PRODUCT DP
    ON DP.DELI_PD_ID = DPR.DELI_PD_ID;


-- 택배 상품 누적 차단 횟수 확인 쿼리문
SELECT COUNT(*) AS COUNT
FROM DELIVERY_PD_BANNED_VIEW
WHERE REPORTED = 'test2';


-- 직거래 상품 누적 차단 카운트를 위한 view
CREATE OR REPLACE VIEW DIRECT_PD_BANNED_VIEW
AS
SELECT DPR.REP_ID, DPR.REP_CONTENTS, DPR.REP_DATE, DPR.PD_REP_CID, DPR.DIRE_PD_ID
     , DPH.REP_HAN_DATE, DPH.HAN_CATE_ID
     , DPB.BAN_ID, DPB.BAN_REA_DETAIL, DPB.BAN_DATE, DPB.BAN_CATE_ID
     , DP.PD_TITLE, DP.PD_REGIT_DATE,DPR.U_ID AS REPORTER, DP.U_ID AS REPORTED , DPH.AD_ID
FROM DIRECT_PD_REPORT DPR 
    JOIN DIRE_PD_REP_HANDLE DPH 
    ON DPR.REP_ID = DPH.REP_ID 
    JOIN DIRE_PD_BANNED DPB
    ON DPH.REP_ID = DPB.REP_ID
    JOIN DIRECT_PRODUCT DP
    ON DP.DIRE_PD_ID = DPR.DIRE_PD_ID;


-- 직거래 상품 누적 차단 횟수 확인 쿼리문
SELECT COUNT(*) AS COUNT
FROM DIRECT_PD_BANNED_VIEW
WHERE REPORTED = 'test2';



-- 택배 거래 누적 차단 카운트를 위한 view
CREATE OR REPLACE VIEW DELIVERY_TRANS_BANNED_VIEW
AS
SELECT DTB.BAN_ID, DTB.BAN_REA_DETAIL, DTB.BAN_DATE, DTB.REP_ID, DTB.BAN_CATE_ID
     , DTH.REP_HAN_DATE, DTH.HAN_CATE_ID
     , DTR.REP_CONTENTS, DTR.REP_DATE, DTR.TRANS_REP_CID, DTR.BS_ID, DTR.REPORTER_ID
     , BS.BS_DATE, BS.BID_CODE
     , BL.BID_DATE, DP.PD_TITLE, DP.PD_REGIT_DATE
     , CASE WHEN DTR.REPORTER_ID = 1 
        THEN BL.U_ID
        ELSE DP.U_ID
        END AS REPORTER
     , CASE WHEN DTR.REPORTER_ID = 1
        THEN DP.U_ID
        ELSE BL.U_ID
        END AS REPORTED
     , DTH.AD_ID 
FROM DELI_TA_BANNED DTB
    JOIN DELI_TA_REP_HANDLE DTH
    ON DTB.REP_ID = DTH.REP_ID
    JOIN DELIVERY_TA_REPORT DTR
    ON DTH.REP_ID = DTR.REP_ID
    JOIN BID_SUCCESS BS
    ON DTR.BS_ID = BS.BS_ID
    JOIN BID_LIST BL
    ON BS.BID_CODE = BL.BID_CODE
    JOIN DELIVERY_PRODUCT DP
    ON BL.DELI_PD_ID = DP.DELI_PD_ID;
--==>> View DELIVERY_TRANS_BANNED_VIEW이(가) 생성되었습니다.



-- 택배 거래 누적 차단 횟수 확인 쿼리문
SELECT COUNT(*) AS COUNT
FROM DILIVERY_TRANS_BANNED_VIEW
WHERE REPORTED = 'test2';



-- 직거래 거래 누적 차단 카운트를 위한 view
CREATE OR REPLACE VIEW DIRECT_TRANS_BANNED_VIEW
AS
SELECT DTB.BAN_ID, DTB.BAN_REA_DETAIL, DTB.BAN_DATE, DTB.REP_ID, DTB.BAN_CATE_ID
     , DTH.REP_HAN_DATE, DTH.HAN_CATE_ID
     , DTR.REP_CONTENTS, DTR.REP_DATE, DTR.TRANS_REP_CID, DTR.SELECTED_ID, DTR.REPORTER_ID
     , S.SELECTED_DATE, S.SUGGEST_CODE
     , SL.SUGGEST_DATE, DP.PD_TITLE, DP.PD_REGIT_DATE
     , CASE WHEN DTR.REPORTER_ID = 1 
        THEN SL.U_ID
        ELSE DP.U_ID
        END AS REPORTER
     , CASE WHEN DTR.REPORTER_ID = 1
        THEN DP.U_ID
        ELSE SL.U_ID
        END AS REPORTED
     , DTH.AD_ID 
FROM DIRE_TA_BANNED DTB
    JOIN DIRE_TA_REP_HANDLE DTH
    ON DTB.REP_ID = DTH.REP_ID
    JOIN DIRECT_TA_REPORT DTR
    ON DTH.REP_ID = DTR.REP_ID
    JOIN SELECTED S
    ON DTR.SELECTED_ID = S.SELECTED_ID
    JOIN SUGGEST_LIST SL
    ON S.SUGGEST_CODE = SL.SUGGEST_CODE
    JOIN DIRECT_PRODUCT DP
    ON SL.DIRE_PD_ID = DP.DIRE_PD_ID;
--==>> View DIRECT_TRANS_BANNED_VIEW이(가) 생성되었습니다.

-- 직거래 누적 차단 횟수 확인 쿼리문
SELECT COUNT(*) AS COUNT
FROM DIRECT_TRANS_BANNED_VIEW
WHERE REPORTED = 'test2';


-- 누적차단횟수 조회 쿼리문
SELECT COUNT(*) AS COUNT
FROM
(
SELECT BAN_ID, BAN_DATE, REPORTED, REPORTER
FROM DIRECT_TRANS_BANNED_VIEW
UNION
SELECT BAN_ID, BAN_DATE, REPORTED, REPORTER
FROM DELIVERY_TRANS_BANNED_VIEW
UNION
SELECT BAN_ID, BAN_DATE, REPORTED, REPORTER
FROM DIRECT_PD_BANNED_VIEW
UNION
SELECT BAN_ID, BAN_DATE, REPORTED, REPORTER
FROM DELIVERY_PD_BANNED_VIEW
)
WHERE REPORTED = 'test2';

SELECT U_EMAIL, U_NAME, U_NICKNAME, U_TEL, U_JOINDATE
FROM USER_INFORMATION;

SELECT *
FROM COMFIT_USER;


-- ▣ AD_USER_LIST_REALVIEW 
CREATE OR REPLACE VIEW AD_USER_LIST_REALVIEW
AS
SELECT U_EMAIL, U_NAME, U_NICKNAME, U_TEL, U_JOINDATE, 
(
    SELECT COUNT(*) AS COUNT
    FROM
    (
    SELECT BAN_ID, BAN_DATE, REPORTED, REPORTER
    FROM DIRECT_TRANS_BANNED_VIEW
    UNION
    SELECT BAN_ID, BAN_DATE, REPORTED, REPORTER
    FROM DELIVERY_TRANS_BANNED_VIEW
    UNION
    SELECT BAN_ID, BAN_DATE, REPORTED, REPORTER
    FROM DIRECT_PD_BANNED_VIEW
    UNION
    SELECT BAN_ID, BAN_DATE, REPORTED, REPORTER
    FROM DELIVERY_PD_BANNED_VIEW
    )
    WHERE U_ID = REPORTED
) AS BANCOUNT
FROM USER_INFORMATION;

-- 일반회원 조회 구문
SELECT U_EMAIL, U_NAME, U_NICKNAME, U_TEL, U_JOINDATE, BANCOUNT
FROM AD_USER_LIST_REALVIEW;
/*
issac1162@test.com	오이삭	삭이오	010-2988-1162	2022-06-10 17:18;42	0
kkk@naver.com	김민성	민성킴의활약	010-2222-3333	2022-06-11 22:47;57	1
*/



--○ 상품번호





--------------------------------------------------------------------------------


-- * 거래 관리
-- 1. 상품 관리
-- 택배 상품 뷰(DELI_PRODUCT_VIEW) + 직거래상품 뷰(DIRE_PRODUCT_VIEW)
-- AD_PD_LIST + AD_PD_LIST2 ▼▼▼

--  ▣ AD_PD_LIST_REALVIEW !!!!
-- 상품명, 카테고리, 등록일자, 판매자ID, 제목, 거래방식, 상태
CREATE OR REPLACE VIEW DELI_PRODUCT_VIEW
AS
SELECT DP.DELI_PD_ID AS PD_ID, PD_NAME AS PD_NAME, PC.CATEGORY_NAME AS CATE_NAME
     , DP.PD_REGIT_DATE AS REGIT_DATE, UI.U_EMAIL AS U_EMAIL, PD_TITLE AS PD_TITLE
     , DCS.SELL_COMP_DATE AS SCD, DCB.BUY_COMP_DATE AS BCD, DP.PD_START_PRICE AS PRICE
FROM DELIVERY_PRODUCT DP JOIN PRODUCT_MAKER PM
     ON DP.PD_MAKER_ID = PM.PD_MAKER_ID
        JOIN PRODUCT_CATEGORY PC
          ON PM.PD_CATEGORY_ID = PC.PD_CATEGORY_ID
          JOIN BID_LIST BL
            ON DP.DELI_PD_ID = BL.DELI_PD_ID
            JOIN BID_SUCCESS BS
              ON BL.BID_CODE = BS.BID_CODE
              JOIN DELI_COMPLETE_SELL DCS
                ON BS.BS_ID = DCS.BS_ID
                JOIN DELI_COMPLETE_BUY DCB
                  ON BS.BS_ID = DCB.BS_ID
                  JOIN COMFIT_USER CU
                  ON DP.U_ID = CU.U_ID
                  JOIN USER_INFORMATION UI
                    ON CU.U_ID = UI.U_ID;
--==> View DELI_PRODUCT_VIEW이(가) 생성되었습니다.

INSERT INTO USER_INFORMATION(U_EMAIL, U_NAME, U_ADDRESS, U_PASSWORD, U_TEL, U_PROFILE, U_NICKNAME, U_ID)
VALUES('kkk@naver.com', '김민성', '서울특별시 중구 을지로 5가 223-4', '1234', '010-2222-3333', 'C:\Downloads', '민성킴의활약', 'test2');                           

CREATE OR REPLACE VIEW AD_PD_LIST_VIEW                  
AS                  
SELECT CASE 
       WHEN SUBSTR(PD_ID, 1, 3) = 'del'
       THEN '택배거래'
       ELSE '직거래'
       END  AS TA_CATE
       , PD_NAME, CATE_NAME, REGIT_DATE, U_EMAIL, PD_TITLE, PRICE, 
       CASE
       WHEN SCD IS NOT NULL AND BCD IS NOT NULL
       THEN '거래완료'
       ELSE '거래중'
       END AS TA_STATUS
FROM DELI_PRODUCT_VIEW;
--==>> View AD_PD_LIST_VIEW이(가) 생성되었습니다.

SELECT *
FROM AD_PD_LIST_VIEW;

CREATE OR REPLACE VIEW DIRE_PRODUCT_VIEW
AS
SELECT DP.DIRE_PD_ID AS PD_ID, PD_NAME AS PD_NAME, PC.CATEGORY_NAME AS CATE_NAME
     , DP.PD_REGIT_DATE AS REGIT_DATE, UI.U_EMAIL AS U_EMAIL, PD_TITLE AS PD_TITLE
     , DCS.SELL_COMP_DATE AS SCD, DCB.BUY_COMP_DATE AS BCD, DP.PD_HOPEPRICE AS PRICE
FROM DIRECT_PRODUCT DP JOIN PRODUCT_MAKER PM
     ON DP.PD_MAKER_ID = PM.PD_MAKER_ID
        JOIN PRODUCT_CATEGORY PC
          ON PM.PD_CATEGORY_ID = PC.PD_CATEGORY_ID
          JOIN SUGGEST_LIST SL
            ON DP.DIRE_PD_ID = SL.DIRE_PD_ID
            JOIN SELECTED ST
              ON SL.SUGGEST_CODE = ST.SUGGEST_CODE
              JOIN DIRE_COMPLETE_SELL DCS
                ON ST.SELECTED_ID = DCS.SELECTED_ID
                JOIN DIRE_COMPLETE_BUY DCB
                  ON ST.SELECTED_ID = DCB.SELECTED_ID
                  JOIN COMFIT_USER CU
                  ON DP.U_ID = CU.U_ID
                  JOIN USER_INFORMATION UI
                    ON CU.U_ID = UI.U_ID;
--==>> View DIRE_PRODUCT_VIEW이(가) 생성되었습니다.


CREATE OR REPLACE VIEW AD_PD_LIST2_VIEW
AS
SELECT CASE 
       WHEN SUBSTR(PD_ID, 1, 3) = 'del'
       THEN '택배거래'
       ELSE '직거래'
       END  AS TA_CATE
       , PD_NAME, CATE_NAME, REGIT_DATE, U_EMAIL, PD_TITLE, PRICE, 
       CASE
       WHEN SCD IS NOT NULL AND BCD IS NOT NULL
       THEN '거래완료'
       ELSE '거래중'
       END AS TA_STATUS
FROM DIRE_PRODUCT_VIEW;


-- VIEW 2개를 연결후 조회

--  ▣ AD_PD_LIST_REALVIEW !!!!

CREATE OR REPLACE VIEW AD_PD_LIST_REALVIEW
AS
SELECT *
FROM AD_PD_LIST_VIEW
UNION ALL
SELECT *
FROM AD_PD_LIST2_VIEW;
-- View AD_PD_LIST_REALVIEW이(가) 생성되었습니다.

-- 조회 구문(날짜순)
SELECT TA_CATE, PD_NAME, CATE_NAME, REGIT_DATE, U_EMAIL, PD_TITLE, TA_STATUS
FROM AD_PD_LIST_REALVIEW
ORDER BY REGIT_DATE;
/*
직거래	GeForce RTX 3060 Ti	그래픽카드	2022-06-10 16:28;07	issac1162@test.com	NVIDIA 그래픽카드 개급처	거래완료
택배거래	intel I-7 8700	CPU	2022-06-10 16:36;50	kkk@naver.com	i-7 8700 저렴하게 판매	거래완료
*/
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI;SS';
--==>> Session이(가) 변경되었습니다.

SELECT PD_NAME, PRICE 
FROM AD_PD_LIST_REALVIEW;
/*
intel I-7 8700	150000
GeForce RTX 3060 Ti	1000000
*/

COMMIT; 
--------------------
-- 2. 상품 관리
--    입금 + 출금 내역 확인
--    입출금분류(IO_TYPE)  이메일(U_EMAIL)   이름(U_NAME)  시간(IO_DATE)  
--    입출금은행(BANK_NAME) 계좌번호(ACCOUNT) 금액

-- ○ 입금내역 조회
SELECT IM.IN_M_ID AS IO_TYPE, UI.U_EMAIL AS U_EMAIL, UI.U_NAME AS U_NAME
     , IM.IN_DATE AS IO_DATE, B.BANK_NAME AS BANK_NAME, IM.IN_ACCOUNT AS ACCOUNT
     , IM.IN_MONEY AS MONEY
FROM INPUT_MONEY IM JOIN BANK B
     ON IM.BANK_ID = B.BANK_ID
        JOIN COMFIT_USER CU
          ON IM.U_ID = CU.U_ID
             JOIN USER_INFORMATION UI
               ON CU.U_ID = UI.U_ID;
               
-- ○ 출금내역 조회
SELECT OM.OUT_M_ID AS IO_TYPE, UI.U_EMAIL AS U_EMAIL, UI.U_NAME AS U_NAME
     , OM.OUT_DATE AS IO_DATE, B.BANK_NAME AS BANK_NAME, OM.OUT_ACCOUNT AS ACCOUNT
     , OM.OUT_MONEY AS MONEY
FROM OUTPUT_MONEY OM JOIN BANK B
     ON OM.BANK_ID = B.BANK_ID
        JOIN COMFIT_USER CU
          ON OM.U_ID = CU.U_ID
             JOIN USER_INFORMATION UI
               ON CU.U_ID = UI.U_ID;
               
--    입출금분류(IO_TYPE)  이메일(U_EMAIL)   이름(U_NAME)  시간(IO_DATE)  
--    입출금은행(BANK_NAME) 계좌번호(ACCOUNT) 금액
CREATE OR REPLACE VIEW AD_IO_MONEY_LIST_REALVIEW
AS
SELECT CASE
       WHEN SUBSTR(M.IO_TYPE, 1, 1) = 'i'
       THEN '입금'
       ELSE '출금'
       END AS IO_TYPE, M.U_EMAIL AS U_EMAIL, M.U_NAME AS U_NAME, M.IO_DATE AS IO_DATE
       , M.BANK_NAME AS BANK_NAME, M.ACCOUNT AS ACCOUNT, M.MONEY AS MONEY
FROM
(
SELECT IM.IN_M_ID AS IO_TYPE, UI.U_EMAIL AS U_EMAIL, UI.U_NAME AS U_NAME
     , IM.IN_DATE AS IO_DATE, B.BANK_NAME AS BANK_NAME, IM.IN_ACCOUNT AS ACCOUNT
     , IM.IN_MONEY AS MONEY
FROM INPUT_MONEY IM JOIN BANK B
     ON IM.BANK_ID = B.BANK_ID
        JOIN COMFIT_USER CU
          ON IM.U_ID = CU.U_ID
             JOIN USER_INFORMATION UI
               ON CU.U_ID = UI.U_ID
UNION ALL
SELECT OM.OUT_M_ID AS IO_TYPE, UI.U_EMAIL AS U_EMAIL, UI.U_NAME AS U_NAME
     , OM.OUT_DATE AS IO_DATE, B.BANK_NAME AS BANK_NAME, OM.OUT_ACCOUNT AS ACCOUNT
     , OM.OUT_MONEY AS MONEY
FROM OUTPUT_MONEY OM JOIN BANK B
     ON OM.BANK_ID = B.BANK_ID
        JOIN COMFIT_USER CU
          ON OM.U_ID = CU.U_ID
             JOIN USER_INFORMATION UI
               ON CU.U_ID = UI.U_ID
) M;               
--==>> View AD_IO_MONEY_LIST_REALVIEW이(가) 생성되었습니다.

-- 조회 구문
SELECT IO_TYPE, U_EMAIL, U_NAME, IO_DATE, BANK_NAME
     , ACCOUNT, MONEY
FROM AD_IO_MONEY_LIST_REALVIEW
ORDER BY IO_DATE;
/*
출금	issac1162@test.com	오이삭	2022-06-10 17:42;19	KB국민은행	941602-00-228699	500000
입금	issac1162@test.com	오이삭	2022-06-10 17:44;52	KB국민은행	941602-00-228699	500000               
*/
    
--------------------------------------------------------------------------------
-- * 카테고리 관리
SELECT PD_CATEGORY_ID, CATEGORY_NAME
FROM PRODUCT_CATEGORY;
/*
CPU
그래픽카드
메모리
메인보드
SSD
HDD
외장HDD/SSD
케이스
파워
키보드
마우스
모니터
오디오
프린터
공유기/무선랜
노트북
*/

--------------------------------------------------------------------------------
-- * 고객센터 관리
-- 1. 신고 관리
-- 출력 데이터 : 상품코드, 신고자 이름, 피신고자 이름, 신고사유
--             , 관리자조치여부, 접수시간, 처리시간


SELECT *
FROM TAB
WHERE TABTYPE = 'VIEW';

--------------------------------------------------------------------------------

SELECT IO_TYPE, U_EMAIL, U_NAME, IO_DATE, BANK_NAME
     , ACCOUNT, MONEY
FROM AD_IO_MONEY_LIST_REALVIEW
WHERE IO_TYPE = '입금'
ORDER BY IO_DATE;

-------------------------------------------------------------------------------- 20220615
-- 관리자모드 택배 상품관리 상세보기

-- ○ 택배거래 전체보기
SELECT SUBSTR(DP.DELI_PD_ID, 6, 3) AS 상품번호, DP.PD_REGIT_DATE 게시일자, DP.PD_TITLE 제목
,CASE
WHEN SUBSTR(DP.DELI_PD_ID, 1, 4) = 'deli'
THEN '택배거래'
ELSE '직거래'
END AS 거래유형
, DP.U_ID 판매자ID
, CASE
WHEN DCS.SELL_COMP_DATE IS NOT NULL AND DCB.BUY_COMP_DATE IS NOT NULL
THEN '거래완료'
ELSE '거래중'
END AS 거래상태
, PC.CATEGORY_NAME 카테고리이름, DP.PD_NAME 물품명, DP.PD_MAKER_ID 제조사
, BL.U_ID 구매자ID, BL.BID_PRICE 가격, BL.BID_DATE 구매일시, CONCAT(BL.ADDRESS, BL.ADDR_DETAIL) 배송장소
, DCB.BUY_COMP_DATE 구매확정일자, DCS.SELL_COMP_DATE 판매확정일시, DCS.PD_DELI_NUM 운송장
, BL.U_ID 제안자ID, BL.BID_DATE 제안시간, BL.BID_PRICE 제안가격
, CASE
WHEN BS.BS_ID IS NOT NULL
THEN '낙찰'
ELSE '유찰'
END AS 제안상태
FROM DELIVERY_PRODUCT DP LEFT JOIN PRODUCT_MAKER PM
ON DP.PD_MAKER_ID = PM.PD_MAKER_ID
LEFT JOIN PRODUCT_CATEGORY PC
ON PM.PD_CATEGORY_ID = PC.PD_CATEGORY_ID
LEFT JOIN BID_LIST BL
ON DP.DELI_PD_ID = BL.DELI_PD_ID
LEFT JOIN BID_SUCCESS BS
ON BL.BID_CODE = BS.BID_CODE
LEFT JOIN DELI_COMPLETE_SELL DCS
ON DCS.BS_ID = BS.BS_ID
LEFT JOIN DELI_COMPLETE_BUY DCB
ON DCB.BS_ID = BS.BS_ID;

-- ○ 택배거래 뷰
CREATE OR REPLACE VIEW DELIVEREY_DEAL_VIEW
AS
SELECT SUBSTR(DP.DELI_PD_ID, 6, 3) AS DELI_PD_ID, DP.PD_REGIT_DATE PD_REGIT_DATE, DP.PD_TITLE PD_TITLE
,CASE
WHEN SUBSTR(DP.DELI_PD_ID, 1, 4) = 'deli'
THEN '택배거래'
ELSE '직거래'
END AS deal_type
, DP.U_ID U_ID
, CASE
WHEN DCS.SELL_COMP_DATE IS NOT NULL AND DCB.BUY_COMP_DATE IS NOT NULL
THEN '거래완료'
ELSE '거래중'
END AS deal_status
, PC.CATEGORY_NAME CATEGORY_NAME, DP.PD_NAME PD_NAME, DP.PD_MAKER_ID PD_MAKER_ID
, BL.U_ID b_u_id, BL.BID_PRICE BID_PRICE, BL.BID_DATE BID_DATE, CONCAT(BL.ADDRESS, BL.ADDR_DETAIL) ADDRESS
, DCB.BUY_COMP_DATE BUY_COMP_DATE, DCS.SELL_COMP_DATE SELL_COMP_DATE, DCS.PD_DELI_NUM PD_DELI_NUM
, CASE
WHEN BS.BS_ID IS NOT NULL
THEN '낙찰'
ELSE '유찰'
END AS 제안상태
FROM DELIVERY_PRODUCT DP LEFT JOIN PRODUCT_MAKER PM
ON DP.PD_MAKER_ID = PM.PD_MAKER_ID
LEFT JOIN PRODUCT_CATEGORY PC
ON PM.PD_CATEGORY_ID = PC.PD_CATEGORY_ID
LEFT JOIN BID_LIST BL
ON DP.DELI_PD_ID = BL.DELI_PD_ID
LEFT JOIN BID_SUCCESS BS
ON BL.BID_CODE = BS.BID_CODE
LEFT JOIN DELI_COMPLETE_SELL DCS
ON DCS.BS_ID = BS.BS_ID
LEFT JOIN DELI_COMPLETE_BUY DCB
ON DCB.BS_ID = BS.BS_ID;

SELECT deli_pd_id, CATEGORY_NAME, PD_REGIT_DATE, U_ID, PD_TITLE, deal_type, deal_status
FROM DELIVEREY_DEAL_VIEW;
-- 모르겠당ㅎ

-- ○ 직거래 전체보기
SELECT SUBSTR(DP.DIRE_PD_ID, 6, 3) AS 상품번호, DP.PD_REGIT_DATE 게시일자, DP.PD_TITLE 제목
,CASE
WHEN SUBSTR(DP.DIRE_PD_ID, 1, 4) = 'dire'
THEN '직거래'
ELSE '택배거래'
END AS 거래유형
, DP.U_ID
, CASE
WHEN DCS.SELL_COMP_DATE IS NOT NULL AND DCB.BUY_COMP_DATE IS NOT NULL
THEN '거래완료'
ELSE '거래중'
END AS 게시글상태
, S.SELLER_CODE 판매자고유코드, S.BUYER_CODE 구매자고유코드
, CASE
WHEN DCS.SELL_COMP_DATE IS NOT NULL 
THEN 'y'
ELSE 'n'
END AS 판매코드입력여부
, CASE
WHEN DCB.BUY_COMP_DATE IS NOT NULL 
THEN 'y'
ELSE 'n'
END AS 구매코드입력여부
,PC.CATEGORY_NAME 카테고리, DP.PD_NAME 물품명, PM.PD_MAKER_ID 제조사, DP.PD_HOPEPRICE 희망가격, DP.PD_HOPE_PLACE 희망장소, DP.PD_HOPE_SDATE 희망날짜, DP.PD_HOPE_STIME 희망시간
,SL.U_ID 구매자ID, SL.SUGGEST_PRICE 가격, SL.SUGGEST_TIME 직거래일시, CONCAT(SL.SUGGEST_PLACE, SL.PLACE_DETAIL) 직거래장소
,DCB.BUY_COMP_DATE 구매확정일시,DCS.SELL_COMP_DATE 판매확정일시
,SL.U_ID 입찰자ID, SL.SUGGEST_TIME 입찰시간, SL.SUGGEST_PRICE 입찰가격
, CASE
WHEN S.SELECTED_ID IS NOT NULL
THEN '낙찰'
ELSE '유찰'
END AS 입찰상태
FROM SUGGEST_LIST SL LEFT OUTER JOIN DIRECT_PRODUCT DP 
ON DP.DIRE_PD_ID = SL.DIRE_PD_ID
LEFT OUTER JOIN PRODUCT_MAKER PM
ON DP.PD_MAKER_ID = PM.PD_MAKER_ID
LEFT OUTER JOIN PRODUCT_CATEGORY PC
ON PM.PD_CATEGORY_ID = PC.PD_CATEGORY_ID
LEFT OUTER JOIN SELECTED S
ON SL.SUGGEST_CODE = S.SUGGEST_CODE
LEFT OUTER JOIN DIRE_COMPLETE_SELL DCS
ON DCS.SELECTED_ID = S.SELECTED_ID
LEFT OUTER JOIN DIRE_COMPLETE_BUY DCB
ON DCB.SELECTED_ID = S.SELECTED_ID;


-- ○ 직거래 뷰
CREATE OR REPLACE VIEW DIRECT_DEAL_VIEW
AS
SELECT SUBSTR(DP.DIRE_PD_ID, 6, 3) AS DIRE_PD_ID, DP.PD_REGIT_DATE PD_REGIT_DATE, DP.PD_TITLE PD_TITLE
,CASE
WHEN SUBSTR(DP.DIRE_PD_ID, 1, 4) = 'dire'
THEN '직거래'
ELSE '택배거래'
END AS deal_type
, DP.U_ID U_ID
, CASE
WHEN DCS.SELL_COMP_DATE IS NOT NULL AND DCB.BUY_COMP_DATE IS NOT NULL
THEN '거래완료'
ELSE '거래중'
END AS deal_status
, S.SELLER_CODE SELLER_CODE, S.BUYER_CODE BUYER_CODE
, CASE
WHEN DCS.SELL_COMP_DATE IS NOT NULL 
THEN 'y'
ELSE 'n'
END AS SELL_COMP_DATE_OK
, CASE
WHEN DCB.BUY_COMP_DATE IS NOT NULL 
THEN 'y'
ELSE 'n'
END AS BUY_COMP_DATE_OK
,PC.CATEGORY_NAME CATEGORY_NAME, DP.PD_NAME PD_NAME, PM.PD_MAKER_ID PD_MAKER_ID, DP.PD_HOPEPRICE PD_HOPEPRICE, DP.PD_HOPE_PLACE PD_HOPE_PLACE, DP.PD_HOPE_SDATE PD_HOPE_SDATE, DP.PD_HOPE_STIME PD_HOPE_STIME
,SL.U_ID B_U_ID, SL.SUGGEST_PRICE SUGGEST_PRICE, SL.SUGGEST_TIME SUGGEST_TIME, CONCAT(SL.SUGGEST_PLACE, SL.PLACE_DETAIL) SUGGEST_PLACE
,DCB.BUY_COMP_DATE BUY_COMP_DATE,DCS.SELL_COMP_DATE SELL_COMP_DATE
, CASE
WHEN S.SELECTED_ID IS NOT NULL
THEN '낙찰'
ELSE '유찰'
END AS 입찰상태
FROM SUGGEST_LIST SL LEFT OUTER JOIN DIRECT_PRODUCT DP 
ON DP.DIRE_PD_ID = SL.DIRE_PD_ID
LEFT OUTER JOIN PRODUCT_MAKER PM
ON DP.PD_MAKER_ID = PM.PD_MAKER_ID
LEFT OUTER JOIN PRODUCT_CATEGORY PC
ON PM.PD_CATEGORY_ID = PC.PD_CATEGORY_ID
LEFT OUTER JOIN SELECTED S
ON SL.SUGGEST_CODE = S.SUGGEST_CODE
LEFT OUTER JOIN DIRE_COMPLETE_SELL DCS
ON DCS.SELECTED_ID = S.SELECTED_ID
LEFT OUTER JOIN DIRE_COMPLETE_BUY DCB
ON DCB.SELECTED_ID = S.SELECTED_ID;

--○ 거래 통합 뷰
CREATE OR REPLACE VIEW TOTAL_DEAL_VIEW
AS
SELECT deli_pd_id, CATEGORY_NAME, PD_REGIT_DATE, U_ID, PD_TITLE, deal_type, deal_status
FROM DELIVEREY_DEAL_VIEW
UNION
SELECT DIRE_PD_ID, CATEGORY_NAME, PD_REGIT_DATE, U_ID, PD_TITLE, deal_type, deal_status
FROM DIRECT_DEAL_VIEW;


SELECT ROWNUM as num, deli_pd_id, CATEGORY_NAME, PD_REGIT_DATE, U_ID, PD_TITLE, deal_type, deal_status
FROM TOTAL_DEAL_VIEW;

--------------------------------------------------------------------------------
-- 택배거래랑 직거래랑 통합해서 시퀀스를 생성해줘야 번호 부여 가능할듯
-- 택배거래, 직거래 통합해서... 출력하도록 만들구 시퀀스 번호 부여하기

rownum, category_name, pd_regit_date, u_id, pd_title, deal_type, deal_status
--------------------------------------------------------------------------------
-- 택배 상품상세 뷰
CREATE OR REPLACE VIEW DIRECT_BOX1_VIEW
AS
SELECT SUBSTR(DP.DELI_PD_ID, 6, 3) AS PD_NUM, SUBSTR(DP.DELI_PD_ID, 1, 4) AS PD_ID, DP.PD_REGIT_DATE PD_REGIT_DATE, DP.PD_TITLE PD_TITLE
,CASE
WHEN SUBSTR(DP.DELI_PD_ID, 1, 4) = 'deli'
THEN '택배거래'
ELSE '직거래'
END AS DEAL_TYPE
, DP.U_ID U_ID
, CASE
WHEN DCS.SELL_COMP_DATE IS NOT NULL AND DCB.BUY_COMP_DATE IS NOT NULL
THEN '거래완료'
ELSE '거래중'
END AS DEAL_STATUS
FROM DELIVERY_PRODUCT DP LEFT JOIN PRODUCT_MAKER PM
ON DP.PD_MAKER_ID = PM.PD_MAKER_ID
LEFT JOIN PRODUCT_CATEGORY PC
ON PM.PD_CATEGORY_ID = PC.PD_CATEGORY_ID
LEFT JOIN BID_LIST BL
ON DP.DELI_PD_ID = BL.DELI_PD_ID
LEFT JOIN BID_SUCCESS BS
ON BL.BID_CODE = BS.BID_CODE
LEFT JOIN DELI_COMPLETE_SELL DCS
ON DCS.BS_ID = BS.BS_ID
LEFT JOIN DELI_COMPLETE_BUY DCB
ON DCB.BS_ID = BS.BS_ID;

--○ 상품상세 쿼리 CHECK
SELECT PD_NUM ,PD_ID, PD_REGIT_DATE, PD_TITLE, DEAL_TYPE, U_ID, DEAL_STATUS
FROM DIRECT_BOX1_VIEW
WHERE PD_NUM = '1';


--○ 상품정보 뷰
CREATE OR REPLACE VIEW DIRECT_BOX2_VIEW
AS
SELECT SUBSTR(DP.DELI_PD_ID, 6, 3) AS PD_NUM, SUBSTR(DP.DELI_PD_ID, 1, 4) AS PD_ID, PC.CATEGORY_NAME, DP.PD_NAME, PM.MAKER_NAME
FROM DELIVERY_PRODUCT DP JOIN PRODUCT_MAKER PM
ON DP.PD_MAKER_ID = PM.PD_MAKER_ID
JOIN PRODUCT_CATEGORY PC
ON PM.PD_CATEGORY_ID = PC.PD_CATEGORY_ID;

--○ 상품정보 쿼리 CHECK
SELECT PD_NUM, PD_ID, CATEGORY_NAME, PD_NAME, MAKER_NAME
FROM DIRECT_BOX2_VIEW
WHERE PD_NUM = '1'; 

--○ 거래정보 뷰
CREATE OR REPLACE VIEW DIRECT_BOX3_VIEW
AS
SELECT SUBSTR(DP.DELI_PD_ID, 6, 3) AS PD_NUM, SUBSTR(DP.DELI_PD_ID, 1, 4) AS PD_ID, BL.U_ID B_U_ID, BL.BID_PRICE BID_PRICE, BL.BID_DATE BID_DATE, CONCAT(BL.ADDRESS, BL.ADDR_DETAIL) ADDRESS
, BS.BS_ID
FROM DELIVERY_PRODUCT DP LEFT JOIN PRODUCT_MAKER PM
ON DP.PD_MAKER_ID = PM.PD_MAKER_ID
LEFT JOIN BID_LIST BL
ON DP.DELI_PD_ID = BL.DELI_PD_ID
LEFT JOIN BID_SUCCESS BS
ON BL.BID_CODE = BS.BID_CODE
LEFT JOIN DELI_COMPLETE_SELL DCS
ON DCS.BS_ID = BS.BS_ID
LEFT JOIN DELI_COMPLETE_BUY DCB
ON DCB.BS_ID = BS.BS_ID;

--○ 거래정보 쿼리
SELECT PD_NUM, PD_ID, B_U_ID, BID_PRICE, BID_DATE, ADDRESS, BS_ID
FROM DIRECT_BOX3_VIEW
WHERE PD_NUM = '1' AND BS_ID IS NOT NULL;


--○ 거래 완료 정보 뷰
CREATE OR REPLACE VIEW DIRECT_BOX4_VIEW
AS
SELECT SUBSTR(DP.DELI_PD_ID, 6, 3) AS PD_NUM, SUBSTR(DP.DELI_PD_ID, 1, 4) AS PD_ID, DCB.BUY_COMP_DATE BUY_COMP_DATE, DCS.SELL_COMP_DATE SELL_COMP_DATE, DCS.PD_DELI_NUM PD_DELI_NUM
FROM DELIVERY_PRODUCT DP LEFT JOIN PRODUCT_MAKER PM
ON DP.PD_MAKER_ID = PM.PD_MAKER_ID
LEFT JOIN BID_LIST BL
ON DP.DELI_PD_ID = BL.DELI_PD_ID
LEFT JOIN BID_SUCCESS BS
ON BL.BID_CODE = BS.BID_CODE
LEFT JOIN DELI_COMPLETE_SELL DCS
ON DCS.BS_ID = BS.BS_ID
LEFT JOIN DELI_COMPLETE_BUY DCB
ON DCB.BS_ID = BS.BS_ID
WHERE PD_DELI_NUM IS NOT NULL;

--○ 거래 완료 정보 쿼리
SELECT PD_NUM, PD_ID, BUY_COMP_DATE, SELL_COMP_DATE, PD_DELI_NUM
FROM DIRECT_BOX4_VIEW
WHERE PD_NUM = '1';

--○ 입찰내역 뷰
CREATE OR REPLACE VIEW DIRECT_BOX5_VIEW
AS
SELECT SUBSTR(DP.DELI_PD_ID, 6, 3) AS PD_NUM, SUBSTR(DP.DELI_PD_ID, 1, 4) AS PD_ID, BL.U_ID B_U_ID, BL.BID_DATE BID_DATE, BL.BID_PRICE BID_PRICE
, CASE
WHEN BS.BS_ID IS NOT NULL
THEN '낙찰'
ELSE '유찰'
END AS DEAL_STATUS
FROM DELIVERY_PRODUCT DP LEFT JOIN PRODUCT_MAKER PM
ON DP.PD_MAKER_ID = PM.PD_MAKER_ID
LEFT JOIN BID_LIST BL
ON DP.DELI_PD_ID = BL.DELI_PD_ID
LEFT JOIN BID_SUCCESS BS
ON BL.BID_CODE = BS.BID_CODE
LEFT JOIN DELI_COMPLETE_SELL DCS
ON DCS.BS_ID = BS.BS_ID
LEFT JOIN DELI_COMPLETE_BUY DCB
ON DCB.BS_ID = BS.BS_ID;

--○ 입찰내역 쿼리
SELECT PD_NUM, PD_ID, B_U_ID, BID_DATE, BID_PRICE, DEAL_STATUS
FROM DIRECT_BOX5_VIEW
WHERE PD_NUM = '1';
;
-- 이클립스 
-- <td><a href="admin_product_list_delivery.action?deli_pd_num=${productlist.deli_pd_num }">${product.pd_title}</a></td>



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- (게시글번호), (상품번호), 카테고리, 등록일자, 판매자, 제목, 거래방식, 상태
-- 배송
CREATE OR REPLACE VIEW TOTAL_PRODUCT_VIEW
AS
SELECT SUBSTR(DP.DELI_PD_ID, 6, 3) AS PD_NUM, SUBSTR(DP.DELI_PD_ID,1 ,4) AS PD_ID, PC.CATEGORY_NAME, DP.PD_REGIT_DATE PD_REGIT_DATE, DP.U_ID U_ID, DP.PD_TITLE PD_TITLE
,CASE
WHEN SUBSTR(DP.DELI_PD_ID, 1, 4) = 'deli'
THEN '택배거래'
ELSE '직거래'
END AS DEAL_TYPE
, CASE
WHEN DCS.SELL_COMP_DATE IS NOT NULL AND DCB.BUY_COMP_DATE IS NOT NULL
THEN '거래완료'
ELSE '거래중'
END AS DEAL_STATUS
FROM DELIVERY_PRODUCT DP LEFT JOIN PRODUCT_MAKER PM
ON DP.PD_MAKER_ID = PM.PD_MAKER_ID
LEFT JOIN PRODUCT_CATEGORY PC
ON PM.PD_CATEGORY_ID = PC.PD_CATEGORY_ID
LEFT JOIN BID_LIST BL
ON DP.DELI_PD_ID = BL.DELI_PD_ID
LEFT JOIN BID_SUCCESS BS
ON BL.BID_CODE = BS.BID_CODE
LEFT JOIN DELI_COMPLETE_SELL DCS
ON DCS.BS_ID = BS.BS_ID
LEFT JOIN DELI_COMPLETE_BUY DCB
ON DCB.BS_ID = BS.BS_ID
UNION ALL
-- 배송
SELECT SUBSTR(DP.DIRE_PD_ID, 6, 3) AS PD_NUM, SUBSTR(DP.DIRE_PD_ID, 1, 4) AS PD_ID, PC.CATEGORY_NAME, DP.PD_REGIT_DATE PD_REGIT_DATE, DP.U_ID U_ID, DP.PD_TITLE PD_TITLE
,CASE
WHEN SUBSTR(DP.DIRE_PD_ID, 1, 4) = 'dire'
THEN '직거래'
ELSE '택배거래'
END AS deal_type
, CASE
WHEN DCS.SELL_COMP_DATE IS NOT NULL AND DCB.BUY_COMP_DATE IS NOT NULL
THEN '거래완료'
ELSE '거래중'
END AS deal_status
FROM DIRECT_PRODUCT DP LEFT JOIN SUGGEST_LIST SL
ON DP.DIRE_PD_ID = SL.DIRE_PD_ID
LEFT JOIN PRODUCT_MAKER PM
ON DP.PD_MAKER_ID = PM.PD_MAKER_ID
LEFT JOIN PRODUCT_CATEGORY PC
ON PM.PD_CATEGORY_ID = PC.PD_CATEGORY_ID
LEFT JOIN SELECTED S
ON SL.SUGGEST_CODE = S.SUGGEST_CODE
LEFT JOIN DIRE_COMPLETE_SELL DCS
ON DCS.SELECTED_ID = S.SELECTED_ID
LEFT OUTER JOIN DIRE_COMPLETE_BUY DCB
ON DCB.SELECTED_ID = S.SELECTED_ID;

--> 택배거래랑 배달거래 둘 다 얻어내구 (check~!!)(중복값은 어쩔수없다... )
--> deli 랑 dire 분기를 얻어내서 들어가게 만들기


-- ○ 쿼리문
SELECT ROWNUM, PD_NUM, PD_ID, CATEGORY_NAME, PD_REGIT_DATE, U_ID, PD_TITLE, DEAL_TYPE, DEAL_STATUS
FROM TOTAL_PRODUCT_VIEW
WHERE PD_NUM IS NOT NULL;

		SELECT PD_NUM ,PD_ID, PD_REGIT_DATE, PD_TITLE, DEAL_TYPE, U_ID, DEAL_STATUS
		FROM DIRECT_BOX1_VIEW
		WHERE PD_NUM = '1';

pd_id = deli, dire 로 분기
pd_id_num = 1,2,3, 으로 분기

--------------------------------------------------------------------------------
--○ 관리자 신고 총합 VIEW
-- 상품신고리스트(택배) OK
-- 회원 id, 게시물 ID, 신고자ID, 신고내용, 관리자조치, 접수시간, 처리시간
CREATE OR REPLACE VIEW TOTAL_REPORT_VIEW
AS
SELECT DP.U_ID U_ID, DP.DELI_PD_ID PD_ID, DPR.U_ID R_U_ID, DPR.REP_CONTENTS REP_CONTENTS, RHC.HAN_CATE_NAME HAN_CATE_NAME,DPR.REP_DATE REP_DATE, DPH.REP_HAN_DATE REP_HAN_DATE
FROM DELIVERY_PRODUCT DP JOIN DELIVERY_PD_REPORT DPR
ON DP.DELI_PD_ID = DPR.DELI_PD_ID
JOIN DELI_PD_REP_HANDLE DPH
ON DPR.REP_ID = DPH.REP_ID
JOIN REP_HANDLE_CATEGORY RHC
ON DPH.HAN_CATE_ID = RHC.HAN_CATE_ID
UNION ALL
-- 상품신고리스트(직거래) OK
--회원 id, 게시물 ID, 신고자ID, 신고내용, 관리자조치, 접수시간, 처리시간
SELECT DP.U_ID 회원ID, DP.DIRE_PD_ID 게시물ID, DPR.U_ID 신고자ID, DPR.REP_CONTENTS 신고내용, RHC.HAN_CATE_NAME 관리자조치,DPR.REP_DATE 접수시간, DPH.REP_HAN_DATE 처리시간
FROM DIRECT_PRODUCT DP LEFT JOIN DIRECT_PD_REPORT DPR
ON DP.DIRE_PD_ID = DPR.DIRE_PD_ID
LEFT JOIN DIRE_PD_REP_HANDLE DPH
ON DPR.REP_ID = DPH.REP_ID
LEFT JOIN REP_HANDLE_CATEGORY RHC
ON DPH.HAN_CATE_ID = RHC.HAN_CATE_ID
WHERE DPR.U_ID IS NOT NULL
-- 거래신고리스트(택배)
-- 회원 id, 게시물 ID, 신고자ID, 신고내용, 관리자조치, 접수시간, 처리시간
-- 구매자인 경우엔 입찰코드가 있음
UNION ALL
SELECT DP.U_ID 회원ID, DP.DELI_PD_ID 게시물ID
,CASE
WHEN BL.BID_CODE IS NOT NULL
THEN BL.U_ID
ELSE DP.U_ID
END AS 신고자ID
, DTR.REP_CONTENTS 신고내용, RHC.HAN_CATE_NAME 관리자조치, DTR.REP_DATE 접수시간, DTH.REP_HAN_DATE 처리시간
-- RC.REPORTER_PROP 신고자, DP.U_ID 판매자, BL.U_ID 구매자
FROM DELIVERY_PRODUCT DP LEFT JOIN BID_LIST BL 
ON DP.DELI_PD_ID = BL.DELI_PD_ID
LEFT JOIN BID_SUCCESS BS 
ON BL.BID_CODE = BS.BID_CODE
LEFT JOIN DELIVERY_TA_REPORT DTR 
ON BS.BS_ID = DTR.BS_ID
LEFT JOIN REPORTER_CATEGORY RC
ON DTR.REPORTER_ID = RC.REPORTER_ID
LEFT JOIN DELI_TA_REP_HANDLE DTH
ON DTR.REP_ID = DTH.REP_ID
LEFT JOIN REP_HANDLE_CATEGORY RHC
ON DTH.HAN_CATE_ID = RHC.HAN_CATE_ID
WHERE RC.REPORTER_PROP IS NOT NULL
-- 거래신고리스트(직거래)
-- 회원 id, 게시물 ID, 신고자ID, 신고내용, 관리자조치, 접수시간, 처리시간
-- 구매자의 경우에는 구매제안코드 SUGGEST_CODE가 있다
UNION ALL
SELECT DP.U_ID 회원ID, DP.DIRE_PD_ID 게시물ID
,CASE
WHEN SL.SUGGEST_CODE IS NOT NULL
THEN SL.U_ID
ELSE DP.U_ID
END AS 신고자ID
, DTR.REP_CONTENTS 신고내용, RHC.HAN_CATE_NAME 관리자조치, DTR.REP_DATE 접수시간, DTH.REP_HAN_DATE 처리시간
FROM DIRECT_PRODUCT DP LEFT JOIN SUGGEST_LIST SL
ON DP.DIRE_PD_ID = SL.DIRE_PD_ID
LEFT JOIN SELECTED S
ON SL.SUGGEST_CODE = S.SUGGEST_CODE
LEFT JOIN DIRECT_TA_REPORT DTR
ON S.SELECTED_ID = DTR.SELECTED_ID
LEFT JOIN DIRE_TA_REP_HANDLE DTH
ON DTR.REP_ID = DTH.REP_ID
LEFT JOIN REP_HANDLE_CATEGORY RHC
ON DTH.HAN_CATE_ID = RHC.HAN_CATE_ID
WHERE DTR.REP_DATE IS NOT NULL;
--○ 신고내용 총합 쿼리 ㅠㅠ
SELECT U_ID, PD_ID, R_U_ID, REP_CONTENTS, HAN_CATE_NAME, REP_DATE, REP_HAN_DATE
FROM TOTAL_REPORT_VIEW;


--○ 문의사항
-- 회원id, 문의제목, 접수시간, 처리여부, 처리시간
SELECT A.U_ID U_ID, A.ASK_TITLE ASK_TITLE, A.ASK_DATE ASK_DATE, AC.ASK_CATE_NAME ASK_CATE_NAME, A.ASK_CONTENTS ASK_CONTENTS
, CASE
WHEN AA.ANSWER_CONTENTS IS NOT NULL
THEN '처리완료'
ELSE '미처리'
END AS ASK_STATUS
, AA.ANSWER_DATE ANSWER_DATE
FROM ASK A LEFT JOIN ASK_ANSWER AA
ON A.ASK_ID = AA.ASK_ID
JOIN ASK_CATEGORY AC 
ON A.ASK_CATE_ID = AC.ASK_CATE_ID;

-- ○ 문의답변
select *
from ASK_ANSWER;


-- 문의 인서트 실험
INSERT INTO ASK_ANSWER(ASK_ID, ANSWER_CONTENTS, ANSWER_DATE, AD_ID)
VALUES('ask_1', '테스트', SYSDATE, 'cf_admin');


--------------------------------------------------------------------------------

-- 직거래 상품상세 뷰
-- 상품번호, 게시일자, 제목, 거래방식, 판매자ID, 게시글상태, 판/구매자코드, 코드입력여부
CREATE OR REPLACE VIEW TOTAL_DIRECT_VIEW
AS
SELECT SUBSTR(DP.DIRE_PD_ID, 6, 3) PD_NUM, DP.PD_REGIT_DATE PD_REGIT_DATE, DP.PD_TITLE PD_TITLE
,CASE
WHEN SUBSTR(DP.DIRE_PD_ID, 1, 4) = 'dire'
THEN '직거래'
ELSE '택배거래'
END AS DEAL_TYPE
, DP.U_ID U_ID
, CASE
WHEN DCS.SELL_COMP_DATE IS NOT NULL AND DCB.BUY_COMP_DATE IS NOT NULL
THEN '거래완료'
ELSE '거래중'
END AS DEAL_STATUS
,S.BUYER_CODE BUYER_CODE, S.SELLER_CODE SELLER_CODE
,CASE
WHEN DCS.SELL_COMP_DATE IS NOT NULL 
THEN 'y'
ELSE 'n'
END AS SELL_OK
, CASE
WHEN DCB.BUY_COMP_DATE IS NOT NULL 
THEN 'y'
ELSE 'n'
END AS BUY_OK
FROM DIRECT_PRODUCT DP LEFT JOIN SUGGEST_LIST SL
ON DP.DIRE_PD_ID = SL.DIRE_PD_ID
LEFT JOIN SELECTED S
ON SL.SUGGEST_CODE = S.SUGGEST_CODE
LEFT JOIN DIRE_COMPLETE_SELL DCS
ON S.SELECTED_ID = DCS.SELECTED_ID
LEFT JOIN DIRE_COMPLETE_BUY DCB
ON S.SELECTED_ID = DCB.SELECTED_ID;

--○ 직거래 상품상세 쿼리
SELECT PD_NUM, PD_REGIT_DATE, PD_TITLE, DEAL_TYPE, U_ID, DEAL_STATUS, BUYER_CODE, SELLER_CODE, SELL_OK, BUY_OK
FROM TOTAL_DIRECT_VIEW
WHERE PD_NUM = '1';

--○ 상품정보
-- 카테고리, 물품명, 제조사, 희망가격, 희망장소, 희망날짜, 희망시간
CREATE OR REPLACE VIEW TOTAL_DIRECT_VIEW2
AS
SELECT SUBSTR(DP.DIRE_PD_ID, 6, 3) PD_NUM, PC.CATEGORY_NAME CATEGORY_NAME, DP.PD_NAME PD_NAME, PM.MAKER_NAME MAKER_NAME, DP.PD_HOPEPRICE PD_HOPEPRICE, DP.PD_HOPE_PLACE PD_HOPE_PLACE
, DP.PD_HOPE_SDATE || ' ~ ' || DP.PD_HOPE_EDATE HOPE_SATE, DP.PD_HOPE_STIME || ' ~ ' || DP.PD_HOPE_ETIME HOPE_TIME
FROM DIRECT_PRODUCT DP LEFT JOIN PRODUCT_MAKER PM
ON DP.PD_MAKER_ID = PM.PD_MAKER_ID
LEFT JOIN PRODUCT_CATEGORY PC
ON PM.PD_CATEGORY_ID = PC.PD_CATEGORY_ID;

SELECT PD_NUM, CATEGORY_NAME, PD_NAME, MAKER_NAME, PD_HOPEPRICE, PD_HOPE_PLACE, HOPE_SATE, HOPE_TIME
FROM TOTAL_DIRECT_VIEW2
WHERE PD_NUM = '1';

pd_num, pd_regit_date, pd_title, deal_type, deal_status, buyer_code, seller_code, sell_ok, buy_ok,
pd_num, category_name, pd_name, maker_name, pd_hopeprice, pd_hope_place, hope_sate, hope_time,
pd_num, u_id, suggest_price, suggest_time, hope_sate,
pd_num, buy_comp_date, suggest_price, suggest_time, hope_sate,
pd_num, u_id, suggest_date, suggest_price, deal_status

--○ 거래정보
-- 구매자ID, 가격, 직거래일시, 직거래장소
CREATE OR REPLACE VIEW TOTAL_DIRECT_VIEW3
AS
SELECT SUBSTR(DP.DIRE_PD_ID, 6, 3) PD_NUM, SL.U_ID U_ID, SL.SUGGEST_PRICE SUGGEST_PRICE, SL.SUGGEST_TIME SUGGEST_TIME, SUGGEST_PLACE || PLACE_DETAIL HOPE_SATE
FROM DIRECT_PRODUCT DP LEFT JOIN SUGGEST_LIST SL
ON DP.DIRE_PD_ID = SL.DIRE_PD_ID
LEFT JOIN SELECTED S
ON SL.SUGGEST_CODE = S.SUGGEST_CODE
LEFT JOIN DIRE_COMPLETE_SELL DCS
ON S.SELECTED_ID = DCS.SELECTED_ID
LEFT JOIN DIRE_COMPLETE_BUY DCB
ON S.SELECTED_ID = DCB.SELECTED_ID;
WHERE SL.U_ID IS NOT NULL AND SL.U_ID = 'test2';

-- 쿼리문
SELECT PD_NUM, U_ID, SUGGEST_PRICE, SUGGEST_TIME, HOPE_SATE
FROM TOTAL_DIRECT_VIEW3
WHERE PD_NUM = '1';


--○ 거래완료정보
-- 구매확정일시, 가격, 직거래일시, 직거래장소
CREATE OR REPLACE VIEW TOTAL_DIRECT_VIEW4
AS
SELECT SUBSTR(DP.DIRE_PD_ID, 6, 3) PD_NUM, DCB.BUY_COMP_DATE BUY_COMP_DATE, SL.SUGGEST_PRICE SUGGEST_PRICE, SL.SUGGEST_TIME SUGGEST_TIME, SL.SUGGEST_PLACE || SL.PLACE_DETAIL HOPE_SATE
FROM DIRECT_PRODUCT DP LEFT JOIN SUGGEST_LIST SL
ON DP.DIRE_PD_ID = SL.DIRE_PD_ID
LEFT JOIN SELECTED S
ON SL.SUGGEST_CODE = S.SUGGEST_CODE
LEFT JOIN DIRE_COMPLETE_BUY DCB
ON S.SELECTED_ID = DCB.SELECTED_ID;
WHERE SL.U_ID IS NOT NULL AND SL.U_ID = 'test2';

-- 쿼리문
SELECT PD_NUM, BUY_COMP_DATE, SUGGEST_PRICE, SUGGEST_TIME, HOPE_SATE
FROM TOTAL_DIRECT_VIEW4
WHERE PD_NUM = '1';

--○ 입찰내역
-- 입찰자ID, 입찰시간, 입찰가격, 입찰상태
CREATE OR REPLACE VIEW TOTAL_DIRECT_VIEW5
AS
SELECT SUBSTR(DP.DIRE_PD_ID, 6, 3) PD_NUM
,DP.U_ID B_U_ID
,SL.SUGGEST_DATE SUGGEST_DATE
,SL.SUGGEST_PRICE SUGGEST_PRICE
,CASE
WHEN DCS.SELL_COMP_DATE IS NOT NULL 
THEN '낙찰'
ELSE '유찰'
END AS DEAL_STATUS
FROM SUGGEST_LIST SL LEFT JOIN DIRECT_PRODUCT DP 
ON DP.DIRE_PD_ID = SL.DIRE_PD_ID
LEFT JOIN PRODUCT_MAKER PM
ON DP.PD_MAKER_ID = PM.PD_MAKER_ID
LEFT JOIN PRODUCT_CATEGORY PC
ON PM.PD_CATEGORY_ID = PC.PD_CATEGORY_ID
LEFT JOIN SELECTED S
ON SL.SUGGEST_CODE = S.SUGGEST_CODE
LEFT JOIN DIRE_COMPLETE_SELL DCS
ON DCS.SELECTED_ID = S.SELECTED_ID
LEFT JOIN DIRE_COMPLETE_BUY DCB
ON DCB.SELECTED_ID = S.SELECTED_ID;

-- 쿼리문
SELECT PD_NUM, B_U_ID, SUGGEST_DATE, SUGGEST_PRICE, DEAL_STATUS
FROM TOTAL_DIRECT_VIEW5
WHERE PD_NUM = '1';



--------------------------------------------------------------------------------

SELECT *
FROM ADMIN;


SELECT AD_ID, AD_PW
FROM ADMIN
WHERE AD_ID= 'cf_admin' AND AD_PW= 'comfit006$';
-- 맞지 않냐...?

--------------------------------------------------------------------------------
-- ○ 카테고리 검색 쿼리
SELECT U_ID, U_EMAIL, U_NAME, U_NICKNAME, U_TEL, U_JOINDATE, 
(
  SELECT COUNT(*) AS COUNT
  FROM
  (
  SELECT BAN_ID, BAN_DATE, REPORTED, REPORTER
  FROM DIRECT_TRANS_BANNED_VIEW
  UNION
  SELECT BAN_ID, BAN_DATE, REPORTED, REPORTER
  FROM DELIVERY_TRANS_BANNED_VIEW
  UNION
  SELECT BAN_ID, BAN_DATE, REPORTED, REPORTER
  FROM DIRECT_PD_BANNED_VIEW
  UNION
  SELECT BAN_ID, BAN_DATE, REPORTED, REPORTER
  FROM DELIVERY_PD_BANNED_VIEW
  )
  WHERE U_ID = REPORTED
) AS BANCOUNT
FROM USER_INFORMATION
WHERE U_NAME = U_NAME and u_name like '%%'
OR U_ID = U_ID and U_ID like '%%'
OR U_EMAIL = U_EMAIL and U_EMAIL like '%%';
--
SELECT 컬럼
FROM 테이블
WHERE 카테고리=#{카테고리} AND 컬럼 LIKE '%' || #{검색내용} || '%'

--------------------------------------------------------------------------------