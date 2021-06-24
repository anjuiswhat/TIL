DROP TABLE BOUNS;
DROP TABLE EMP;
DROP TABLE DEPT;
DROP TABLE SALGRADE;

CREATE TABLE BONUS
        (ENAME VARCHAR2(10),
         JOB   VARCHAR2(9),
         SAL   NUMBER,
         COMM  NUMBER);

CREATE TABLE EMP
       (EMPNO NUMBER(4) NOT NULL,
        ENAME VARCHAR2(10),
        JOB VARCHAR2(9),
        MGR NUMBER(4),
        HIREDATE DATE,
        SAL NUMBER(7, 2),
        COMM NUMBER(7, 2),
        DEPTNO NUMBER(2));

INSERT INTO EMP VALUES
        (7369, 'SMITH',  'CLERK',     7902,
        TO_DATE('17-12-1980', 'DD-MM-YYYY'),  800, NULL, 20);
INSERT INTO EMP VALUES
        (7499, 'ALLEN',  'SALESMAN',  7698,
        TO_DATE('20-02-1981', 'DD-MM-YYYY'), 1600,  300, 30);
INSERT INTO EMP VALUES
        (7521, 'WARD',   'SALESMAN',  7698,
        TO_DATE('22-02-1981', 'DD-MM-YYYY'), 1250,  500, 30);
INSERT INTO EMP VALUES
        (7566, 'JONES',  'MANAGER',   7839,
        TO_DATE('2-04-1981', 'DD-MM-YYYY'),  2975, NULL, 20);
INSERT INTO EMP VALUES
        (7654, 'MARTIN', 'SALESMAN',  7698,
        TO_DATE('28-09-1981', 'DD-MM-YYYY'), 1250, 1400, 30);
INSERT INTO EMP VALUES
        (7698, 'BLAKE',  'MANAGER',   7839,
        TO_DATE('1-05-1981', 'DD-MM-YYYY'),  2850, NULL, 30);
INSERT INTO EMP VALUES
        (7782, 'CLARK',  'MANAGER',   7839,
        TO_DATE('9-06-1981', 'DD-MM-YYYY'),  2450, NULL, 10);
INSERT INTO EMP VALUES
        (7788, 'SCOTT',  'ANALYST',   7566,
        TO_DATE('09-12-1982', 'DD-MM-YYYY'), 3000, NULL, 20);
INSERT INTO EMP VALUES
        (7839, 'KING',   'PRESIDENT', NULL,
        TO_DATE('17-11-1981', 'DD-MM-YYYY'), 5000, NULL, 10);
INSERT INTO EMP VALUES
        (7844, 'TURNER', 'SALESMAN',  7698,
        TO_DATE('8-09-1981', 'DD-MM-YYYY'),  1500, 0, 30);
INSERT INTO EMP VALUES
        (7876, 'ADAMS',  'CLERK',     7788,
        TO_DATE('12-01-1983', 'DD-MM-YYYY'), 1100, NULL, 20);
INSERT INTO EMP VALUES
        (7900, 'JAMES',  'CLERK',     7698,
        TO_DATE('3-12-1981', 'DD-MM-YYYY'),   950, NULL, 30);
INSERT INTO EMP VALUES
        (7902, 'FORD',   'ANALYST',   7566,
        TO_DATE('3-12-1981', 'DD-MM-YYYY'),  3000, NULL, 20);
INSERT INTO EMP VALUES
        (7934, 'MILLER', 'CLERK',     7782,
        TO_DATE('23-01-1982', 'DD-MM-YYYY'), 1300, NULL, 10);

CREATE TABLE DEPT
       (DEPTNO NUMBER(2),
        DNAME VARCHAR2(14),
        LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

CREATE TABLE SALGRADE
        (GRADE NUMBER,
         LOSAL NUMBER,
         HISAL NUMBER);

INSERT INTO SALGRADE VALUES (1,  700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (3, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);

COMMIT;

--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--

SELECT *
    FROM emp;
    
SELECT *
    FROM dept;

--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--

SELECT ename||' 사원의 담당직무는 '||job||'입니다.'
    FROM emp;

SELECT CONCAT(ename,CONCAT(' 사원의 담당직무는 ',CONCAT(job,'입니다.')))
    FROM emp;

--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--

SELECT job, deptno
    FROM emp
    ORDER BY job, deptno;
    
SELECT DISTINCT job, deptno
    FROM emp
    ORDER BY job, deptno;

--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--

SELECT ename AS "성명"
    FROM emp;

SELECT ename AS 성명     --별칭에 특수문자,공백 없으면 " 생략 가능
    FROM emp;

SELECT ename AS #성명     --별칭에 특수문자,공백 있으면 " 생략 불가
    FROM emp;

SELECT ename AS "#성명"     --별칭에 특수문자,공백 있으면 " 필수
    FROM emp;

--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--

SELECT empno, ename, sal
    FROM emp
    WHERE sal > 2000;
    
SELECT empno, deptno
    FROM emp
    WHERE deptno != 20;
    
SELECT empno, ename, hiredate
    FROM emp
    WHERE (hiredate >= '1982/01/01');
    
SELECT empno, ename, sal
    FROM emp
    WHERE sal >= 3000;
    
SELECT empno, ename, job, sal
    FROM emp
    WHERE ename = 'SCOTT';
    
SELECT empno, ename, deptno, job
    FROM emp
    WHERE deptno=10 AND job = 'MANAGER';

SELECT empno, ename, job, deptno
    FROM emp
    WHERE NOT deptno=20;

SELECT empno, ename, sal
    FROM emp
    WHERE deptno=10 OR deptno=20 AND sal>=2000; -- AND 연산자가 먼저 실행되고 OR 실행

SELECT empno, ename, sal
    FROM emp
    WHERE (deptno=10 OR deptno=20) AND sal>=2000;

SELECT empno, ename, sal, hiredate
    FROM emp
    WHERE '1981/01/01'<=hiredate AND hiredate<='1981/12/31';
    
SELECT empno, ename, deptno, sal
    FROM emp
    WHERE deptno=20 AND sal>=1500;
    
SELECT empno, ename, sal
    FROM emp
    WHERE sal >2000 OR sal <1000;
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
SELECT empno, ename, sal, hiredate
    FROM emp
    WHERE hiredate BETWEEN '1981/01/01' AND '1981/12/31'
        AND sal>=1500;

SELECT empno, ename, job
    FROM emp
    WHERE job IN('CLERK','SALESMAN','ANALYST');

--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
 
SELECT empno, ename
    FROM emp
    WHERE ename LIKE '%S';
    
SELECT empno, ename
    FROM emp
    WHERE ename LIKE '_A%';

--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--

SELECT * FROM emp;

SELECT *
    FROM emp
    WHERE ROWNUM <=4;

SELECT *
    FROM emp
    WHERE ROWNUM >1 ;   -- where 조건문의 rownum 은 반드시 rownum=1 인 값을 포함해야 한다.

--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--

SELECT NULL+2, NULL-2, NULL/2, 2/NULL
    FROM DUAL;
    
SELECT sal, comm, sal+comm
    FROM emp;
    
SELECT empno, ename, comm
    FROM emp
    WHERE comm IS NOT NULL;

SELECT empno, ename, mgr
    FROM emp
    WHERE mgr IS NULL;

SELECT empno, ename, comm
    FROM emp
    WHERE comm = NULL;    --  =, <, > 을 통한 Null 여부 확인 연산 불가능

SELECT empno, ename, sal
    FROM emp
    where comm = NULL AND sal>=2000;
 
SELECT empno, ename, sal
    FROM emp
    where comm = NULL OR sal>=2000;

SELECT sal, comm, sal+comm
    FROM emp;
    
SELECT sal, NVL(comm,0), NVL(sal+comm,0)
    FROM emp;       -- NVL(a,b) : a의 값들 중 Null 값을 b 값으로 반환
    
SELECT ename, mgr, NVL(mgr, 0)
    FROM emp;

SELECT ename, mgr, NVL2(mgr,1,0) 
     FROM emp;      -- NVL2(a,b,c) : a의 값들 중 Null 이 아니면 b, Null 이면 c 를 반환

SELECT NULLIF(3,4)
    FROM DUAL;      -- NULLIF(a,b) : a=b 이면 NULL을 반환, a!=b 이면 a를 반환 

SELECT comm, mgr, COALESCE(comm, mgr)
    FROM emp;       -- COALESCE(a,b,c,d,....) : 괄호안의 값들 중 Null 이 아닌 첫번째 값을 반환

--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--

select empno, ename, sal
    from emp
    order by sal asc;
    
select empno, ename, sal
    from emp
    order by sal desc;
    
select empno, ename, sal
    from emp
    order by sal;       -- asc 는 생략 가능
    
select empno, ename, sal
    from emp
    order by 3 asc;     -- 숫자를 사용하여 몇번째 컬럼을 기준으로 정렬할지 설정 가능

select empno, ename, sal
    from emp;

select empno, ename, sal
    from emp
    where rownum<=4
    order by sal desc;      -- order by 절은 연산 순서의 맨 마지막이므로
                            -- where 조건절 및 select 가 적용된 후 맨 마지막에 적용됨

select empno, ename, deptno
    from emp
    where rownum<=3
    order by 4;     -- where절 및 select절 실행 결과에는 4번째 컬럼이 없으므로
                    -- 그 이후에 적용되는 order by 에 4번째 컬럼에 대한 부분이 있으면 에러

select empno, ename, deptno
    from emp
    order by sal desc;      -- 그러나, rownum 숫자로 지정하지 않고
                            -- 컬럼명으로 지정 시에는 출력될 컬럼이 아닌 컬럼을 기준으로 정렬하는 것도 가능하다.

                    
select empno, ename, sal, comm
    from emp
    order by sal desc, ename asc;       -- 복수개의 컬럼에 정렬 적용 가능 (순차 적용)
    
select empno, ename, comm
    from emp
    order by comm asc;      -- 정렬 시 NULL 값은 무한대로 취급 (오라클 기준, SQL server 는 반대)

select empno, ename, comm
    from emp
    order by comm desc;

select empno, ename, hiredate
    from emp
    order by hiredate desc;
    
select empno, ename, sal
    from emp
    where job='SALESMAN'
    order by sal;
    
select empno, ename, hiredate
    from emp
    where hiredate between '1981/01/01' and '1981/12/31'
    order by empno;
    
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--   

select sum(sal), round(avg(sal),2), max(sal), min(sal), count(sal)
    from emp;
    
select sal, sum(sal), round(avg(sal),2)
    from emp;       -- 집계함수는 다른 컬럼들과 섞여서 사용되지 못한다.(행의 개수가 다르므로)
    
select comm
    from emp;       -- comm 출력시 Null 행 포함하여 총 14개 행 출력

select count(comm)
    from emp;       -- Null 값 제외하여 총 4개 행 출력
                    -- 집계함수는 Null 을 제외하고 연산하는것이 원칙 !!!
    
select count(*)
    from emp;       -- 그러나 예외적으로 count(*) 은 Null 값 포함하여 연산한다!!
    
select comm
    from emp;
    
select avg(comm)
    from emp;       -- comm 에 Null 값이 포함되어 있으나 이를 제외하고 연산

select count(*), count(empno), count(comm)
    from emp;

select job
    from emp;       -- job 출력 시 총 14개 행 출력    

select count(job)
    from emp;       -- job 의 행 개수 14
    
select count(distinct(job))
    from emp;       -- 중복없이 카운트 할 때, Distinct 사용

select avg(SYSDATE-HIREDATE)  
    from emp
    where job='SALESMAN';       -- SYSDATE : 시스템 기준 현재시간


--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--   

select sum(sal), count(empno)
    from emp
    group by deptno;
    
select job, sal
    from emp;
    
select job, sum(sal)
    from emp
    group by job;       -- Group By 절을 사용하여 데이터들을 원하는 그룹으로 그룹화
    
select decode(deptno,10,'A파트',20,'B파트',30,'C파트') as 부서, round(avg(sal),2)
    from emp
    where sal >= 1500
    group by deptno
    order by deptno;
    
select mgr, count(empno)
    from emp
    group by mgr;


-- ※ 연산 순서 : From → Where → Group By → Having → Select → Order By  
    
select empno, ename, sal
    from emp
    where sal > avg(sal);       -- 집계 함수는 where절에 사용 불가
                                -- Group By 절 이전까지는 개체 수준의 정보 연산
                                -- Group By 절 이후부터는 그룹 수준의 정보 연산
-- 그룹수준의 정보연산인 집계 함수가 사용되는 Group By 절보다 Where절이 먼저 수행됨!!
                                
select empno, ename, sal
    from emp
    where sal > (select avg(sal) from emp);     -- 위의 예시는 서브쿼리를 사용하여 해결 가능


select deptno, max(sal)
    from emp
    group by deptno
    order by max(sal);      -- where 절에는 집계함수 사용불가였으나 order by 절에는 사용 가능
                            -- order by절의 연산 순서가 group by 보다 뒤이므로...
                            
select comm, count(*)
    from emp
    group by comm;      -- Group By 절은 Null 을 따로 그룹화 한다.
                        -- Null 을 제외하고 연산하는 집약함수와는 다름!!
                        
select sum(sal)
    from emp;   -- 사실 이 SQL 명령문에는 Group By Null 또는 Group By() 가 생략되어 있는 것이다.
    
select sum(sal)
    from emp
    group by Null;

select sum(sal)
    from emp
    group by ();        -- 위 3개의 SQL 명령문은 동일하다.

select job, deptno
    from emp
    order by job;

select job, deptno
    from emp
    group by job, deptno
    order by job;       -- 두 개 이상의 컬럼에 Group By 적용 → 순서쌍을 기준으로 그룹화 됨!!
    
select job, deptno, sum(sal)
    from emp
    group by job, deptno;

select job, deptno, avg(sum(sal))
    from emp
    group by job, deptno;   -- 집계 함수를 두번 중첩하여 다른 컬럼과 함께 출력하면 에러 발생 (행 개수 불일치)

--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--   

select deptno, round(avg(sal),2)
    from emp
    group by deptno
    having avg(sal)>=2500;      -- 그룹화 후에 출력할 그룹을 선택하는 조건 설정

select count(*)
    from emp                
    having count(*)>1;      -- Group By 없이 Having 이 사용된 경우
                            --  from 다음에 'group by null' 생략됨

select count(*)
    from emp
    where count(*)>1;       -- 에러 발생
    

-- ※ 연산 순서 상, select 절에서 사용한 alias 별칭은 where, group by, having 에 사용불가
select deptno as dn
    from emp
    where dn = 10;      -- 에러 발생

select deptno as dn
    from emp
    group by dn;      -- 에러 발생

select deptno as dn
    from emp
    group by deptno
    having dn = 10;      -- 에러 발생

select deptno, sum(sal)
    from emp
    group by deptno
    having max(sal)<=3000;

select deptno, sum(sal)
    from emp
    where job = 'CLERK'
    group by deptno
    having min(sal)<=1000;

select deptno, sum(sal)
    from emp
    where sal >= 1500
    group by deptno
    having min(sal) between 1000 and 5000;

--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--   


-- Grouping Sets 의 인수가 1개 일때는 단순하게 group by 절을 사용한 결과와 동일    
select deptno, sum(sal)
    from emp
    group by deptno;

select deptno, sum(sal)
    from emp
    group by grouping sets(deptno);    


-- Grouping Sets 함수 사용 (인수 2개 이상일 경우)
-- Grouping Sets(A,B) = group by A 결과 + group by B 결과
-- Grouping Sets 의 인수들은 평등관계 --> Grouping Sets(A,B) = Grouping Sets(B,A)

select job, sum(sal)
    from emp
    group by job;

select deptno, sum(sal)
    from emp
    group by deptno;


select job, deptno, sum(sal)
    from emp
    group by grouping sets(job, deptno);



select deptno, sum(sal)
    from emp
    group by deptno;

select mgr, sum(sal)
    from emp
    group by mgr;
    
select null, sum(sal)
    from emp
    group by null;
    
select deptno, mgr, sum(sal)
    from emp
    group by grouping sets(deptno, mgr, null);

select deptno, mgr, sum(sal)
    from emp
    group by grouping sets(deptno, mgr, ());        -- () = Null



-- Rollup(A) =     Grouping sets(A)   +  Grouping sets(Null)
--           =        Group by A      +  Group by Null
--           =  A 컬럼의 그룹별 결과  +  전체 그룹을 합친 결과
select job, sum(sal), count(*)
    from emp
    group by job;

select job, sum(sal), count(*)
    from emp
    group by rollup(job);



-- Rollup(A,B) = Grouping sets( (A,B) )  +    Grouping sets(A)    +  Grouping sets(Null)
--             =     Group by A,B        +        Group by A      +   Group by Null
--             =  A,B 조합 그룹별 결과   +   A 컬럼 그룹별 결과   +   전체 그룹을 합친 결과
-- Rollup 의 인수는 계층구조. 인수 순서에 따라 결과 다름!!! --> Rollup(A,B) != Rollup(B,A)    

select mgr, deptno, sum(sal)
    from emp
    group by rollup(mgr,deptno);
    


-- Group By A, Rollup(B) = Rollup(B) 수행 결과를 A그룹별로 분리

select job, count(*), sum(sal)
    from emp
    group by rollup(job);

select mgr, job, count(*), sum(sal)
    from emp
    group by mgr, rollup(job)
    order by job, mgr;
    

-- Cube(A,B) = Rollup(A,B) + Rollup(B,A)
--           = Group by A,B + Group by A + Group by B + Group by Null
--           =  A,B조합 그룹별 결과 + A컬럼 그룹별 결과 + B컬럼 그룹별 결과 + 전체 그룹을 합친 결과 
-- Cube의 인수들은 평등관계 --> Cube(A,B) = Cube(B,A)

select job, deptno, sum(sal)
    from emp
    group by cube(job, deptno)
    order by job;


--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--   

select ename
    from emp;

select dname
    from dept;
    

select *
    from emp cross join dept;



select *
    from emp A, dept B
    where A.deptno = B.deptno;   -- where 절을 이용한 join
    
select *
    from emp A join dept B
    on A.deptno = B.deptno;      -- join + on 을 이용한 join
                                 -- 본래 명령어는 inner join 이지만 inner 생략 가능

select *
    from emp A join dept B
    using(deptno);               -- join + using 을 이용한 join
                                 -- using 사용 시에는 등가조인만 가능
    
select A.empno, A.ename, B.dname
    from emp A, dept B
    where A.deptno = B.deptno;

select A.empno, A.ename, job
    from emp A join dept B
        on (A.deptno=B.deptno)
    where B.loc = 'CHICAGO';

select a.empno, a.ename, a.sal, b.grade
    from emp A, salgrade B
    where a.sal between b.losal and b.hisal;

select a.empno, a.ename, a.sal, c.grade
    from emp A join salgrade c
        on (a.sal between c.losal and c.hisal);    

select a.empno, a.ename, a.sal, b.dname
from emp a, dept b, salgrade c
where a.deptno = b
.deptno
and (a.sal between c.losal and c.hisal)
and  c.grade = 4 ; 
        
select sum(sal), round(avg(sal),2), max(sal), min(sal), count(empno)
    from emp a join salgrade b
        on a.sal between b.losal and b.hisal
    group by b.grade;

-- 셀프 조인
select a.empno as 사원번호, a.ename as 사원이름, b.empno as 상사번호, b.ename as 상사이름
    from emp a join emp b
        on a.mgr=b.empno;

select c.empno, c.ename, c.job
    from emp a, emp b, emp c
    where a.ename = 'SCOTT'
        and a.mgr = b.empno
        and b.job = c.job;


select *
    from emp a join emp b
        on a.mgr=b.empno
    order by a.empno, a.mgr, b.empno, b.mgr;

select *
    from emp a left outer join emp b
        on a.mgr=b.empno
    order by a.empno, a.mgr, b.empno, b.mgr;    

select *
    from emp a right outer join emp b
        on a.mgr=b.empno
    order by a.empno, a.mgr, b.empno, b.mgr;

select *
    from emp a full outer join emp b
        on a.mgr=b.empno
    order by a.empno, a.mgr, b.empno, b.mgr;



















select sysdate
    from dual;
    

select extract(month from sysdate) from dual;



select empno, ename, sal, deptno
    from emp
    where deptno  = (select deptno 
                        from emp
                        where ename = 'FORD');
    
select empno, ename, mgr
    from emp
    where mgr = (select mgr
                    from emp
                    where ename = 'ALLEN');    


select empno, ename, job
    from emp
    where deptno = (select deptno from dept where loc = 'CHICAGO')
        and mgr = (select empno from emp where ename = 'BLAKE');



select ename, sal,
        round((select avg(sal) from emp),2) as "평균급여", 
        round(sal-(select avg(sal) from emp),2) as "평균급여와의 차이"
    from emp
    order by ("평균급여와의 차이");



select empno, ename, sal
    from emp
    where exists(select empno from emp where sal>= 3000);







select count(*)
    from dual;
    
select *
    from emp a inner join emp b
    on a.empno = b.empno; 




select empno, ename, mgr, level
    from emp
    start with mgr is null
        connect by mgr = prior empno
    order by level;


    
SELECT ename, sal*1.2, ROUND(sal*1.2,-2)
    FROM emp
    WHERE sal <= 2000;

SELECT sal, comm, sal + comm AS "급여+커미션"
    FROM emp;
    
SELECT empno, ename
    FROM emp
    WHERE comm = NULL;
    
SELECT empno, ename, sal, NVL(comm,0), sal+NVL(comm,0)
    FROM emp;
    
SELECT comm, mgr, COALESCE(comm, mgr)
    FROM emp;

SELECT avg(sysdate -hiredate)
    FROM emp
    where job='SALESMAN';

SELECT deptno, count(sal), SUM(sal), ROUND(AVG(sal),2)
    FROM emp
    GROUP BY deptno;
    
SELECT DECODE(deptno,10,'인사',20,'영업',30,'생산') as "부서", ROUND(AVG(sal), 2)
    FROM emp
    WHERE sal >=1500
    GROUP BY deptno;
    
SELECT job, deptno, SUM(sal)
    FROM emp
    GROUP BY job, deptno
    ORDER BY DEPTNO ;
    
SELECT deptno, ROUND(AVG(sal),2)
    FROM emp
    GROUP BY deptno
    HAVING AVG(sal)>=2500;
    
SELECT deptno, avg(sal)
    FROM emp
    WHERE sal >=1500
    GROUP BY deptno
    HAVING MIN(sal)>=1000 AND MAX(sal) <=5000;
 
    FROM emp
    GROUP BY GROUPING SETS(mgr, deptno);

SELECT empno, ename, hiredate
    FROM emp
    WHERE hiredate < ANY(SELECT hiredate
                            FROM emp
                            where deptno = (select deptno
                                                from dept
                                                where loc = 'DALLAS'));

------------------------------------------
DROP TABLE example;
--------------------------------------------
CREATE TABLE example
AS
SELECT *
    FROM emp;

select * from example;
--------------------------------------------
INSERT INTO example (empno, ename, job)
    VALUES(1000,'김강민','인사');

select * from example;
----------------------------------------------
INSERT INTO example(empno, ename)
    VALUES(1002,'ERRFATUS');

select * from example; 