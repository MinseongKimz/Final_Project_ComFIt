-- [데이터 입력 : 2022-06-10, 오이삭 / 김상기]

SELECT USER
FROM DUAL;
--==>> COMFIT

-- ○ 상품카테고리
INSERT INTO PRODUCT_CATEGORY(PD_CATEGORY_ID, CATEGORY_NAME)
VALUES (1, 'CPU');
INSERT INTO PRODUCT_CATEGORY(PD_CATEGORY_ID, CATEGORY_NAME)
VALUES (2, '그래픽카드');
INSERT INTO PRODUCT_CATEGORY(PD_CATEGORY_ID, CATEGORY_NAME)
VALUES (3, '메모리');
--==>> 1 행 이(가) 삽입되었습니다. * 3

SELECT *
FROM PRODUCT_CATEGORY;
/*
1	CPU
2	그래픽카드
3	RAM
4	메인보드
5	SSD
6	HDD
7	외장HDD/SSD
8	PC케이스
9	파워서플라이
10	키보드
11	마우스
12	모니터
13	PC스피커
14	프린터
15	공유기
16	노트북
*/

UPDATE PRODUCT_CATEGORY
SET CATEGORY_NAME = '복합기'
WHERE PD_CATEGORY_ID = '14';


--------------------------------------------------------------------------------
DESC PRODUCT_MAKER;
-- ○ 제조사
INSERT INTO PRODUCT_MAKER(PD_MAKER_ID, MAKER_NAME, MAKER_NAME2, PD_CATEGORY_ID)
VALUES('maker_1', '인텔', 'Intel', 1);
INSERT INTO PRODUCT_MAKER(PD_MAKER_ID, MAKER_NAME, MAKER_NAME2, PD_CATEGORY_ID)
VALUES('maker_2', 'AMD', '에이엠디', 1);

INSERT INTO PRODUCT_MAKER(PD_MAKER_ID, MAKER_NAME, MAKER_NAME2, PD_CATEGORY_ID)
VALUES('maker_3', 'NVIDIA', '엔비디아', 2);
INSERT INTO PRODUCT_MAKER(PD_MAKER_ID, MAKER_NAME, MAKER_NAME2, PD_CATEGORY_ID)
VALUES('maker_4', 'AMD', '에이엠디', 2);

INSERT INTO PRODUCT_MAKER(PD_MAKER_ID, MAKER_NAME, MAKER_NAME2, PD_CATEGORY_ID)
VALUES('maker_5', '삼성', 'SAMSUNG', 3);
INSERT INTO PRODUCT_MAKER(PD_MAKER_ID, MAKER_NAME, MAKER_NAME2, PD_CATEGORY_ID)
VALUES('maker_6', 'Micron', '마이크론', 3);
--==>> 1 행 이(가) 삽입되었습니다. * 6

SELECT *
FROM PRODUCT_MAKER;
/*
maker_1	인텔	Intel	        1
maker_2	AMD	    에이엠디	    1
maker_3	NVIDIA	엔비디아    	2
maker_4	AMD	    에이엠디	    2
maker_5	삼성	SAMSUNG	        3
maker_6	Micron	마이크론	    3
*/
--------------------------------------------------------------------------------
DESC PRODUCT_AS;

INSERT INTO PRODUCT_AS(PD_AS_ID, PD_AS_NAME)
VALUES(1, '유상가능');
INSERT INTO PRODUCT_AS(PD_AS_ID, PD_AS_NAME)
VALUES(2, '무상가능');
INSERT INTO PRODUCT_AS(PD_AS_ID, PD_AS_NAME)
VALUES(3, '불가능');
--==>> 1 행 이(가) 삽입되었습니다. * 3

SELECT *
FROM PRODUCT_AS;
/*
1	유상가능
2	무상가능
3	불가능
*/

--------------------------------------------------------------------------------
-- ○ 상품신고사유 카테고리
DESC PD_REP_CATEGORY;

INSERT INTO PD_REP_CATEGORY(PD_REP_CID, REP_CATE_NAME)
VALUES(1, '허위내용');
INSERT INTO PD_REP_CATEGORY(PD_REP_CID, REP_CATE_NAME)
VALUES(2, '불법홍보물');
INSERT INTO PD_REP_CATEGORY(PD_REP_CID, REP_CATE_NAME)
VALUES(3, '유해매체물');
--==>> 1 행 이(가) 삽입되었습니다. * 3

SELECT *
FROM PD_REP_CATEGORY;
/*
1	허위내용
2	불법홍보물
3	유해매체물
*/

COMMIT;
--==>> 커밋 완료.

--------------------------------------------------------------------------------
-- ○ 거래신고사유 카테고리
DESC TRANS_REP_CATEGORY;

INSERT INTO TRANS_REP_CATEGORY(TRANS_REP_CID, REP_CATE_NAME)
VALUES(1, 'NOSHOW');
INSERT INTO TRANS_REP_CATEGORY(TRANS_REP_CID, REP_CATE_NAME)
VALUES(2, '상품의변질');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TRANS_REP_CATEGORY;
/*
1	NOSHOW
2	상품의변질
*/
--------------------------------------------------------------------------------
-- ○ 인증종류 카테고리
INSERT INTO AUTH_CATEGORY(AU_CATE_ID,AU_NAME)
VALUES(1, '인증안됨');
INSERT INTO AUTH_CATEGORY(AU_CATE_ID,AU_NAME)
VALUES(2, '인증됨');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM AUTH_CATEGORY;
/*
1	인증안됨
2	인증됨
*/

--------------------------------------------------------------------------------
-- ○ 은행 카테고리
INSERT INTO BANK(BANK_ID,BANK_NAME)
VALUES(1, 'KB국민은행');
INSERT INTO BANK(BANK_ID,BANK_NAME)
VALUES(2, '신한은행');
INSERT INTO BANK(BANK_ID,BANK_NAME)
VALUES(3, '농협');
--==>> 1 행 이(가) 삽입되었습니다. * 3

SELECT *
FROM BANK;
/*
1	KB국민은행
2	신한은행
3	농협
*/


--------------------------------------------------------------------------------
-- ○ 공지사항 카테고리
INSERT INTO ANNOUNCE_CATEGORY(ANOUN_CATE_ID,ANOUN_CATE_NAME)
VALUES(1, '점검/업데이트');
INSERT INTO ANNOUNCE_CATEGORY(ANOUN_CATE_ID,ANOUN_CATE_NAME)
VALUES(2, '이벤트');
INSERT INTO ANNOUNCE_CATEGORY(ANOUN_CATE_ID,ANOUN_CATE_NAME)
VALUES(3, '공지');
--==>> 1 행 이(가) 삽입되었습니다. * 3

SELECT *
FROM  ANNOUNCE_CATEGORY;
/*
1	점검/업데이트
2	이벤트
3	공지
*/

--------------------------------------------------------------------------------
-- ○ 문의 카테고리
INSERT INTO ASK_CATEGORY(ASK_CATE_ID,ASK_CATE_NAME)
VALUES(1, '판매');
INSERT INTO ASK_CATEGORY(ASK_CATE_ID,ASK_CATE_NAME)
VALUES(2, '구매');
INSERT INTO ASK_CATEGORY(ASK_CATE_ID,ASK_CATE_NAME)
VALUES(3, '신고');
INSERT INTO ASK_CATEGORY(ASK_CATE_ID,ASK_CATE_NAME)
VALUES(4, '계정');
--==>> 1 행 이(가) 삽입되었습니다. * 4

SELECT *
FROM  ASK_CATEGORY;
/*
1	판매
2	구매
3	신고
4	계정
*/

--------------------------------------------------------------------------------
-- ○ 문의 카테고리
INSERT INTO BAN_CATEGORY(BAN_CATE_ID,BAN_CATE_NAME)
VALUES(1, '3일차단');
INSERT INTO BAN_CATEGORY(BAN_CATE_ID,BAN_CATE_NAME)
VALUES(2, '7일차단');
INSERT INTO BAN_CATEGORY(BAN_CATE_ID,BAN_CATE_NAME)
VALUES(3, '30일차단');
INSERT INTO BAN_CATEGORY(BAN_CATE_ID,BAN_CATE_NAME)
VALUES(4, '영구차단');
--==>> 1 행 이(가) 삽입되었습니다. * 4

SELECT *
FROM BAN_CATEGORY;
/*
1	3일차단
2	7일차단
3	30일차단
4	영구차단
*/


--------------------------------------------------------------------------------
DESC REP_HANDLE_CATEGORY;
-- ○ 신고처리분류 카테고리
INSERT INTO REP_HANDLE_CATEGORY(HAN_CATE_ID, HAN_CATE_NAME)
VALUES(1, '신고자패널티');
INSERT INTO REP_HANDLE_CATEGORY(HAN_CATE_ID, HAN_CATE_NAME)
VALUES(2, '피신고자패널티');
INSERT INTO REP_HANDLE_CATEGORY(HAN_CATE_ID, HAN_CATE_NAME)
VALUES(3, '둘다패널티');
INSERT INTO REP_HANDLE_CATEGORY(HAN_CATE_ID, HAN_CATE_NAME)
VALUES(4, '둘다패널티없음');
--==>> 1 행 이(가) 삽입되었습니다. * 4

SELECT *
FROM REP_HANDLE_CATEGORY;
/*
1	신고자패널티
2	피신고자패널티
3	둘다패널티
4	둘다패널티없음
*/

COMMIT;
--------------------------------------------------------------------------------

-- ○ 신고자종류 카테고리
INSERT INTO REPORTER_CATEGORY(REPORTER_ID, REPORTER_PROP)
VALUES(1, '구매자');
INSERT INTO REPORTER_CATEGORY(REPORTER_ID, REPORTER_PROP)
VALUES(2, '판매자');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM REPORTER_CATEGORY;
/*
1	구매자
2	판매자
*/
--------------------------------------------------------------------------------
-- [ 알람확인여부 테이블 생성 ]
--  알람 확인여부 코드를 참조하는 테이블에 컬럼 추가
-- 1. 입찰등록          완료
-- 2. 구매제안등록      완료
-- 3. 낙찰              완료
-- 4. 채택              완료
-- 5. 문의              완료
CREATE TABLE ALARM_OK
( ALARM_CODE        NUMBER
, ALARM_COMMIT      VARCHAR2(20)    NOT NULL
, CONSTRAINT ALARM_CODE_PK PRIMARY KEY(ALARM_CODE)
);
--==>> Table ALARM_OK 이(가) 생성되었습니다.

INSERT INTO ALARM_OK(ALARM_CODE, ALARM_COMMIT)
VALUES(1, '미확인');
INSERT INTO ALARM_OK(ALARM_CODE, ALARM_COMMIT)
VALUES(2, '확인');
--==>> 1 행 이(가) 삽입되었습니다. * 2
SELECT *
FROM ALARM_OK;

COMMIT;
--==>> 커밋 완료.

--------------------------------------------------------------------------------
-- 2022-06-10 16:00 데이터 입력
-- [직거래상품등록]
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
VALUES('dire_1', 'NVIDIA 그래픽카드 개급처', 'GeForce RTX 3060 Ti', 'C:\Downloads', '6개월'
                         , 1000000, TO_DATE('2022-06-10', 'YYYY-MM-DD'), TO_DATE('2022-06-15', 'YYYY-MM-DD')
                         , '14:00', '17:00'
                         , '서울 도봉구 우이천로 50길 44', '37.6568258/127.0178972'
                         , 'maker_3', 2, 'test1' 
       );
--==>> 1 행 이(가) 삽입되었습니다.
       
                         
SELECT *
FROM DIRECT_PRODUCT;
--==>> dire_1	NVIDIA 그래픽카드 개급처	GeForce RTX 3060 Ti	C:\Downloads	6개월	0	1000000	2022-06-10	2022-06-15	14:00	17:00	서울 도봉구 우이천로 50길 44	37.6568258/127.0178972	2022-06-10	maker_3	2	test1

-- [구매제안등록] 데이터 입력
INSERT INTO SUGGEST_LIST(SUGGEST_CODE, SUGGEST_PRICE, SUGGEST_TIME
                       , SUGGEST_PLACE, PLACE_DETAIL, U_ID, DIRE_PD_ID)
VALUES('suggest_1', 950000, TO_DATE('2022-06-12 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), '서울 도봉구 우이천로 50길 40', '우림슈퍼앞', 'test2', 'dire_1');                      
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM DELIVERY_PRODUCT;

-- 택배거래상품등록
INSERT INTO DELIVERY_PRODUCT(DELI_PD_ID, PD_TITLE, PD_NAME, PD_PHOTO, PD_AS_REMAIN
                         , PD_START_PRICE, PD_HITCOUNT, PD_REGIT_DATE, PD_MAKER_ID, PD_AS_ID, U_ID, CF_PRICE)
VALUES('deli_1', 'i-7 8700 저렴하게 판매', 'intel I-7 8700', 'C:\Downloads', '1년 3개월'
                         , 150000, 0, TO_DATE('2022-06-10', 'YYYY-MM-DD'), 
                         , 'maker_1', 1, 'test2', 0);




SELECT *
FROM SUGGEST_LIST;

desc DELIVERY_PRODUCT;
/*
suggest_1	950000	2022-06-12	2022-06-10	서울 도봉구 우이천로 50길 40	우림슈퍼앞	test2	dire_1	1
*/


DESC SELECTED;

-- [채택]테이블 데이터입력
INSERT INTO SELECTED(SELECTED_ID, BUYER_CODE, SELLER_CODE, SUGGEST_CODE)
VALUES('sel_1', 'abc123', 'def456', 'suggest_1');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM SELECTED;
/*
sel_1	2022-06-10	abc123	def456	suggest_1	1
*/
ALTER TABLE DIRE_COMPLETE_BUY
MODIFY REVIEW VARCHAR2(100);

INSERT INTO DIRE_COMPLETE_SELL(DIRE_COMP_SELL_ID, REVIEW, SELECTED_ID)
VALUES('rcSell_1', '좋았어요', 'sel_1');
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO DIRE_COMPLETE_BUY(DIRE_COMP_BUY_ID, REVIEW, SELECTED_ID)
VALUES('rcBuy_1', '좋았어요', 'sel_1');
--==>> 1 행 이(가) 삽입되었습니다.



-- [FAQ] 테이블 데이터 입력                         
INSERT INTO FAQ(FAQ_ID, FAQ_TITLE, FAQ_CONTENTS)
VALUES(1, '구매확정이란?', '구매확정이란 거래가 완료된 이후 거래가 잘 성사되었음을 확인시켜주는 행위입니다. 마이페이지에서 진행하실 수 있습니다.');
--==>> 1 행 이(가) 삽입되었습니다.


ALTER TABLE ASK_ANSWER
MODIFY ANSWER_DATE DATE DEFAULT SYSDATE;

-- [공지사항] 테이블 데이터 입력

INSERT INTO ANNOUNCE(ANNOUNCE_ID, ANNOUNCE_TITLE, ANNOUNCE_CONTENTS, ANOUN_CATE_ID)
VALUES('ann_1', '사용자 편의도모를 위한 점검안내', '잠시 후 22:30 ~ 23:30 간 서버점검이 있을 예정입니다.'
     , 1);


-- [문의등록] 테이블 데이터 입력
INSERT INTO ASK(ASK_ID, ASK_TITLE, ASK_CONTENTS, U_ID, ASK_CATE_ID)
VALUES('ask_1', '신고는 어떻게하나요??', '이상한 게시물을 봤는데 어떻게 신고하는지 궁금합니다.', 'test2', 3);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO ASK_ANSWER(ASK_ID, ANSWER_CONTENTS, AD_ID)
VALUES('ask_1', '입찰/구매제안이 있는경우 신고는 불가합니다, 입찰/구매제안이 없는 게시물인 경우 해당 상품의 상세페이지에서 신고하기 버튼을 통해 신고 가능합니다.'
     , 'cf_admin');
--==>> 1 행 이(가) 삽입되었습니다.


INSERT INTO ADMIN(AD_ID, AD_PW)
VALUES('cf_admin', 'comfit006$');
--==>> 1 행 이(가) 삽입되었습니다.


     
COMMIT;