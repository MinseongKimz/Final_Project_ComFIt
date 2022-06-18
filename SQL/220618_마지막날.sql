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

SELECT *
FROM BID_LIST
WHERE DELI_PD_ID = 'deli_1';

-- ○ 경매 종료 기준점 '0' 반환하는 쿼리문
SELECT  ROUND(REMAIN_DATE-SYSDATE) AS END_DATE
FROM
(
SELECT (PD_REGIT_DATE+5) AS REMAIN_DATE
		FROM DELI_PD_LIST_REALVIEW
		WHERE PD_ID = 'deli_1'
) ;




-- ○ 해당 상품에 해당 회원이 구매제안을 했다면 :
SELECT COUNT(*) AS US_CHECK
FROM SUGGEST_LIST
WHERE DIRE_PD_ID = 'dire_2' AND U_ID = 'test';
     
