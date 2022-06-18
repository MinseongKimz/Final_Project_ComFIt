SELECT COUNT(*)
FROM USER_INFORMATION
WHERE U_EMAIL = 'kkk@naver.com'
AND U_TEL = '010-2222-3333'
AND U_NAME = '±è¹Î¼º'
;
--==>1 .. Á¤È®ÇÑ °ª
---> 0 .. Æ²¸° °ª

-- ÇÑÁÙ ±¸¼º

SELECT COUNT(*) FROM USER_INFORMATION WHERE U_EMAIL = 'kkk@naver.com' AND U_TEL = '010-2222-3333' AND U_NAME = '±è¹Î¼º'