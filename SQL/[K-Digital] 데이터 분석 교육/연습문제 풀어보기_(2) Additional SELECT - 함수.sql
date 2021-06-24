
-- [Additional SELECT - �Լ�] ���� ///////////////////////////////////////////--

-- 1. ������а�(�а��ڵ� 002) �л����� �й��� �̸�, ���� �⵵��
--    ���� �⵵�� ���� ������ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
--    ( ��, ����� "�й�", "�̸�", "���г⵵" �� ǥ�õǵ��� �Ѵ�.)

SELECT  student_no AS �й�,
        student_name AS �̸�,
        entrance_date AS ���г⵵
    FROM tb_student
    WHERE department_no = '002'
    ORDER BY entrance_date;


-- 2. �� ������б��� ���� �� �̸��� �� ���ڰ� �ƴ� ������ �� �� �ִٰ� �Ѵ�.
--    �� ������ �̸��� �ֹι�ȣ�� ȭ�鿡 ����ϴ� SQL ������ �ۼ��� ����.
--    (* �̶� �ùٸ��� �ۼ��� SQL ������ ��� ���� ����� �ٸ��� ���� �� �ִ�. ������ �������� �����غ� ��)

SELECT  professor_name,
        professor_ssn
    FROM tb_professor
    WHERE professor_name NOT LIKE '___';


-- 3. �� ������б��� ���� �������� �̸��� ���̸� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
-- �� �̶� ���̰� ���� ������� ���� ��� ������ ȭ�鿡 ��µǵ��� ����ÿ�.
-- (��, ���� �� 2000�� ���� ����ڴ� ������ ��� ����� "�����̸�", "����"�� �Ѵ�. ���̴� ���������� ����Ѵ�.)

SELECT  professor_name AS �����̸�,
        TO_CHAR(SYSDATE,'YYYY') - LPAD( SUBSTR(professor_ssn, 1, 2), 4, '19') AS ����
    FROM tb_professor
    WHERE SUBSTR(professor_ssn, 8, 1) = 1
        AND LPAD( SUBSTR(professor_ssn, 1, 2), 4, '19') < 2000
    ORDER BY 2, 1;


-- 4. �������� �̸� �� ���� ������ �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
-- ��� ����� "�̸�" �� �������� �Ѵ�. (���� 2���� ���� ������ ���ٰ� �����Ͻÿ�)

SELECT  SUBSTR(professor_name, 2) AS �̸�
    FROM tb_professor;


-- 5. �� ������б��� ����� �����ڸ� ���Ϸ��� �Ѵ�. ��� ã�Ƴ� ���ΰ�?
-- �̶�, 19�쿡 �����ϸ� ����� ���� ���� ������ �����Ѵ�.

SELECT  student_no,
        student_name
    FROM tb_student
    WHERE ( TO_CHAR(entrance_date,'YYYY') - LPAD( SUBSTR(student_ssn, 1, 2), 4, '19') ) > 19
    ORDER BY student_no DESC;


SELECT  student_no, student_name,
        LPAD( SUBSTR(student_ssn, 1, 2), 4, '19') ����⵵,
        TO_CHAR(entrance_date,'YYYY') AS ���г⵵,
        TO_CHAR(entrance_date,'YYYY') - LPAD( SUBSTR(student_ssn, 1, 2), 4, '19') AS ���г���
    FROM tb_student
    ORDER BY ���г���;


-- 6. 2020�� ũ���������� ���� �����ΰ�?

SELECT TO_CHAR( TO_DATE('20201225','YYYYMMDD'), 'DD MON DY, YYYY' )
    FROM DUAL;


-- 7. TO_DATE('99/10/11','YY/MM/DD'), TO_DATE('49/10/11','YY/MM/DD') �� ���� �� �� �� �� �� ���� �ǹ��ұ�?
-- �� TO_DATE('99/10/11','RR/MM/DD'), TO_DATE('49/10/11','RR/MM/DD') �� ���� �� �� �� �� �� ���� �ǹ��ұ�?

SELECT  TO_DATE('99/10/11','YY/MM/DD') A,
        TO_DATE('49/10/11','YY/MM/DD') B,
        TO_DATE('99/10/11','RR/MM/DD') C,
        TO_DATE('49/10/11','RR/MM/DD') D
    FROM DUAL;
    
    
-- �� TO_DATE('99/10/11','RR/MM/DD'), TO_DATE('49/10/11','RR/MM/DD')


-- 8. �� ������б��� 2000�⵵ ���� �����ڵ��� �й��� A�� �����ϰ� �Ǿ��ִ�.
-- 2000�⵵ ���� �й��� ���� �л����� �й��� �̸��� �����ִ� SQL ������ �ۼ��Ͻÿ�.

SELECT  student_no, student_name
    FROM tb_student
    WHERE entrance_date < '00/01/01';

SELECT  student_no, student_name
    FROM tb_student
    WHERE SUBSTR(student_no,1,1) NOT IN 'A';


-- 9. �й��� A517178 �� �ѾƸ� �л��� ���� �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�.
-- ��, �̶� ��� ȭ���� ����� "����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ� �Ҽ��� ���� �� �ڸ������� ǥ���Ѵ�.

SELECT ROUND( AVG(point), 1 ) AS ����
    FROM tb_grade
    WHERE student_no = 'A517178';


-- 10. �а��� �л����� ���Ͽ� "�а���ȣ", "�л���(��)" �� ���·� ����� ����� ������� ��µǵ��� �Ͻÿ�.

SELECT  department_no AS �а���ȣ,
        count(*) AS "�л���(��)"
    FROM tb_student
    GROUP BY department_no
    ORDER BY department_no;


-- 11. ���� ������ �������� ���� �л��� ���� �� �� ���� �Ǵ� �˾Ƴ��� SQL ���� �ۼ��Ͻÿ�.

SELECT COUNT(*)
    FROM tb_student
    WHERE coach_professor_no IS NULL;


-- 12. �й��� A112113�� ���� �л��� �⵵ �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�.
-- ��, �̶� ��� ȭ���� ����� "�⵵", "�⵵ �� ����" �̶�� ������ �ϰ�,
-- ������ �ݿø��Ͽ� �Ҽ��� ���� �� �ڸ������� ǥ���Ѵ�.

SELECT  SUBSTR(term_no, 1, 4) �⵵,
        ROUND( AVG(point), 1 ) "�⵵ �� ����"
    FROM tb_grade
    WHERE student_no ='A112113'
    GROUP BY SUBSTR(term_no, 1, 4)
    ORDER BY �⵵;
    

-- 13. �а� �� ���л� ���� �ľ��ϰ��� �Ѵ�.
-- �а� ��ȣ�� ���л� ���� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.

SELECT  department_no AS �а��ڵ��,
        COUNT( CASE WHEN absence_yn = 'Y' THEN 'x'
                    ELSE NULL END ) AS "���л� ��"
    FROM tb_student
    GROUP BY department_no
    ORDER BY department_no;


-- 14. �� ���б��� �ٴϴ� ��������(��٣���) �л����� �̸��� ã���� �Ѵ�.
-- � SQL ������ ����ϸ� �����ϰڴ°�?

SELECT  student_name �����̸�,
        COUNT(student_name) "������ ��"
    FROM tb_student
    GROUP BY student_name
        HAVING COUNT(student_name) > 1
    ORDER BY student_name;


-- 15. �й��� A112113 �� ���� �л���
-- �б� �� ����, �⵵ �� ����, �⵵ �� ���� ���� , �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�.
-- (��, ������ �Ҽ��� 1�ڸ������� �ݿø��Ͽ� ǥ���Ѵ�.)

SELECT  term_no �б�,
        SUBSTR(term_no, 1, 4) �⵵,
        ROUND( AVG(point), 1 ) ����
    FROM tb_grade
    WHERE student_no ='A112113'
    GROUP BY GROUPING SETS( SUBSTR(term_no, 1, 4), term_no, NULL  )
    ORDER BY �б�, �⵵;

SELECT  SUBSTR(term_no, 1, 4) �⵵,
        SUBSTR(term_no, 5, 2) �б�,
        ROUND( AVG(point), 1 ) ����
    FROM tb_grade
    WHERE student_no ='A112113'
    GROUP BY ROLLUP(SUBSTR(term_no, 1, 4), SUBSTR(term_no, 5, 2))
    ORDER BY �⵵, �б�;

