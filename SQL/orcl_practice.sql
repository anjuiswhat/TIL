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

SELECT ename||' ����� ��������� '||job||'�Դϴ�.'
    FROM emp;

SELECT CONCAT(ename,CONCAT(' ����� ��������� ',CONCAT(job,'�Դϴ�.')))
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

SELECT ename AS "����"
    FROM emp;

SELECT ename AS ����     --��Ī�� Ư������,���� ������ " ���� ����
    FROM emp;

SELECT ename AS #����     --��Ī�� Ư������,���� ������ " ���� �Ұ�
    FROM emp;

SELECT ename AS "#����"     --��Ī�� Ư������,���� ������ " �ʼ�
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
    WHERE deptno=10 OR deptno=20 AND sal>=2000; -- AND �����ڰ� ���� ����ǰ� OR ����

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
    WHERE ROWNUM >1 ;   -- where ���ǹ��� rownum �� �ݵ�� rownum=1 �� ���� �����ؾ� �Ѵ�.

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
    WHERE comm = NULL;    --  =, <, > �� ���� Null ���� Ȯ�� ���� �Ұ���

SELECT empno, ename, sal
    FROM emp
    where comm = NULL AND sal>=2000;
 
SELECT empno, ename, sal
    FROM emp
    where comm = NULL OR sal>=2000;

SELECT sal, comm, sal+comm
    FROM emp;
    
SELECT sal, NVL(comm,0), NVL(sal+comm,0)
    FROM emp;       -- NVL(a,b) : a�� ���� �� Null ���� b ������ ��ȯ
    
SELECT ename, mgr, NVL(mgr, 0)
    FROM emp;

SELECT ename, mgr, NVL2(mgr,1,0) 
     FROM emp;      -- NVL2(a,b,c) : a�� ���� �� Null �� �ƴϸ� b, Null �̸� c �� ��ȯ

SELECT NULLIF(3,4)
    FROM DUAL;      -- NULLIF(a,b) : a=b �̸� NULL�� ��ȯ, a!=b �̸� a�� ��ȯ 

SELECT comm, mgr, COALESCE(comm, mgr)
    FROM emp;       -- COALESCE(a,b,c,d,....) : ��ȣ���� ���� �� Null �� �ƴ� ù��° ���� ��ȯ

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
    order by sal;       -- asc �� ���� ����
    
select empno, ename, sal
    from emp
    order by 3 asc;     -- ���ڸ� ����Ͽ� ���° �÷��� �������� �������� ���� ����

select empno, ename, sal
    from emp;

select empno, ename, sal
    from emp
    where rownum<=4
    order by sal desc;      -- order by ���� ���� ������ �� �������̹Ƿ�
                            -- where ������ �� select �� ����� �� �� �������� �����

select empno, ename, deptno
    from emp
    where rownum<=3
    order by 4;     -- where�� �� select�� ���� ������� 4��° �÷��� �����Ƿ�
                    -- �� ���Ŀ� ����Ǵ� order by �� 4��° �÷��� ���� �κ��� ������ ����

select empno, ename, deptno
    from emp
    order by sal desc;      -- �׷���, rownum ���ڷ� �������� �ʰ�
                            -- �÷������� ���� �ÿ��� ��µ� �÷��� �ƴ� �÷��� �������� �����ϴ� �͵� �����ϴ�.

                    
select empno, ename, sal, comm
    from emp
    order by sal desc, ename asc;       -- �������� �÷��� ���� ���� ���� (���� ����)
    
select empno, ename, comm
    from emp
    order by comm asc;      -- ���� �� NULL ���� ���Ѵ�� ��� (����Ŭ ����, SQL server �� �ݴ�)

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
    from emp;       -- �����Լ��� �ٸ� �÷���� ������ ������ ���Ѵ�.(���� ������ �ٸ��Ƿ�)
    
select comm
    from emp;       -- comm ��½� Null �� �����Ͽ� �� 14�� �� ���

select count(comm)
    from emp;       -- Null �� �����Ͽ� �� 4�� �� ���
                    -- �����Լ��� Null �� �����ϰ� �����ϴ°��� ��Ģ !!!
    
select count(*)
    from emp;       -- �׷��� ���������� count(*) �� Null �� �����Ͽ� �����Ѵ�!!
    
select comm
    from emp;
    
select avg(comm)
    from emp;       -- comm �� Null ���� ���ԵǾ� ������ �̸� �����ϰ� ����

select count(*), count(empno), count(comm)
    from emp;

select job
    from emp;       -- job ��� �� �� 14�� �� ���    

select count(job)
    from emp;       -- job �� �� ���� 14
    
select count(distinct(job))
    from emp;       -- �ߺ����� ī��Ʈ �� ��, Distinct ���

select avg(SYSDATE-HIREDATE)  
    from emp
    where job='SALESMAN';       -- SYSDATE : �ý��� ���� ����ð�


--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--   

select sum(sal), count(empno)
    from emp
    group by deptno;
    
select job, sal
    from emp;
    
select job, sum(sal)
    from emp
    group by job;       -- Group By ���� ����Ͽ� �����͵��� ���ϴ� �׷����� �׷�ȭ
    
select decode(deptno,10,'A��Ʈ',20,'B��Ʈ',30,'C��Ʈ') as �μ�, round(avg(sal),2)
    from emp
    where sal >= 1500
    group by deptno
    order by deptno;
    
select mgr, count(empno)
    from emp
    group by mgr;


-- �� ���� ���� : From �� Where �� Group By �� Having �� Select �� Order By  
    
select empno, ename, sal
    from emp
    where sal > avg(sal);       -- ���� �Լ��� where���� ��� �Ұ�
                                -- Group By �� ���������� ��ü ������ ���� ����
                                -- Group By �� ���ĺ��ʹ� �׷� ������ ���� ����
-- �׷������ ���������� ���� �Լ��� ���Ǵ� Group By ������ Where���� ���� �����!!
                                
select empno, ename, sal
    from emp
    where sal > (select avg(sal) from emp);     -- ���� ���ô� ���������� ����Ͽ� �ذ� ����


select deptno, max(sal)
    from emp
    group by deptno
    order by max(sal);      -- where ������ �����Լ� ���Ұ������� order by ������ ��� ����
                            -- order by���� ���� ������ group by ���� ���̹Ƿ�...
                            
select comm, count(*)
    from emp
    group by comm;      -- Group By ���� Null �� ���� �׷�ȭ �Ѵ�.
                        -- Null �� �����ϰ� �����ϴ� �����Լ��ʹ� �ٸ�!!
                        
select sum(sal)
    from emp;   -- ��� �� SQL ��ɹ����� Group By Null �Ǵ� Group By() �� �����Ǿ� �ִ� ���̴�.
    
select sum(sal)
    from emp
    group by Null;

select sum(sal)
    from emp
    group by ();        -- �� 3���� SQL ��ɹ��� �����ϴ�.

select job, deptno
    from emp
    order by job;

select job, deptno
    from emp
    group by job, deptno
    order by job;       -- �� �� �̻��� �÷��� Group By ���� �� �������� �������� �׷�ȭ ��!!
    
select job, deptno, sum(sal)
    from emp
    group by job, deptno;

select job, deptno, avg(sum(sal))
    from emp
    group by job, deptno;   -- ���� �Լ��� �ι� ��ø�Ͽ� �ٸ� �÷��� �Բ� ����ϸ� ���� �߻� (�� ���� ����ġ)

--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--   

select deptno, round(avg(sal),2)
    from emp
    group by deptno
    having avg(sal)>=2500;      -- �׷�ȭ �Ŀ� ����� �׷��� �����ϴ� ���� ����

select count(*)
    from emp                
    having count(*)>1;      -- Group By ���� Having �� ���� ���
                            --  from ������ 'group by null' ������

select count(*)
    from emp
    where count(*)>1;       -- ���� �߻�
    

-- �� ���� ���� ��, select ������ ����� alias ��Ī�� where, group by, having �� ���Ұ�
select deptno as dn
    from emp
    where dn = 10;      -- ���� �߻�

select deptno as dn
    from emp
    group by dn;      -- ���� �߻�

select deptno as dn
    from emp
    group by deptno
    having dn = 10;      -- ���� �߻�

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


-- Grouping Sets �� �μ��� 1�� �϶��� �ܼ��ϰ� group by ���� ����� ����� ����    
select deptno, sum(sal)
    from emp
    group by deptno;

select deptno, sum(sal)
    from emp
    group by grouping sets(deptno);    


-- Grouping Sets �Լ� ��� (�μ� 2�� �̻��� ���)
-- Grouping Sets(A,B) = group by A ��� + group by B ���
-- Grouping Sets �� �μ����� ������ --> Grouping Sets(A,B) = Grouping Sets(B,A)

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
--           =  A �÷��� �׷캰 ���  +  ��ü �׷��� ��ģ ���
select job, sum(sal), count(*)
    from emp
    group by job;

select job, sum(sal), count(*)
    from emp
    group by rollup(job);



-- Rollup(A,B) = Grouping sets( (A,B) )  +    Grouping sets(A)    +  Grouping sets(Null)
--             =     Group by A,B        +        Group by A      +   Group by Null
--             =  A,B ���� �׷캰 ���   +   A �÷� �׷캰 ���   +   ��ü �׷��� ��ģ ���
-- Rollup �� �μ��� ��������. �μ� ������ ���� ��� �ٸ�!!! --> Rollup(A,B) != Rollup(B,A)    

select mgr, deptno, sum(sal)
    from emp
    group by rollup(mgr,deptno);
    


-- Group By A, Rollup(B) = Rollup(B) ���� ����� A�׷캰�� �и�

select job, count(*), sum(sal)
    from emp
    group by rollup(job);

select mgr, job, count(*), sum(sal)
    from emp
    group by mgr, rollup(job)
    order by job, mgr;
    

-- Cube(A,B) = Rollup(A,B) + Rollup(B,A)
--           = Group by A,B + Group by A + Group by B + Group by Null
--           =  A,B���� �׷캰 ��� + A�÷� �׷캰 ��� + B�÷� �׷캰 ��� + ��ü �׷��� ��ģ ��� 
-- Cube�� �μ����� ������ --> Cube(A,B) = Cube(B,A)

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
    where A.deptno = B.deptno;   -- where ���� �̿��� join
    
select *
    from emp A join dept B
    on A.deptno = B.deptno;      -- join + on �� �̿��� join
                                 -- ���� ��ɾ�� inner join ������ inner ���� ����

select *
    from emp A join dept B
    using(deptno);               -- join + using �� �̿��� join
                                 -- using ��� �ÿ��� ����θ� ����
    
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

-- ���� ����
select a.empno as �����ȣ, a.ename as ����̸�, b.empno as ����ȣ, b.ename as ����̸�
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
        round((select avg(sal) from emp),2) as "��ձ޿�", 
        round(sal-(select avg(sal) from emp),2) as "��ձ޿����� ����"
    from emp
    order by ("��ձ޿����� ����");



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

SELECT sal, comm, sal + comm AS "�޿�+Ŀ�̼�"
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
    
SELECT DECODE(deptno,10,'�λ�',20,'����',30,'����') as "�μ�", ROUND(AVG(sal), 2)
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
    VALUES(1000,'�谭��','�λ�');

select * from example;
----------------------------------------------
INSERT INTO example(empno, ename)
    VALUES(1002,'ERRFATUS');

select * from example; 