
--> 원래 입출금내역 출력문
SELECT M_DATE, M_MONEY
, CASE WHEN SUBSTR(M_ID,1,3) = 'inm' THEN '입금'
        WHEN SUBSTR(M_ID,1,4) = 'outm' THEN '출금'
    ELSE '에러' END AS INOUT
FROM MONEY_INOUT_VIEW
WHERE U_ID = 'test1'
ORDER BY M_DATE DESC;


--> 입출금내역 상세보기 페이지에서
--> 페이징 처리 SQL문(10개만 보이기)
	SELECT M_DATE, M_MONEY, INOUT
	FROM
	(
	    SELECT M_DATE, M_MONEY, INOUT, ROWNUM AS RN
	    FROM
	    (
	    SELECT M_DATE, M_MONEY
	    , CASE WHEN SUBSTR(M_ID,1,3) = 'inm' THEN '입금'
	            WHEN SUBSTR(M_ID,1,4) = 'outm' THEN '출금'
	        ELSE '에러' END AS INOUT
	    FROM MONEY_INOUT_VIEW
	    WHERE U_ID = 'test1'
	    ORDER BY M_DATE DESC
	    )
	)
	WHERE RN BETWEEN 1 AND 10;
    
--> 입출금내역 총갯수
SELECT COUNT(*) AS COUNT
	FROM
	(
	    SELECT M_DATE, M_MONEY, INOUT, ROWNUM AS RN
	    FROM
	    (
	    SELECT M_DATE, M_MONEY
	    , CASE WHEN SUBSTR(M_ID,1,3) = 'inm' THEN '입금'
	            WHEN SUBSTR(M_ID,1,4) = 'outm' THEN '출금'
	        ELSE '에러' END AS INOUT
	    FROM MONEY_INOUT_VIEW
	    WHERE U_ID = 'test1'
	    ORDER BY M_DATE DESC
	    )
	);


    SELECT COUNT(*) AS COUNT
    FROM
    (
    SELECT PD_ID, PD_TITLE, PD_PRICE, SYSTEM, PD_REGIT_DATE, TIME, COMP_DATE, SELLER_ID, BUYER_ID, ADDRESS, STATUS
    , SELECTED_ID, SELECTED_DATE, BUYER_CODE, SELLER_CODE
    , BS_ID, BS_DATE
    , ROW_NUMBER() OVER(PARTITION BY PD_ID ORDER BY COMP_DATE ASC, BS_DATE ASC, SELECTED_DATE ASC) AS RN
    , ROWNUM AS RNUM
    FROM DETAIL_BUYLIST_VIEW
    WHERE SELLER_ID = 'test1'
    ORDER BY PD_REGIT_DATE DESC
    )
    WHERE RN=1
    ;

    SELECT S.*
    FROM
    (
        SELECT A.*, ROWNUM AS RRN
        FROM
        (
        SELECT PD_ID, PD_TITLE, PD_PRICE, SYSTEM, PD_REGIT_DATE
        , TIME, COMP_DATE, SELLER_ID, BUYER_ID, ADDRESS, STATUS
        , SELECTED_ID, SELECTED_DATE, BUYER_CODE, SELLER_CODE
        , BS_ID, BS_DATE, DELI_NUM
        FROM DETAIL_BUYLIST_VIEW
        WHERE BUYER_ID = 'test1'
        ORDER BY PD_REGIT_DATE DESC
        ) A 
    ) S
    WHERE RRN BETWEEN 0 AND 10;
    
    SELECT COUNT(*)
    FROM
    (
    SELECT PD_ID, PD_TITLE, PD_PRICE, SYSTEM, PD_REGIT_DATE
    , TIME, COMP_DATE, SELLER_ID, BUYER_ID, ADDRESS, STATUS
    , SELECTED_ID, SELECTED_DATE, BUYER_CODE, SELLER_CODE
    , BS_ID, BS_DATE, DELI_NUM
    FROM DETAIL_BUYLIST_VIEW
    WHERE BUYER_ID = 'test1'
    ORDER BY PD_REGIT_DATE DESC
    );

    SELECT S.*
    FROM
    (
        SELECT PD_ID, PD_TITLE, NVL(PD_PRICE, -1) AS PD_PRICE, SYSTEM, PD_REGIT_DATE
        , TIME, COMP_DATE, SELLER_ID, BUYER_ID, ADDRESS, STATUS
        , SELECTED_ID, SELECTED_DATE, BUYER_CODE, SELLER_CODE
        , BS_ID, BS_DATE, ROWNUM AS RRN
        FROM
        (
        SELECT PD_ID, PD_TITLE, PD_PRICE, SYSTEM, PD_REGIT_DATE, TIME, COMP_DATE, SELLER_ID, BUYER_ID, ADDRESS, STATUS
        , SELECTED_ID, SELECTED_DATE, BUYER_CODE, SELLER_CODE
        , BS_ID, BS_DATE
        , ROW_NUMBER() OVER(PARTITION BY PD_ID ORDER BY COMP_DATE ASC, BS_DATE ASC, SELECTED_DATE ASC) AS RN
        FROM DETAIL_BUYLIST_VIEW
        WHERE SELLER_ID = 'test1'
        ORDER BY PD_REGIT_DATE DESC
        )
        WHERE RN=1
    ) S
    WHERE RRN BETWEEN 0 AND 10;


