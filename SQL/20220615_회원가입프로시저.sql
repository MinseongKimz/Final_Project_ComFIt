-- 회원가입 프로시저

CREATE OR REPLACE PROCEDURE REGIT_PRC
( V_U_EMAIL     IN USER_INFORMATION.U_EMAIL%TYPE
, V_U_NAME      IN USER_INFORMATION.U_NAME%TYPE
, V_U_ADDRESS   IN USER_INFORMATION.U_ADDRESS%TYPE
, V_U_PASSWORD  IN USER_INFORMATION.U_PASSWORD%TYPE
, V_U_TEL       IN USER_INFORMATION.U_TEL%TYPE
, V_U_NICKNAME  IN USER_INFORMATION.U_NICKNAME%TYPE
, V_AUTH_CODE   IN USER_EMAIL_AUTH.AUTH_CODE%TYPE
)
IS
    V_U_ID   COMFIT_USER.U_ID%TYPE;
    USER_DEFINE_ERROR  EXCEPTION;
    
BEGIN
    SELECT CONCAT('test', COMFIT_USER_SEQ.NEXTVAL) INTO V_U_ID
    FROM DUAL;

    INSERT INTO COMFIT_USER(U_ID) VALUES(V_U_ID);
    
    INSERT INTO USER_INFORMATION (U_EMAIL, U_NAME, U_ADDRESS, U_PASSWORD, U_TEL, U_NICKNAME, U_ID)
    VALUES(V_U_EMAIL, V_U_NAME, V_U_ADDRESS, CRYPTPACK.ENCRYPT(V_U_PASSWORD,V_U_PASSWORD)
    , V_U_TEL , V_U_NICKNAME, V_U_ID);
    
    INSERT INTO USER_EMAIL_AUTH(E_AUTH_ID, AUTH_CODE, U_ID, AU_CATE_ID )
    VALUES(CONCAT('auth_', USER_EMAIL_AUTH_SEQ.NEXTVAL), V_AUTH_CODE ,V_U_ID, 1);
    
    COMMIT;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003, '인서트오류 발생');
            ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;

END;


---            이메일, 이름, 주소, 비번, 전화, 닉네임, 난수코드, 
EXEC REGIT_PRC('test', '김민성', '인천계양구새벌로', '1234','010-1111-1111' ,'김깐득','qwer1234');




# 두 좌표사의 거리를 반환하는 tibero(oracle) 함수 
# 삼각함수를 이용하여 반환 
# 반환단위는 km(킬로미터)

CREATE OR REPLACE FUNCTION RADIANS(V_DEGREES IN NUMBER)
RETURN NUMBER DETERMINISTIC
IS 
BEGIN
  /*
  -- radians = degrees / (180 / pi)
  -- RETURN nDegrees / (180 / ACOS(-1)); but 180/pi is a constant, so...
  */
    RETURN V_DEGREES / 57.29577951308232087679815481410517033235;
END; 

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

SELECT DISTANCE_WGS84(37.552128,126.9202944, 37.5259854,126.7176898)
FROM DUAL;

COMMIT;

