-- ○ 직거래 상품 조회하는 쿼리
--    신고테이블에 없는 
CREATE OR REPLACE VIEW DIRE_PD_NEAR_VIEW
AS
SELECT DP.DIRE_PD_ID AS PD_ID, PD_NAME AS PD_NAME
     , DP.PD_HOPEPRICE AS PRICE
     , TO_NUMBER(SUBSTR(DP.PD_HOPE_MGRS, 0, INSTR(DP.PD_HOPE_MGRS, '/', 1)-1)) AS LAT
     , TO_NUMBER(SUBSTR(DP.PD_HOPE_MGRS, INSTR(DP.PD_HOPE_MGRS, '/', 1)+1)) AS LON
     , DP.PD_PHOTO
FROM DIRECT_PRODUCT DP JOIN PRODUCT_MAKER PM
     ON DP.PD_MAKER_ID = PM.PD_MAKER_ID
        JOIN PRODUCT_CATEGORY PC
          ON PM.PD_CATEGORY_ID = PC.PD_CATEGORY_ID
             JOIN COMFIT_USER CU
               ON DP.U_ID = CU.U_ID
                  JOIN USER_INFORMATION UI
                    ON CU.U_ID = UI.U_ID
WHERE DP.DIRE_PD_ID != (SELECT DISTINCT(PD_ID)
                        FROM DIRE_PD_REP_VIEW
                        WHERE PD_ID = 'dire_1');
--==> View DIRE_PD_NEAR_VIEW이(가) 생성되었습니다.
COMMIT;

SELECT DISTANCE_WGS84()
FROM DUAL;

SELECT V.PD_ID AS PD_ID, V.PD_NAME AS PD_NAME, V.PRICE AS PRICE, V.DISTANCE AS DISTANCE
FROM
(
SELECT PD_ID, PD_NAME, PRICE
     , ROUND(DISTANCE_WGS84(LAT, LON, 37.5618588, 126.9468339), 2) AS DISTANCE
FROM DIRE_PD_NEAR_VIEW
) V
ORDER BY V.DISTANCE;
 
CREATE OR REPLACE FUNCTION DISTANCE_WGS84(H_LAT IN NUMBER, H_LOT IN NUMBER, T_LAT IN NUMBER, T_LOT IN NUMBER)
RETURN NUMBER DETERMINISTIC
IS
BEGIN
  RETURN ( 6371.0 * ACOS(
    LEAST(1,
     COS( RADIANS(H_LAT) ) * COS( RADIANS(T_LAT) )
     * COS(RADIANS(T_LOT) - RADIANS(H_LOT) )
     + SIN( RADIANS (H_LAT) ) * SIN(RADIANS( T_LAT) )                                    
    )
  ));
END;


-- 택배상품신고테이블에서 ID뽑기
SELECT DELI_PD_ID AS PD_ID
FROM DELIVERY_PD_REPORT;

-- 직거래상품신고테이블에서 ID뽑기
SELECT DIRE_PD_ID AS PD_ID
FROM DIRECT_PD_REPORT;

-- 택배 거래신고테이블에서 ID뽑기
SELECT DELI_PD_ID AS PD_ID
FROM DELIVERY_TA_REPORT DTR JOIN BID_SUCCESS BS
     ON DTR.BS_ID = BS.BS_ID 
        JOIN BID_LIST BL
          ON BS.BID_CODE = BL.BID_CODE;

-- 직거래 거래신고테이블에서 ID뽑기
SELECT DIRE_PD_ID AS PD_ID
FROM DIRECT_TA_REPORT DTR JOIN SELECTED S
     ON DTR.SELECTED_ID = S.SELECTED_ID
        JOIN SUGGEST_LIST SL 
          ON S.SUGGEST_CODE = SL.SUGGEST_CODE;
          
-- 직거래 상품 신고유무를 확인하기위한 ID 조회
CREATE OR REPLACE VIEW DIRE_PD_REP_VIEW
AS
SELECT DR.PD_ID AS PD_ID
FROM
(
SELECT DIRE_PD_ID AS PD_ID
FROM DIRECT_PD_REPORT
UNION ALL
SELECT SL.DIRE_PD_ID AS PD_ID 
FROM DIRECT_TA_REPORT DTR JOIN SELECTED S
     ON DTR.SELECTED_ID = S.SELECTED_ID
        JOIN SUGGEST_LIST SL 
          ON S.SUGGEST_CODE = SL.SUGGEST_CODE
) DR
;
--==>> View DIRE_PD_REP_VIEW이(가) 생성되었습니다.

SELECT DISTINCT(PD_ID)
FROM DIRE_PD_REP_VIEW
WHERE PD_ID = 'dire_1';

-- ○ 택배거래 신고유무를 확인하기위한 ID 조회 뷰
CREATE OR REPLACE VIEW DELI_PD_REP_VIEW
AS
SELECT DL.PD_ID AS PD_ID
FROM
(
SELECT DELI_PD_ID AS PD_ID
FROM DELIVERY_PD_REPORT
UNION ALL
SELECT BL.DELI_PD_ID AS PD_ID 
FROM DELIVERY_TA_REPORT DTR JOIN BID_SUCCESS BS
     ON DTR.BS_ID = BS.BS_ID
        JOIN BID_LIST BL 
          ON BS.BID_CODE = BL.BID_CODE
) DL
;
--==>> View DELI_PD_REP_VIEW이(가) 생성되었습니다.

SELECT DISTINCT(PD_ID)
FROM DELI_PD_REP_VIEW
WHERE PD_ID = 'deli_1';
