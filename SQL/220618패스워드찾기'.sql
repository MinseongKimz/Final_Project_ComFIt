SELECT COUNT(*)
FROM USER_INFORMATION
WHERE U_EMAIL = 'kkk@naver.com'
AND U_TEL = '010-2222-3333'
AND U_NAME = '��μ�'
;
--==>1 .. ��Ȯ�� ��
---> 0 .. Ʋ�� ��

-- ���� ����

SELECT COUNT(*) FROM USER_INFORMATION WHERE U_EMAIL = 'kkk@naver.com' AND U_TEL = '010-2222-3333' AND U_NAME = '��μ�'