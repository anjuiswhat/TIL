
-- [Additional SELECT - Option] ���� /////////////////////////////////////////--

-- 1. �л��̸��� �ּ����� ǥ���Ͻÿ�.
-- ��, ��� ����� "�л� �̸�", "�ּ���"�� �ϰ�, ������ �̸����� �������� ǥ���ϵ��� �Ѵ�.

SELECT  student_name "�л� �̸�",
        student_address �ּ���
    FROM tb_student
    ORDER BY student_name;


-- 2. �������� �л����� �̸��� �ֹι�ȣ�� ���̰� ���� ������ ȭ�鿡 ����Ͻÿ�.

SELECT  student_name,
        student_ssn
    FROM tb_student
    WHERE absence_yn = 'Y'
    ORDER BY student_ssn DESC;


-- 3. �ּ����� �������� ��⵵�� �л��� ��
-- 1900��� �й��� ���� �л����� �̸��� �й�, �ּҸ� �̸��� ������������ ȭ�鿡 ����Ͻÿ�.
-- ��, ���������� "�л��̸�","�й�", "������ �ּ�" �� ��µǵ��� �Ѵ�.

SELECT  student_name �л��̸�,
        student_no �й�,
        student_address "������ �ּ�"
    FROM tb_student
    WHERE SUBSTR(student_address, 1, 3) IN ('��⵵', '������')
            AND SUBSTR(student_no, 1, 1) = '9'
    ORDER BY student_name;
    

--  4. ���� ���а� ���� �� ���� ���̰� ���� ������� �̸��� Ȯ���� �� �ִ� SQL ������ �ۼ��Ͻÿ�.
-- (���а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ� ã�� ������ ����)

SELECT  professor_name,
        professor_ssn
    FROM tb_professor
    WHERE department_no = (SELECT department_no
                                FROM tb_department
                                WHERE department_name = '���а�')
    ORDER BY professor_ssn;
    

--  5. 2004�� 2�б⿡ 'C3118100' ������ ������ �л����� ������ ��ȸ�Ϸ��� �Ѵ�.
-- ������ ���� �л����� ǥ���ϰ�, ������ ������ �й��� ���� �л����� ǥ���ϴ� ������ �ۼ��غ��ÿ�.

SELECT  student_no,
        point
    FROM tb_grade
    WHERE term_no = '200402'
            AND class_no = 'C3118100'
    ORDER BY point DESC, student_no;


-- 6. �л� ��ȣ, �л� �̸�, �а� �̸��� �л� �̸����� �������� �����Ͽ� ����ϴ� SQL ���� �ۼ��Ͻÿ�.

SELECT  student_no,
        student_name,
        department_name,
        a.department_no     -- �����÷��� ���� a. �Ǵ� b. ��Ī�� ���
                            -- ON ���� ������� �ϸ� department_no �÷���
                            -- a.tb_student�� �÷�, b.tb_department �÷� ���� �ϳ��� �� 2���� �����!! (department_no �÷��� department_no_1 �÷� )
    FROM tb_student A JOIN tb_department B
        ON a.department_no = b.department_no
    ORDER BY student_name;


SELECT  student_no,
        student_name,
        department_name,
        department_no       --  SELECT ������ �����÷��� ���� a. �Ǵ� b. ��Ī ����� �Ұ����ϴ�!!!
                            -- ( department_no �� ���ؼ� USING ���� ������ �ϸ� department_no �÷��� �� ���� �ƴ�, �ϳ��� �����÷����� �����ȴ�.
                            -- �� �÷��� tb_student �Ǵ� tb_department �� ���� �ִ� ���� �ƴϹǷ� ��Ī�� ������ �� ����.
    FROM tb_student A JOIN tb_department B
        USING(department_no)
    ORDER BY student_name;


-- 7. �� ������б��� ���� �̸��� ������ �а� �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�.

SELECT  class_name,
        department_name
    FROM tb_class JOIN tb_department
        USING(department_no);


-- 8. ���� ���� �̸��� ã������ �Ѵ�. ���� �̸��� ���� �̸��� ����ϴ� SQL ���� �ۼ��Ͻÿ�.

SELECT  class_name,
        professor_name
    FROM tb_class JOIN tb_professor
            USING(department_no)
    ORDER BY class_name;


-- 9.  8���� ��� �� ���ι���ȸ�� �迭�� ���� ������ ���� �̸��� ã������ �Ѵ�.
-- �̿� �ش��ϴ� ���� �̸��� ���� �̸��� ����ϴ� SQL ���� �ۼ��Ͻÿ�.

SELECT  class_name,
        professor_name
    FROM tb_department
            JOIN tb_class USING(department_no)
            JOIN tb_professor USING(department_no)
    WHERE tb_department.category = '�ι���ȸ'
    ORDER BY class_name;

SELECT  class_name,
        professor_name
    FROM tb_department A
            JOIN tb_class B ON b.department_no = a.department_no
            JOIN tb_professor C ON c.department_no = b.department_no
    WHERE a.category= '�ι���ȸ'
    ORDER BY class_name;

SELECT  class_name,
        professor_name
    FROM tb_department A, tb_class B, tb_professor C
    WHERE a.department_no = b.department_no
            AND b.department_no = c.department_no
            AND a.category= '�ι���ȸ'
    ORDER BY c.department_no, c.professor_no, b.class_name;

-- 10. �������а��� �л����� ������ ���Ϸ��� �Ѵ�.
-- �����а� �л����� "�й�", "�л� �̸�", "��ü ����"�� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
-- (��, ������ �Ҽ��� 1�ڸ������� �ݿø��Ͽ� ǥ���Ѵ�.)



-- 11. �й��� A313047�� �л��� �б��� ������ ���� �ʴ�.
-- ���� �������� ������ �����ϱ� ���� �а� �̸�, �л� �̸��� ���� ���� �̸��� �ʿ��ϴ�.
-- �̶� ����� SQL ���� �ۼ��Ͻÿ�. ��, �������� ?�а��̸�?, ?�л��̸�?, ?���������̸�?���� ��µǵ��� �Ѵ�.



-- 12. 2007�⵵�� '�ΰ������' ������ ������ �л��� ã�� �л��̸��� �����б⸦ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.



-- 13. ��ü�� �迭 ���� �� ���� ��米���� �� �� �������� ���� ������ ã��
-- �� ���� �̸��� �а� �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�.

SELECT a.class_name, c.department_name
    FROM tb_class A
        LEFT OUTER JOIN tb_class_professor B ON a.class_no = b.class_no
        JOIN tb_department C ON c.department_no = a.department_no
    WHERE b.professor_no IS NULL
        AND c.category = '��ü��'
    ORDER BY c.department_no, a.class_type DESC, a.class_name;


-- 14. �� ������б� ���ݾƾ��а� �л����� ���������� �Խ��ϰ��� �Ѵ�.
-- �л��̸��� �������� �̸��� ã��
-- ���� ���� ������ ���� �л��� ��� "�������� ������"���� ǥ���ϵ��� �ϴ� SQL ���� �ۼ��Ͻÿ�.
-- ��, �������� "�л��̸�", "��������"�� ǥ���ϸ� ���й� �л��� ���� ǥ�õǵ��� �Ѵ�.

SELECT  a.student_name �л��̸�,
        DECODE(b.professor_name, NULL, '�������� ������', b.professor_name) ��������
    FROM tb_student A
            FULL OUTER JOIN tb_professor B ON a.coach_professor_no = b.professor_no
            JOIN tb_department C ON c.department_no = a.department_no
    WHERE department_name = '���ݾƾ��а�'
    ORDER BY a.student_no;


-- 15. ���л��� �ƴ� �л� �� ������ 4.0 �̻��� �л��� ã��
-- �� �л��� �й�, �̸�, �а� �̸�, ������ ����ϴ� SQL ���� �ۼ��Ͻÿ�.

SELECT  student_no �й�, student_name �̸�,
        department_name "�а� �̸�",
        TRUNC(AVG(point),8) ����
    FROM tb_student JOIN tb_grade USING(student_no)
                    JOIN tb_department USING(department_no)
    WHERE absence_yn = 'N'
    GROUP BY student_no, student_name, department_name
    HAVING AVG(point) >= 4.0
    ORDER BY student_no;
    

-- 16. ȯ�������а� ����������� ���� �� ������ �ľ��� �� �ִ� SQL ���� �ۼ��Ͻÿ�.

SELECT class_no, class_name, TRUNC(AVG(point), 8)
    FROM tb_class JOIN tb_grade USING(class_no)
                  JOIN tb_department USING(department_no)
    WHERE department_name = 'ȯ�������а�'
        AND SUBSTR(class_type,1,2) = '����'
    GROUP BY class_no, class_name
    ORDER BY class_no;


-- 17. �� ������б��� �ٴϰ� �ִ� �ְ��� �л��� ���� �� �л����� �̸��� �ּҸ� ����ϴ� SQL ���� �ۼ��Ͻÿ�.

SELECT student_name, student_address
    FROM tb_student
    WHERE department_no = (SELECT department_no
                                FROM tb_student
                                WHERE student_name = '�ְ���');    


-- 18. ������а����� �� ������ ���� ���� �л��� �̸��� �й��� ǥ���ϴ� SQL���� �ۼ��Ͻÿ�.

SELECT student_no, student_name
    FROM   (SELECT student_no, student_name,
                   RANK() OVER( ORDER BY AVG(point) DESC) RANK
                FROM tb_student JOIN tb_grade USING(student_no)
                                JOIN tb_department USING(department_no)
            WHERE department_name = '������а�'
            GROUP BY student_no, student_name)
    WHERE RANK = 1;


-- 19. �� ������б��� "ȯ�������а�"�� ���� ���� �迭 �а�����
-- �а� �� �������� ������ �ľ��ϱ� ���� ������ SQL ���� ã�Ƴ��ÿ�.
-- ��, �������� "�迭 �а���", "��������"���� ǥ�õǵ��� �ϰ�,
-- ������ �Ҽ��� �� �ڸ������� �ݿø��Ͽ� ǥ�õǵ��� �Ѵ�.

SELECT  department_name "�迭 �а���",
        ROUND(AVG(point), 1)
    FROM tb_department
        JOIN tb_student USING(department_no)
        JOIN tb_grade USING(student_no)
        JOIN tb_class USING(class_no)
    WHERE SUBSTR(class_type,1,2) = '����'
        AND category = (SELECT category
                                FROM tb_department
                                WHERE department_name = 'ȯ�������а�')
    GROUP BY department_name
    ORDER BY department_name;
