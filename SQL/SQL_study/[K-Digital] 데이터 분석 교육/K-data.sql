SELECT emp_name, salary, bonus_pct,
       (salary+(salary*bonus_pct))*12 as "총소득",
       'aa' as "근무여부"
    FROM employee;
    
SELECT emp_name as "이름",
       dept_id as "부서",
       salary as "급여"
    FROM employee
    WHERE dept_id = '90'
        AND salary > 2000000;
        
SELECT emp_name as "이름",
       dept_id as "부서",
       salary as "급여"
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

문자열 내에서 특정 문자의 위치를 찾는 함수

    position :  몇번째 글자부터 검색할 것인지 지정 (3 이면 3번째 글자부터 검색)
                '-' 가 붙으면 뒤에서부터 검색 (-2 이면 뒤에서 2번째 글자부터 검색)
                공백이면 첫번째 글자부터...

    occurrence :    몇번째 발생지점인지 지정 (3이면 3번째로 검색되는 지점으로 출력)
                    공백이면 첫번째 발생 지점

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
       substr(hire_date,1,2) || '년 ' ||
       substr(hire_date,4,2) || '월 ' ||
       substr(hire_date,7,2) || '일'
    FROM employee;

SELECT ROUND(-125.315,2)
    FROM DUAL;


SELECT MONTHS_BETWEEN(SYSDATE,hire_date)
    FROM employee;


-- 사원테이블에서 근속년수가 20년 이상인 사원의 정보를 조회한다면?  

SELECT emp_name,
       SYSDATE,
       hire_date,
       ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)/12,1) AS 근속년수
    FROM employee
    WHERE MONTHS_BETWEEN(SYSDATE, hire_date) > 240
    ORDER BY 근속년수 desc;


--- 

SELECT emp_name,
       hire_date,
       TO_CHAR(hire_date, 'YYYY-MM-DD') AS A,
       TO_CHAR(hire_date, 'YYYY"년" MM"월" DD"일"') AS B,
       TO_CHAR(hire_date, 'HH:MM:SS') AS C
    FROM employee;


SELECT emp_name AS 이름,
       hire_date AS 기본입사일,
       TO_CHAR(hire_date, 'YYYY/MM/DD HH24:MI:SS') AS 상세입사일
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
        DECODE(SUBSTR(emp_no, 8, 1), '1', '남', '여') AS 성별
    FROM employee;


SELECT emp_id, emp_name, job_id, salary,
        DECODE(job_id, 'J1', salary *1.1, 'J2', salary *1.2,salary) AS 급여인상반영결과
FROM employee;


SELECT emp_id, emp_name, job_id, salary,
        CASE WHEN job_id = 'J1' THEN salary *1.1
             WHEN job_id = 'J2' THEN salary *1.2
             ELSE salary END AS 급여인상반영결과
FROM employee;

-- 사원테이블에서 급여정보를 가지고 급여등급을 조회하려고 한다.
-- 급여가 3000000 이하면 C, 4000000 이하면 B, 

SELECT emp_id, emp_name, salary,
        CASE WHEN salary <= 3000000 THEN 'C'
             WHEN salary <= 4000000 THEN 'B'
             ELSE 'A' END AS 급여등급
FROM employee;

SELECT emp_id, emp_name, salary,
        CASE WHEN salary <= 4000000 THEN 'B'
             WHEN salary <= 3000000 THEN 'C'
             ELSE 'A' END AS 급여등급
FROM employee;


SELECT  EMP_NAME , 
        EMAIL , 
        SUBSTR(EMAIL , 1 , INSTR(EMAIL , '@')-1) , 
        RTRIM(EMAIL , '@vcc.com')
FROM    EMPLOYEE ;


-- 성별에 따른 급여평균

SELECT  CASE WHEN SUBSTR(emp_no, 8, 1) = '1' THEN '남'
            ELSE '여' END 성별,
        ROUND(AVG(salary),2) 평균급여
    FROM employee
    GROUP BY SUBSTR(emp_no, 8, 1);

SELECT  DECODE(SUBSTR(emp_no, 8, 1), '1', '남', '여') 성별,
        ROUND(AVG(salary),2) 평균급여
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



-- 부서별 급여 순위를 조회하고 싶다면?

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



