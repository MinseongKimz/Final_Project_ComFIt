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
EXEC ADD_SUGGEST(200000, '2022-06-19', '14:00:00', '인천 청천', '공장', 'test2', 'dire_42');        

SELECT U_POINT as V_POINT
FROM ALL_USER_POINT_VIEW2
WHERE U_ID = 'test2';
SELECT *
FROM SEQ;

-- ○ 해당 상품에 구매제안이 하나라도 달려있다면 숫자반환, 없으면 0반환
SELECT COUNT(*) AS SL_CHECK
FROM SUGGEST_LIST
WHERE DIRE_PD_ID = 'dire_2';

-- ○ 해당 상품에 입찰이 하나라도 달려있다면 숫자반환, 없으면 0 반환(삭제, 수정 불가)
SELECT COUNT(*) AS BL_CHECK
FROM BID_LIST
WHERE DELI_PD_ID = 'deli_1';

-- ○ 해당 상품에 내가 입찰을 하였다면 숫자 반환
SELECT COUNT(*) AS UB_CHECK
FROM BID_LIST
WHERE DELI_PD_ID = 'deli_1' AND U_ID = 'test';

-- ○ 해당 택배상품에 입찰 가격 중 가장 높은가격 반환'
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
-- ○ 입찰 프로시저 생성
CREATE OR REPLACE PROCEDURE ADD_BID
(
    V_PRICE IN BID_LIST.BID_PRICE%TYPE  -- 가격
  , V_ADDRESS IN BID_LIST.ADDRESS%TYPE  -- 주소
  , V_ADDR_DETAIL IN BID_LIST.ADDR_DETAIL%TYPE  -- 주소상세
  , V_U_ID  IN BID_LIST.U_ID%TYPE -- 사람코드
  , V_DELI_PD_ID IN BID_LIST.DELI_PD_ID%TYPE --  상품코드  

)
IS
    V_POINT             NUMBER := 0;
    V_HIGHPRICE         NUMBER := 0;
    V_BID_CHECK         NUMBER := 0; 
    V_ST_PRICE          NUMBER := 0;
    V_IMD_PRICE         NUMBER := 0;
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    
    -- 포인트 확인
    SELECT U_POINT INTO V_POINT
    FROM ALL_USER_POINT_VIEW2
    WHERE U_ID = V_U_ID;
    
    -- 포인트가 입력한 가격보다 적다면 미입력
    IF V_POINT < V_PRICE
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
       
    -- 해당 상품이 입찰목록에 있는지 확인 없으면 0 반환
    SELECT COUNT(*) INTO V_BID_CHECK
     FROM BID_LIST
    WHERE DELI_PD_ID = V_DELI_PD_ID;
    
    -- 시작가격확인
    SELECT PD_START_PRICE INTO V_ST_PRICE
     FROM DELIVERY_PRODUCT
    WHERE DELI_PD_ID = V_DELI_PD_ID;
    
    -- 즉시구매가 확인
    SELECT IMD_PRICE INTO V_IMD_PRICE
     FROM DELIVERY_PRODUCT
    WHERE DELI_PD_ID = V_DELI_PD_ID;
    
    IF V_IMD_PRICE < V_PRICE
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
     -- 있다면 가격확인 V_HIGHPRICE
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

    
    -- 입찰리스트 존재하면서, 제안한 가격이 기존에 입찰한 최고가보다 높다면 바로 인서트
    IF V_BID_CHECK != 0 AND V_PRICE > V_HIGHPRICE AND V_PRICE > V_ST_PRICE        
        THEN    -- 입력
            INSERT INTO BID_LIST(BID_CODE, BID_PRICE, ADDRESS, ADDR_DETAIL, U_ID, DELI_PD_ID)
            VALUES (CONCAT('bid_', TO_CHAR(BID_SEQ.NEXTVAL) ), V_PRICE, V_ADDRESS, V_ADDR_DETAIL, V_U_ID, V_DELI_PD_ID);
    -- 입찰리스트에 존재하지 않으면서(첫번째입찰이면서) 제안한 가격이 시작가보다 높다면 바로 인서트            
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
            THEN RAISE_APPLICATION_ERROR(-20003, '인서트오류 발생');
            ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;     
END ADD_BID;
--==>> Procedure ADD_BID이(가) 컴파일되었습니다.

-- ○ 입찰 프로시저 호출(1) 입찰 가격이 시작가보다 낮은경우
EXEC ADD_BID( 1, '인천광역시 중구 신포2동', '아파트앞삼거리', 'test36', 'deli_20');     
--==>> ORA-20003: 인서트오류 발생
-- ○ 입찰 프로시저 호출(2) 내 포인트보다 많이 입찰시도하는 경우
EXEC ADD_BID( 333333333, '인천광역시 중구 신포2동', '아파트앞삼거리', 'test36', 'deli_20');    
--==>> ORA-20003: 인서트오류 발생
-- ○ 입찰 프로시저 호출(3) 정상적으로 입찰하는 경우
EXEC ADD_BID( 200003, '인천광역시 중구 신포2동', '아파트앞삼거리', 'test36', 'deli_20');    
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.
SELECT *
 FROM BID_LIST;
WHERE DELI_PD_ID = 'deli_20';
--==>> deli_9	2022-06-19	200003	인천광역시 중구 신포2동	아파트앞삼거리	test36	deli_20	1    
-- ○ 입찰 프로시저 호출(4) 기존 가격보다 적게하는 경우
EXEC ADD_BID( 200001, '인천광역시 중구 신포2동', '아파트앞삼거리', 'test36', 'deli_20');        
--==>> ORA-20003: 인서트오류 발생
COMMIT;

--==>> 입찰최고가 추출 
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

-- ○ 포인트조회
SELECT *
FROM ALL_USER_POINT_VIEW2;

-- ○ 해당 상품에 입찰이 있는지 반환
SELECT *
 FROM BID_LIST
WHERE DELI_PD_ID = 'deli_1';

ROLLBACK;

SELECT *
FROM BID_LIST;
COMMIT;    
INSERT INTO BID_LIST(BID_CODE, BID_PRICE, ADDRESS, ADDR_DETAIL, U_ID, DELI_PD_ID)
VALUES (CONCAT('bid_', TO_CHAR(BID_SEQ.NEXTVAL) ), 160000, '인천광역시 중구 신포2동', '아파트앞삼거리', 'test33', 'deli_1');

ROLLBACK;
-- 높은가격 추출
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

-- ○ 경매 종료 기준점 '0' 반환하는 쿼리문
SELECT  ROUND(REMAIN_DATE-SYSDATE) AS END_DATE
FROM
(
SELECT (PD_REGIT_DATE+5) AS REMAIN_DATE
		FROM DELI_PD_LIST_REALVIEW
		WHERE PD_ID = 'deli_1'
) ;


-- ○ 구매제안 프로시저 생성
-- 입찰 점검 완료 -> 즉시구매가로 입찰
-- 입찰완료되면
-- 입찰성공 테이블에 인서트(BS_ID, BID_CODE)
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
--==>> Sequence BS_SEQ이(가) 생성되었습니다.

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
-- ○ 해당 상품에 해당 회원이 구매제안을 했다면 :
SELECT COUNT(*) AS US_CHECK
FROM SUGGEST_LIST
WHERE DIRE_PD_ID = 'dire_2' AND U_ID = 'test';

-- ○ 뷰 수정
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
--==>> View USER_SELL_COUNT_VIEW이(가) 생성되었습니다.

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
-- ○ 해당 상품이 낙찰 되었는지 조회
SELECT BS.BS_ID AS BS_ID, BS.BID_CODE AS BID_CODE, BL.BID_PRICE AS FINAL_PRICE
     , BL.U_ID AS U_ID, BL.DELI_PD_ID AS PD_ID
FROM BID_SUCCESS BS JOIN BID_LIST BL
     ON BS.BID_CODE = BL.BID_CODE
WHERE BL.DELI_PD_ID = 'deli_1' ;
--==>> bs_1	bid_1	155000	test1	deli_1


COMMIT;
-- ○ 해당 상품이 낙찰 되었는지 조회
SELECT COUNT(*) AS BUY_COUNT
FROM BID_SUCCESS BS JOIN BID_LIST BL
     ON BS.BID_CODE = BL.BID_CODE
WHERE BL.DELI_PD_ID = 'deli_1';

-- ○ 해당 상품을 입찰한 사람이 낙찰하였는지 조회
SELECT COUNT(*) AS BS_COUNT
FROM BID_SUCCESS BS JOIN BID_LIST BL
     ON BS.BID_CODE = BL.BID_CODE
WHERE BL.DELI_PD_ID = 'deli_20' AND BL.U_ID = 'test33';
SELECT *
FROM BID_LIST;

-- ○ 낙찰된 상품의 입찰코드와 가격을 조회
SELECT BL.BID_CODE, BL.BID_PRICE AS FINAL_PRICE
FROM BID_SUCCESS BS JOIN BID_LIST BL
      ON BS.BID_CODE = BL.BID_CODE
WHERE BL.DELI_PD_ID = 'd320';      

SELECT ROUND(SYSDATE - PD_HOPE_EDATE) AS END_DATE
FROM DIRECT_PRODUCT
WHERE DIRE_PD_ID = 'dire_1';


-- ○ 현재 가격을 조회
SELECT BID_PRICE
FROM BID_LIST
WHERE DELI_PD_ID = 'deli_3';



-- ○ 현재가격에서 가장 높은가격 조회
SELECT B.BID_PRICE AS NOW_PRICE
  FROM
            (
             SELECT BID_PRICE, RANK() OVER(ORDER BY BID_PRICE DESC) AS RANK
             FROM BID_LIST
             WHERE DELI_PD_ID = 'deli_3'
            )B
WHERE B.RANK = 1;
          
-- ○ 입찰이 존재한다면
SELECT COUNT(*)
FROM BID_LIST
WHERE DELI_PD_ID='deli_3'
          
deli_9
deli_12





