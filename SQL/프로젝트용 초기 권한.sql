create user comfit IDENTIFIED by comfit006$;
--==>> User COMFIT��(��) �����Ǿ����ϴ�.


-- ���ǽǿ��� �� �ʿ� ���� (���̺� �����̽� ����)
CREATE TABLESPACE TBS_COMFIT
DATAFILE 'C:\COMFIT\TBS_COMFIT.DBF'
SIZE 100M 
EXTENT MANAGEMENT LOCAL
SEGMENT SPACE MANAGEMENT AUTO;



GRANT CREATE SESSION TO comfit; -- ����
--==>> Grant��(��) �����߽��ϴ�.
GRANT CREATE TABLE TO comfit; -- ���̺�
--==>> Grant��(��) �����߽��ϴ�.
GRANT CREATE PROCEDURE TO comfit; -- ���ν���
--==>> Grant��(��) �����߽��ϴ�.
GRANT CREATE VIEW TO comfit; -- ��
--==>> Grant��(��) �����߽��ϴ�.
GRANT CREATE SEQUENCE TO comfit; -- ������
--==>> Grant��(��) �����߽��ϴ�.


-- ���ǽǿ��� �� �ʿ� (���̺� �����̽� �뷮 ���� X)
ALTER USER comfit
QUOTA UNLIMITED ON TBS_COMFIT;















