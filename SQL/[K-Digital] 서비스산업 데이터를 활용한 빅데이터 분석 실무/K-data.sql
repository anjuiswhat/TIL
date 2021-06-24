SELECT emp_name, salary, bonus_pct,
       (salary+(salary*bonus_pct))*12 as "�Ѽҵ�",
       'aa' as "�ٹ�����"
    FROM employee;
    
SELECT emp_name as "�̸�",
       dept_id as "�μ�",
       salary as "�޿�"
    FROM employee
    WHERE dept_id = '90'
        AND salary > 2000000;
        
SELECT emp_name as "�̸�",
       dept_id as "�μ�",
       salary as "�޿�"
    FROM employee
    WHERE dept_id = '90'
        OR dept_id = '20';
        
select emp_name || "a" || dept_id
FROM employee;

SELECT emp_name, salary
    FROM employee
    WHERE salary BETWEEN 3500000 AND 5500000;
    
SELECT emp_name, salary, phone
    FROM employee
    WHERE phone LIKE '__9%';
    
SELECT emp_name, email, salary
    FROM employee
    WHERE email LIKE '__#_%' ESCAPE '#'; 
    
SELECT *
    FROM employee
    WHERE dept_id IS NULL
        AND mgr_id IS NULL;



SELECT *
    FROM column_length;


SELECT CHARTYPE, LENGTH(CHARTYPE),
       VARCHARTYPE, LENGTH(VARCHARTYPE)
    FROM column_length;

/*

    INSTR (string , substring [, position [, occurrence]])

���ڿ� ������ Ư�� ������ ��ġ�� ã�� �Լ�

    position :  ���° ���ں��� �˻��� ������ ���� (3 �̸� 3��° ���ں��� �˻�)
                '-' �� ������ �ڿ������� �˻� (-2 �̸� �ڿ��� 2��° ���ں��� �˻�)
                �����̸� ù��° ���ں���...

    occurrence :    ���° �߻��������� ���� (3�̸� 3��°�� �˻��Ǵ� �������� ���)
                    �����̸� ù��° �߻� ����

*/

    
SELECT email, INSTR(email, 'c', -1, 2)
    FROM employee;
    
SELECT email, INSTR(email, 'c', INSTR(email, '.')-1)
    FROM employee;

SELECT email, INSTR(email, '.')
    FROM employee;
    
select INSTR('HelloWorld', 'l')
    from dual;



SELECT emp_name,
       substr(hire_date,1,2) || '�� ' ||
       substr(hire_date,4,2) || '�� ' ||
       substr(hire_date,7,2) || '��'
    FROM employee;

SELECT ROUND(-125.315,2)
    FROM DUAL;


SELECT MONTHS_BETWEEN(SYSDATE,hire_date)
    FROM employee;


-- ������̺��� �ټӳ���� 20�� �̻��� ����� ������ ��ȸ�Ѵٸ�?  

SELECT emp_name,
       SYSDATE,
       hire_date,
       ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)/12,1) AS �ټӳ��
    FROM employee
    WHERE MONTHS_BETWEEN(SYSDATE, hire_date) > 240
    ORDER BY �ټӳ�� desc;


--- 

SELECT emp_name,
       hire_date,
       TO_CHAR(hire_date, 'YYYY-MM-DD') AS A,
       TO_CHAR(hire_date, 'YYYY"��" MM"��" DD"��"') AS B,
       TO_CHAR(hire_date, 'HH:MM:SS') AS C
    FROM employee;


SELECT emp_name AS �̸�,
       hire_date AS �⺻�Ի���,
       TO_CHAR(hire_date, 'YYYY/MM/DD HH24:MI:SS') AS ���Ի���
    FROM employee
    WHERE job_id IN ('J1', 'J2');


SELECT TO_DATE( '20100101', 'YYYYMMDD'),
       TO_CHAR( TO_DATE( '20100101', 'YYYYMMDD'), 'YYYY,MON')
FROM DUAL;


SELECT emp_no,
       SUBSTR(emp_no, 1, 6) + SUBSTR(emp_no, 8, 7) AS A,
       TO_NUMBER(SUBSTR(emp_no, 1, 6)) + TO_NUMBER(SUBSTR(emp_no, 8, 7)) AS B
    FROM employee;


SELECT emp_name,
        emp_no,
        DECODE(SUBSTR(emp_no, 8, 1), '1', '��', '��') AS ����
    FROM employee;


SELECT emp_id, emp_name, job_id, salary,
        DECODE(job_id, 'J1', salary *1.1, 'J2', salary *1.2,salary) AS �޿��λ�ݿ����
FROM employee;


SELECT emp_id, emp_name, job_id, salary,
        CASE WHEN job_id = 'J1' THEN salary *1.1
             WHEN job_id = 'J2' THEN salary *1.2
             ELSE salary END AS �޿��λ�ݿ����
FROM employee;

-- ������̺��� �޿������� ������ �޿������ ��ȸ�Ϸ��� �Ѵ�.
-- �޿��� 3000000 ���ϸ� C, 4000000 ���ϸ� B, 

SELECT emp_id, emp_name, salary,
        CASE WHEN salary <= 3000000 THEN 'C'
             WHEN salary <= 4000000 THEN 'B'
             ELSE 'A' END AS �޿����
FROM employee;

SELECT emp_id, emp_name, salary,
        CASE WHEN salary <= 4000000 THEN 'B'
             WHEN salary <= 3000000 THEN 'C'
             ELSE 'A' END AS �޿����
FROM employee;


SELECT  EMP_NAME , 
        EMAIL , 
        SUBSTR(EMAIL , 1 , INSTR(EMAIL , '@')-1) , 
        RTRIM(EMAIL , '@vcc.com')
FROM    EMPLOYEE ;


-- ������ ���� �޿����

SELECT  CASE WHEN SUBSTR(emp_no, 8, 1) = '1' THEN '��'
            ELSE '��' END ����,
        ROUND(AVG(salary),2) ��ձ޿�
    FROM employee
    GROUP BY SUBSTR(emp_no, 8, 1);

SELECT  DECODE(SUBSTR(emp_no, 8, 1), '1', '��', '��') ����,
        ROUND(AVG(salary),2) ��ձ޿�
    FROM employee
    GROUP BY SUBSTR(emp_no, 8, 1);

SELECT  dept_id,
        emp_name,
        count(*)
    FROM employee
    GROUP BY ROLLUP(dept_id, emp_name)
    ORDER BY 1;

SELECT COUNT(BONUS_PCT)
    FROM employee;



-- �μ��� �޿� ������ ��ȸ�ϰ� �ʹٸ�?

SELECT  dept_id,
        emp_name,
        salary,
        RANK() OVER(PARTITION BY dept_id ORDER BY salary) AS "Rank"
    FROM employee;

SELECT  dept_id,
        emp_name,
        salary,
        DENSE_RANK() OVER(PARTITION BY dept_id ORDER BY salary) AS "DENSE_Rank"
    FROM employee;


SELECT *
    FROM employee;

SELECT *
    FROM deparment;



SELECT  emp_name,
        dept_name,
        loc_describe,
        country_name
    FROM employee A
        JOIN department B USING(dept_id)
        JOIN location C ON(C.location_id = B.loc_id)
        JOIN country D USING(country_id);


SELECT  emp_name,
        dept_name,
        loc_describe,
        country_name
    FROM employee A
        JOIN department B USING(dept_id)
        JOIN location C ON C.location_id = B.loc_id
        JOIN country D USING(country_id)
        JOIN job E USING(job_id);



