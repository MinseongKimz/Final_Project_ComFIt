
--==>> 마이페이지 자세한정보
SELECT U_EMAIL, U_NICKNAME, U_NAME
, SUBSTR(CRYPTPACK.DECRYPT(U_PASSWORD,'1234'),1,1) 
|| LPAD('*',LENGTH(CRYPTPACK.DECRYPT(U_PASSWORD,'1234'))-1,'*') as U_PASSWORD
, U_TEL, U_ADDRESS
FROM USER_INFORMATION
WHERE U_ID = 'test1';


--==>>
/*
issac1162@test.com	삭이오	        1***	010-2988-1162	인천광역시 중구 신흥동1가 6-4
kkk@naver.com	    민성킴의활약	1***	010-2222-3333	서울특별시 중구 을지로 5가 223-4
hjui78@naver.com	김깐돌	        1***	010-1111-1111	인천 계양구 새벌로 112번길 12 405동 1703호
*/

--==>> MYPAGE 출력용
SELECT U_NICKNAME, U_PROFILE
FROM USER_INFORMATION
WHERE U_ID = 'test1';


--==>> 입출금 내역 VIEW 만들기
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

--==>> 마이페이지에 보여주기 위해 행 추가+행 이름 변환, 날짜로 정렬
--> 조건으로 해당인물의 입출금내역 출력
SELECT M_DATE, M_MONEY
, CASE WHEN SUBSTR(M_ID,1,3) = 'inm' THEN '입금'
        WHEN SUBSTR(M_ID,1,4) = 'outm' THEN '출금'
    ELSE '에러' END AS INOUT
FROM MONEY_INOUT_VIEW
WHERE U_ID = 'test1';

SELECT POINT
FROM ALL_USER_POINT_VIEW
WHERE U_ID = 'test1';

--==>> 판매 시작일	최종 금액	상품정보	방식	예정 장소	직거래 예정 일시	실제 거래 일시	상태
--BIDCOUNT = 입찰 갯수
--거래상태 : 입찰 받는 중(수정/삭제 가능)              : BIDCOUNT = 0
--         : 경매 중(수정/삭제 불가능)                 : BIDCOUNT > 0
--         : 거래 중(낙찰 완료)                        : SUCCESSCOUNT = 1, COMPLETECOUNT = 0
--         : 구매확정 대기중(구매확정하면 거래완료)    : SELLCOUNT = 1, BUYCOUNT = 0
--         : 판매확정 대기중(판매확정하면 거래완료)    : BUYCOUNT = 1, SELLCOUNT = 0
--         : 거래 완료(판매자가 POINT를 받은 상태)     : COMPLETECOUNT = 2

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
