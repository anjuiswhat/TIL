
-- [Basic SELECT] ���� ///////////////////////////////////////////////////////--

-- 1. �� ������б��� �а� �̸��� �迭�� ǥ���Ͻÿ�. ��, ��� ����� "�а� ��", "�迭" ���� ǥ���ϵ��� �Ѵ�.

SELECT department_name AS "�а� ��", category AS "�迭" 
    FROM tb_department;


-- 2. �а��� �а� ������ ������ ���� ���·� ȭ�鿡 ����Ѵ�.
--   �а��� ����
--  ----------------------------------------------
--   ������а��� ������ 20�� �Դϴ�.

SELECT department_name || '�� ������ ' || capacity || ' �Դϴ�.' AS "�а��� ����"
    FROM tb_department;


-- 3. "������а�" �� �ٴϴ� ���л� �� ���� �������� ���л��� ã�ƴ޶�� ��û�� ���Դ�.
--     �����ΰ�? (�����а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ� ã�� ������ ����)

SELECT student_name, department_no, absence_yn
    FROM tb_student
    WHERE absence_yn = 'Y'
        AND student_ssn LIKE '_______2%'
        AND department_no = (SELECT department_no
                                FROM tb_department
                                WHERE department_name = '������а�');

SELECT student_name, department_no, absence_yn
    FROM tb_student
    WHERE absence_yn = 'Y'
        AND SUBSTR(student_ssn, 8, 1) = 2
        AND department_no = (SELECT department_no
                                FROM tb_department
                                WHERE department_name = '������а�');

                                
-- 4. ���������� ���� ���� ��� ��ü�ڵ��� ã�� �̸��� �Խ��ϰ��� �Ѵ�.
--    �� ����ڵ��� �й��� ������ ���� �� ����ڵ��� ã�� ������ SQL ������ �ۼ��Ͻÿ�.
--    A513079, A513090, A513091, A513110, A513119

SELECT student_name, student_no
    FROM tb_student
    WHERE student_no IN ('A513079', 'A513090', 'A513091', 'A513110', 'A513119');


-- 5. ���������� 20�� �̻� 30�� ������ �а����� �а� �̸��� �迭�� ����Ͻÿ�.

SELECT department_name, category, capacity
    FROM tb_department
    WHERE capacity BETWEEN 20 AND 30;


-- 6. �� ������б��� ������ �����ϰ� ��� �������� �Ҽ� �а��� ������ �ִ�.
--    �� ������б� ������ �̸��� �˾Ƴ� �� �ִ� SQL ������ �ۼ��Ͻÿ�.

SELECT professor_name, department_no
    FROM tb_professor
    WHERE department_no IS NULL;


-- 7. Ȥ�� ������� ������ �а��� �����Ǿ� ���� ���� �л��� �ִ��� Ȯ���ϰ��� �Ѵ�.
--    ��� SQL ������ ����ϸ� �� ������ �ۼ��Ͻÿ�.

SELECT student_no, student_name, department_no 
    FROM tb_student
    WHERE department_no IS NULL;


-- 8. ������û�� �Ϸ��� �Ѵ�. �������� ���θ� Ȯ���ؾ� �ϴµ�,
--    ���������� �����ϴ� ������� � �������� �����ȣ�� ��ȸ�غ��ÿ�.

SELECT class_no, class_name, preattending_class_no AS "���������ڵ�"
    FROM tb_class
    WHERE preattending_class_no IS NOT NULL;

SELECT A.class_no, A.class_name, B.class_no AS "���������ڵ�", B.class_name AS "���������"
    FROM tb_class A, tb_class B
    WHERE A.preattending_class_no = B.class_no;

SELECT class_no, class_name, preattending_class_no AS "���������ڵ�"
    FROM tb_class
    WHERE level != 1
    START WITH preattending_class_no IS NULL
        CONNECT BY PRIOR class_no = preattending_class_no;


-- 9. �� ���п��� � �迭(CATEGORY)���� �ִ��� ��ȸ�غ��ÿ�.

SELECT DISTINCT category 
    FROM tb_department;

    
-- 10. 02�й� ���� �����ڵ��� ������ ������� �Ѵ�.
--     ������ ������� ������ �������� �л����� �й�, �̸�, �ֹι�ȣ�� ����ϴ� ������ �ۼ��Ͻÿ�.

SELECT student_no, student_name, student_ssn, student_address
    FROM tb_student
    WHERE absence_yn NOT IN 'Y'
        AND student_address LIKE '����%'
        AND entrance_date BETWEEN '2002/01/01' AND '2002/12/31';

