SELECT USER
FROM DUAL;
--==>>COMFIT



--�� �������� ��� 
SELECT ANNOUNCE_ID,ANNOUNCE_TITLE,ANNOUNCE_CONTENTS,ANOUN_CATE_ID
FROM ANNOUNCE
WHERE ANNOUNCE_ID='ann_2';



--�� �������� ����Ʈ ���
SELECT ANOUN_CATE_ID,ANOUN_CATE_NAME
FROM ANNOUNCE_CATEGORY;
/*
1	����/������Ʈ
2	�̺�Ʈ
3	����
*/



--==>>Sequence ANOUN_SEQ��(��) �����Ǿ����ϴ�.

--�۰������� �Է� ������
INSERT INTO ANNOUNCE (ANNOUNCE_ID,ANNOUNCE_TITLE,ANNOUNCE_CONTENTS,ANOUN_CATE_ID)
VALUES(CONCAT('ann')ANNOUNCE_SEQ),'��������','��� ����� ���߰ڽ��ϴ�.',3);
--==>>1 �� ��(��) ���ԵǾ����ϴ�.

--�۰������� ���� ������
UPDATE ANNOUNCE
SET ANNOUNCE_TITLE ='����'
    ,ANNOUNCE_CONTENTS = '��밡���մϴ�.'
    ,ANOUN_CATE_ID= '2'
WHERE ANNOUNCE_ID='ann_2';
--==>>1 �� ��(��) ������Ʈ�Ǿ����ϴ�.




--�۰������� ���� ������
DELETE
FROM ANNOUNCE
WHERE ANNOUNCE_ID='ann 1';
--==>>1 �� ��(��) �����Ǿ����ϴ�.

--�۷ѹ�
ROLLBACK;
--==>>�ѹ� �Ϸ�.