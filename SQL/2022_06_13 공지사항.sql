SELECT USER
FROM DUAL;
--==>>COMFIT

DESC FAQ;

--�� �������� ��� 
SELECT ANNOUNCE_ID,ANNOUNCE_TITLE,ANNOUNCE_CONTENTS,ANOUN_CATE_ID
FROM ANNOUNCE
WHERE ANNOUNCE_ID='ann_1';



--�� �������� ����Ʈ ���
SELECT ANOUN_CATE_ID,ANOUN_CATE_NAME
FROM ANNOUNCE_CATEGORY;
/*
1	����/������Ʈ
2	�̺�Ʈ
3	����
*/

CREATE SEQUENCE ANNOUNCE_SEQ
NOCACHE;
--==>Sequence ANNOUNCE_SEQ��(��) �����Ǿ����ϴ�.

--==>>Sequence ANOUN_SEQ��(��) �����Ǿ����ϴ�.

--�۰������� �Է� ������
INSERT INTO ANNOUNCE (ANNOUNCE_ID,ANNOUNCE_TITLE,ANNOUNCE_CONTENTS,ANOUN_CATE_ID)
VALUES(ANNOUNCE_SEQ,'��������','��� ����� ���߰ڽ��ϴ�.',3);
--==>>1 �� ��(��) ���ԵǾ����ϴ�.

--�۰������� ���� ������
UPDATE ANNOUNCE
SET ANNOUNCE_TITLE ='����'
    ,ANNOUNCE_CONTENTS = '��밡���մϴ�.'
    ,ANOUN_CATE_ID=3
WHERE ANNOUNCE_ID='ann 2';
--==>>1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

--�۰������� ���� ������
DELETE
FROM ANNOUNCE
WHERE ANNOUNCE_ID='ann 1';
--==>>1 �� ��(��) �����Ǿ����ϴ�.

--�۷ѹ�
ROLLBACK;
--==>>�ѹ� �Ϸ�.