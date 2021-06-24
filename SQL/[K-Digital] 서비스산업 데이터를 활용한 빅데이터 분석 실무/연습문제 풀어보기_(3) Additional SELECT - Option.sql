
-- [Additional SELECT - Option] 문제 /////////////////////////////////////////--

-- 1. 학생이름과 주소지를 표시하시오.
-- 단, 출력 헤더는 "학생 이름", "주소지"로 하고, 정렬은 이름으로 오름차순 표시하도록 한다.

SELECT  student_name "학생 이름",
        student_address 주소지
    FROM tb_student
    ORDER BY student_name;


-- 2. 휴학중인 학생들의 이름과 주민번호를 나이가 적은 순서로 화면에 출력하시오.

SELECT  student_name,
        student_ssn
    FROM tb_student
    WHERE absence_yn = 'Y'
    ORDER BY student_ssn DESC;


-- 3. 주소지가 강원도나 경기도인 학생들 중
-- 1900년대 학번을 가진 학생들의 이름과 학번, 주소를 이름의 오름차순으로 화면에 출력하시오.
-- 단, 출력헤더에는 "학생이름","학번", "거주지 주소" 가 출력되도록 한다.

SELECT  student_name 학생이름,
        student_no 학번,
        student_address "거주지 주소"
    FROM tb_student
    WHERE SUBSTR(student_address, 1, 3) IN ('경기도', '강원도')
            AND SUBSTR(student_no, 1, 1) = '9'
    ORDER BY student_name;
    

--  4. 현재 법학과 교수 중 가장 나이가 많은 사람부터 이름을 확인할 수 있는 SQL 문장을 작성하시오.
-- (법학과의 '학과코드'는 학과 테이블(TB_DEPARTMENT)을 조회해서 찾아 내도록 하자)

SELECT  professor_name,
        professor_ssn
    FROM tb_professor
    WHERE department_no = (SELECT department_no
                                FROM tb_department
                                WHERE department_name = '법학과')
    ORDER BY professor_ssn;
    

--  5. 2004년 2학기에 'C3118100' 과목을 수강한 학생들의 학점을 조회하려고 한다.
-- 학점이 높은 학생부터 표시하고, 학점이 같으면 학번이 낮은 학생부터 표시하는 구문을 작성해보시오.

SELECT  student_no,
        point
    FROM tb_grade
    WHERE term_no = '200402'
            AND class_no = 'C3118100'
    ORDER BY point DESC, student_no;


-- 6. 학생 번호, 학생 이름, 학과 이름을 학생 이름으로 오름차순 정렬하여 출력하는 SQL 문을 작성하시오.

SELECT  student_no,
        student_name,
        department_name,
        a.department_no     -- 공통컬럼에 대해 a. 또는 b. 별칭을 사용
                            -- ON 절로 등가조인을 하면 department_no 컬럼이
                            -- a.tb_student의 컬럼, b.tb_department 컬럼 각각 하나씩 총 2개가 생긴다!! (department_no 컬럼과 department_no_1 컬럼 )
    FROM tb_student A JOIN tb_department B
        ON a.department_no = b.department_no
    ORDER BY student_name;


SELECT  student_no,
        student_name,
        department_name,
        department_no       --  SELECT 절에서 공통컬럼에 대한 a. 또는 b. 별칭 사용이 불가능하다!!!
                            -- ( department_no 에 대해서 USING 절로 조인을 하면 department_no 컬럼이 두 개가 아닌, 하나의 공통컬럼으로 생성된다.
                            -- 이 컬럼은 tb_student 또는 tb_department 에 속해 있는 것이 아니므로 별칭을 적용할 수 없다.
    FROM tb_student A JOIN tb_department B
        USING(department_no)
    ORDER BY student_name;


-- 7. 춘 기술대학교의 과목 이름과 과목의 학과 이름을 출력하는 SQL 문장을 작성하시오.

SELECT  class_name,
        department_name
    FROM tb_class JOIN tb_department
        USING(department_no);


-- 8. 과목별 교수 이름을 찾으려고 한다. 과목 이름과 교수 이름을 출력하는 SQL 문을 작성하시오.

SELECT  class_name,
        professor_name
    FROM tb_class JOIN tb_professor
            USING(department_no)
    ORDER BY class_name;


-- 9.  8번의 결과 중 ‘인문사회’ 계열에 속한 과목의 교수 이름을 찾으려고 한다.
-- 이에 해당하는 과목 이름과 교수 이름을 출력하는 SQL 문을 작성하시오.

SELECT  class_name,
        professor_name
    FROM tb_department
            JOIN tb_class USING(department_no)
            JOIN tb_professor USING(department_no)
    WHERE tb_department.category = '인문사회'
    ORDER BY class_name;

SELECT  class_name,
        professor_name
    FROM tb_department A
            JOIN tb_class B ON b.department_no = a.department_no
            JOIN tb_professor C ON c.department_no = b.department_no
    WHERE a.category= '인문사회'
    ORDER BY class_name;

SELECT  class_name,
        professor_name
    FROM tb_department A, tb_class B, tb_professor C
    WHERE a.department_no = b.department_no
            AND b.department_no = c.department_no
            AND a.category= '인문사회'
    ORDER BY c.department_no, c.professor_no, b.class_name;

-- 10. ‘음악학과’ 학생들의 평점을 구하려고 한다.
-- 음악학과 학생들의 "학번", "학생 이름", "전체 평점"을 출력하는 SQL 문장을 작성하시오.
-- (단, 평점은 소수점 1자리까지만 반올림하여 표시한다.)



-- 11. 학번이 A313047인 학생이 학교에 나오고 있지 않다.
-- 지도 교수에게 내용을 전달하기 위한 학과 이름, 학생 이름과 지도 교수 이름이 필요하다.
-- 이때 사용할 SQL 문을 작성하시오. 단, 출력헤더는 ?학과이름?, ?학생이름?, ?지도교수이름?으로 출력되도록 한다.



-- 12. 2007년도에 '인관관계론' 과목을 수강한 학생을 찾아 학생이름과 수강학기를 표시하는 SQL 문장을 작성하시오.



-- 13. 예체능 계열 과목 중 과목 담당교수를 한 명도 배정받지 못한 과목을 찾아
-- 그 과목 이름과 학과 이름을 출력하는 SQL 문장을 작성하시오.

SELECT a.class_name, c.department_name
    FROM tb_class A
        LEFT OUTER JOIN tb_class_professor B ON a.class_no = b.class_no
        JOIN tb_department C ON c.department_no = a.department_no
    WHERE b.professor_no IS NULL
        AND c.category = '예체능'
    ORDER BY c.department_no, a.class_type DESC, a.class_name;


-- 14. 춘 기술대학교 서반아어학과 학생들의 지도교수를 게시하고자 한다.
-- 학생이름과 지도교수 이름을 찾고
-- 만일 지도 교수가 없는 학생일 경우 "지도교수 미지정"으로 표시하도록 하는 SQL 문을 작성하시오.
-- 단, 출력헤더는 "학생이름", "지도교수"로 표시하며 고학번 학생이 먼저 표시되도록 한다.

SELECT  a.student_name 학생이름,
        DECODE(b.professor_name, NULL, '지도교수 미지정', b.professor_name) 지도교수
    FROM tb_student A
            FULL OUTER JOIN tb_professor B ON a.coach_professor_no = b.professor_no
            JOIN tb_department C ON c.department_no = a.department_no
    WHERE department_name = '서반아어학과'
    ORDER BY a.student_no;


-- 15. 휴학생이 아닌 학생 중 평점이 4.0 이상인 학생을 찾아
-- 그 학생의 학번, 이름, 학과 이름, 평점을 출력하는 SQL 문을 작성하시오.

SELECT  student_no 학번, student_name 이름,
        department_name "학과 이름",
        TRUNC(AVG(point),8) 평점
    FROM tb_student JOIN tb_grade USING(student_no)
                    JOIN tb_department USING(department_no)
    WHERE absence_yn = 'N'
    GROUP BY student_no, student_name, department_name
    HAVING AVG(point) >= 4.0
    ORDER BY student_no;
    

-- 16. 환경조경학과 전공과목들의 과목 별 평점을 파악할 수 있는 SQL 문을 작성하시오.

SELECT class_no, class_name, TRUNC(AVG(point), 8)
    FROM tb_class JOIN tb_grade USING(class_no)
                  JOIN tb_department USING(department_no)
    WHERE department_name = '환경조경학과'
        AND SUBSTR(class_type,1,2) = '전공'
    GROUP BY class_no, class_name
    ORDER BY class_no;


-- 17. 춘 기술대학교에 다니고 있는 최경희 학생과 같은 과 학생들의 이름과 주소를 출력하는 SQL 문을 작성하시오.

SELECT student_name, student_address
    FROM tb_student
    WHERE department_no = (SELECT department_no
                                FROM tb_student
                                WHERE student_name = '최경희');    


-- 18. 국어국문학과에서 총 평점이 가장 높은 학생의 이름과 학번을 표시하는 SQL문을 작성하시오.

SELECT student_no, student_name
    FROM   (SELECT student_no, student_name,
                   RANK() OVER( ORDER BY AVG(point) DESC) RANK
                FROM tb_student JOIN tb_grade USING(student_no)
                                JOIN tb_department USING(department_no)
            WHERE department_name = '국어국문학과'
            GROUP BY student_no, student_name)
    WHERE RANK = 1;


-- 19. 춘 기술대학교의 "환경조경학과"가 속한 같은 계열 학과들의
-- 학과 별 전공과목 평점을 파악하기 위한 적절한 SQL 문을 찾아내시오.
-- 단, 출력헤더는 "계열 학과명", "전공평점"으로 표시되도록 하고,
-- 평점은 소수점 한 자리까지만 반올림하여 표시되도록 한다.

SELECT  department_name "계열 학과명",
        ROUND(AVG(point), 1)
    FROM tb_department
        JOIN tb_student USING(department_no)
        JOIN tb_grade USING(student_no)
        JOIN tb_class USING(class_no)
    WHERE SUBSTR(class_type,1,2) = '전공'
        AND category = (SELECT category
                                FROM tb_department
                                WHERE department_name = '환경조경학과')
    GROUP BY department_name
    ORDER BY department_name;
