-- COMFIT_USER �� ������
CREATE SEQUENCE COMFIT_USER_SEQ
NOCACHE;
--==>> Sequence COMFIT_USER_SEQ��(��) �����Ǿ����ϴ�.


COMMIT;

SELECT U_ID
FROM COMFIT_USER;

select
COMFIT_USER_SEQ.currval
from dual;

select
COMFIT_USER_SEQ.nextval
from dual;

-- ȸ������ ���� 1. U_ID �μ�Ʈ 2. ȸ������ �μ�Ʈ 3. �̸��� ���� �μ�Ʈ
-- ��� �μ�Ʈ
INSERT INTO COMFIT_USER(U_ID) VALUES(CONCAT('test', COMFIT_USER_SEQ.NEXTVAL))
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO USER_INFORMATION (U_EMAIL, U_NAME, U_ADDRESS, U_PASSWORD, U_TEL, U_NICKNAME, U_ID)
VALUES('hjui781@naver.com', '��μ�', '��õ ��籸 ������ 112���� 12 405�� 1703ȣ'
, CRYPTPACK.ENCRYPT('1234','1234'), '010-1111-1111', '���23', ???)
;

INSERT INTO USER_EMAIL_AUTH(E_AUTH_ID, AUTH_CODE, U_ID, AU_CATE_ID )
VALUES(CONCAT('auth_', USER_EMAIL_AUTH_SEQ.NEXTVAL), '2inR6denlG',???, 1)
;




COMMIT;



SELECT *
FROM USER_EMAIL_AUTH;



-- ���� �ֱ� U_ID ��ȸ ����
SELECT U_ID
FROM (
    SELECT U_ID 
    FROM COMFIT_USER
    ORDER BY CDATE DESC
)
WHERE ROWNUM =1;


alter session set nls_date_format='YYYY/MM/DD HH24:MI:SS';

COMMIT;

-- �̸��� ���� �Ϸ� ����
UPDATE USER_EMAIL_AUTH
SET AUTH_USE_DATE = SYSDATE 
WHERE AUTH_CODE = '2inR6denlG'
;

-- �̸��� ���� ��� ���� Ȯ��
SELECT nvl(to_char(AUTH_USE_DATE, 'yyyy-mm-dd'), 'x') as use     
FROM USER_EMAIL_AUTH
WHERE AUTH_CODE = 'RK3MNcjQ7A'
;

