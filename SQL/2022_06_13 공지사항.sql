SELECT USER
FROM DUAL;
--==>>COMFIT



--○ 공지사항 출력 
SELECT ANNOUNCE_ID,ANNOUNCE_TITLE,ANNOUNCE_CONTENTS,ANOUN_CATE_ID
FROM ANNOUNCE
WHERE ANNOUNCE_ID='ann_2';



--○ 공지사항 리스트 출력
SELECT ANOUN_CATE_ID,ANOUN_CATE_NAME
FROM ANNOUNCE_CATEGORY;
/*
1	점검/업데이트
2	이벤트
3	공지
*/



--==>>Sequence ANOUN_SEQ이(가) 생성되었습니다.

--○공지사항 입력 쿼리문
INSERT INTO ANNOUNCE (ANNOUNCE_ID,ANNOUNCE_TITLE,ANNOUNCE_CONTENTS,ANOUN_CATE_ID)
VALUES(CONCAT('ann')ANNOUNCE_SEQ),'공지사항','잠시 사용을 멈추겠습니다.',3);
--==>>1 행 이(가) 삽입되었습니다.

--○공지사항 수정 쿼리문
UPDATE ANNOUNCE
SET ANNOUNCE_TITLE ='공지'
    ,ANNOUNCE_CONTENTS = '사용가능합니다.'
    ,ANOUN_CATE_ID= '2'
WHERE ANNOUNCE_ID='ann_2';
--==>>1 행 이(가) 업데이트되었습니다.




--○공지사항 삭제 쿼리문
DELETE
FROM ANNOUNCE
WHERE ANNOUNCE_ID='ann 1';
--==>>1 행 이(가) 삭제되었습니다.

--○롤백
ROLLBACK;
--==>>롤백 완료.