-- COMFIT_USER 용 시퀀스
CREATE SEQUENCE COMFIT_USER_SEQ
NOCACHE;
--==>> Sequence COMFIT_USER_SEQ이(가) 생성되었습니다.


COMMIT;

SELECT U_ID
FROM COMFIT_USER;

select
COMFIT_USER_SEQ.currval
from dual;

select
COMFIT_USER_SEQ.nextval
from dual;

-- 회원가입 순서 1. U_ID 인서트 2. 회원인포 인서트 3. 이메일 인증 인서트
-- 멤버 인서트
INSERT INTO COMFIT_USER(U_ID) VALUES(CONCAT('test', COMFIT_USER_SEQ.NEXTVAL))
;
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO USER_INFORMATION (U_EMAIL, U_NAME, U_ADDRESS, U_PASSWORD, U_TEL, U_NICKNAME, U_ID)
VALUES('hjui781@naver.com', '김민성', '인천 계양구 새벌로 112번길 12 405동 1703호'
, CRYPTPACK.ENCRYPT('1234','1234'), '010-1111-1111', '김깐돌23', ???)
;

INSERT INTO USER_EMAIL_AUTH(E_AUTH_ID, AUTH_CODE, U_ID, AU_CATE_ID )
VALUES(CONCAT('auth_', USER_EMAIL_AUTH_SEQ.NEXTVAL), '2inR6denlG',???, 1)
;




COMMIT;



SELECT *
FROM USER_EMAIL_AUTH;



-- 가장 최근 U_ID 조회 구문
SELECT U_ID
FROM (
    SELECT U_ID 
    FROM COMFIT_USER
    ORDER BY CDATE DESC
)
WHERE ROWNUM =1;


alter session set nls_date_format='YYYY/MM/DD HH24:MI:SS';

COMMIT;

-- 이메일 인증 완료 쿼리
UPDATE USER_EMAIL_AUTH
SET AUTH_USE_DATE = SYSDATE 
WHERE AUTH_CODE = '2inR6denlG'
;

-- 이메일 인증 사용 여부 확인
SELECT nvl(to_char(AUTH_USE_DATE, 'yyyy-mm-dd'), 'x') as use     
FROM USER_EMAIL_AUTH
WHERE AUTH_CODE = 'RK3MNcjQ7A'
;

