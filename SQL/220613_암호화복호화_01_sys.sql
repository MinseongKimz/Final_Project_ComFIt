SELECT USER
FROM DUAL;
--==>> SYS

--���� ��ȣȭ �� ��ȣȭ ����--

-- 1. ����Ŭ ��ȣȭ ����� ����ϱ� ���ؼ���
--    DBMS_OBFUSCATION_TOOLKIT ��Ű���� �̿��� �� �ִ�.
--    (���� ��Ű���� ������� �ʰ�, ��ȣȭ ��ȣȭ �˰����� ���� ������ ���� �ִ�.)

-- 2. DBMS_OBFUSCATION_TOOLKIT ��Ű����
--    �⺻��(default)���δ� ����� �� ���� ���·� �����Ǿ� �����Ƿ�
--    �߰������� �� ��Ű���� ��ġ�ϴ� ������ �ʿ��ϴ�.
--    �̸� ����... ��dbmsobtk.sql���� ��prvtobtk.plb�� ������ ã�� �����ؾ� �Ѵ�.

@C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\dbmsobtk.sql
/*
Library DBMS_OBFUSCATION_LIB��(��) �����ϵǾ����ϴ�.
Library CRYPTO_TOOLKIT_LIBRARY��(��) �����ϵǾ����ϴ�.
Package DBMS_CRYPTO��(��) �����ϵǾ����ϴ�.
SYNONYM DBMS_CRYPTO��(��) �����Ǿ����ϴ�.
Package DBMS_OBFUSCATION_TOOLKIT��(��) �����ϵǾ����ϴ�.
SYNONYM DBMS_OBFUSCATION_TOOLKIT��(��) �����Ǿ����ϴ�.
Grant��(��) �����߽��ϴ�.
Package DBMS_SQLHASH��(��) �����ϵǾ����ϴ�.
SYNONYM DBMS_SQLHASH��(��) �����Ǿ����ϴ�.
*/

@C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\prvtobtk.plb
/*
Package DBMS_CRYPTO_FFI��(��) �����ϵǾ����ϴ�.
Package Body DBMS_CRYPTO_FFI��(��) �����ϵǾ����ϴ�.
Package Body DBMS_CRYPTO��(��) �����ϵǾ����ϴ�.
Package DBMS_OBFUSCATION_TOOLKIT_FFI��(��) �����ϵǾ����ϴ�.
Package Body DBMS_OBFUSCATION_TOOLKIT_FFI��(��) �����ϵǾ����ϴ�.
Package Body DBMS_OBFUSCATION_TOOLKIT��(��) �����ϵǾ����ϴ�.
Package Body DBMS_SQLHASH��(��) �����ϵǾ����ϴ�.
*/

-- 3. �� ��Ű���� 4���� ���ν����� �̷���� �ִ�.
--    VARCHAR2 Ÿ���� Encrypt/Decrypt �� �� �ִ� 2���� ���ν���
--    RAW Ÿ���� Encrypt/Decrypt �� �� �ִ� 2���� ���ν���
--    (�ٸ� Ÿ���� �������� �ʱ� ������ NUMBER�� ��� TO_CHAR() �̿�)

-- �� RAW, LONG RAW, ROWID Ÿ��
--    �׷��� �̹����� ������ ���� ���� ����
--    HEXA-DECIMAL(16����)���·� ����
--    ���� RAW �� VARCHAR2�� �����ϴ�.
--    LONG RAW �� LONG �� ���������� ������ ���� ���ѻ����� �̚�.
--     ������� ���⸸ �����ϰ�, DATA�� ������ �� ����.
--     ��LONG RAW �� LONG �� ���� ���� ������ ���´�.

--�� �ش� ��Ű���� ����� �� �ֵ��� ���� �ο�
GRANT EXECUTE ON DBMS_OBFUSCATION_TOOLKIT TO COMFIT;
--==>> Grant��(��) �����߽��ϴ�.
--> COMFIT �������� DBMS_OBFUSCATION_TOOLKIT ��Ű����
--  ���ν����� ����� �� �ִ� ���� �ο�

GRANT EXECUTE ON DBMS_OBFUSCATION_TOOLKIT TO PUBLIC;
--==>> Grant��(��) �����߽��ϴ�.
--> PUBLIC���� DBMS_OBFUSCATION_TOOLKIT ��Ű����
--  ���ν����� ����� �� �ִ� ���� �ο�


















