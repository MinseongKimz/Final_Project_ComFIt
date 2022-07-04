create user comfit IDENTIFIED by comfit006$;
--==>> User COMFIT이(가) 생성되었습니다.


-- 강의실에서 할 필요 있음 (테이블 스페이스 생성)
CREATE TABLESPACE TBS_COMFIT
DATAFILE 'C:\COMFIT\TBS_COMFIT.DBF'
SIZE 100M 
EXTENT MANAGEMENT LOCAL
SEGMENT SPACE MANAGEMENT AUTO;



GRANT CREATE SESSION TO comfit; -- 세션
--==>> Grant을(를) 성공했습니다.
GRANT CREATE TABLE TO comfit; -- 테이블
--==>> Grant을(를) 성공했습니다.
GRANT CREATE PROCEDURE TO comfit; -- 프로시저
--==>> Grant을(를) 성공했습니다.
GRANT CREATE VIEW TO comfit; -- 뷰
--==>> Grant을(를) 성공했습니다.
GRANT CREATE SEQUENCE TO comfit; -- 시퀀스
--==>> Grant을(를) 성공했습니다.


-- 강의실에서 할 필요 (테이블 스페이스 용량 제한 X)
ALTER USER comfit
QUOTA UNLIMITED ON TBS_COMFIT;















