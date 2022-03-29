-- dept 테이블 정보 (부서정보 - 부서번호, 부서명, 위치)

DESC dept;

-- 사원정보(사원번호, 사원명, 직책, 직속상관의 사원번호, 입사일, 급여, 추가수당, 부서번호)
desc emp;

-- 급여구간(등급, 최저급여, 최고급여)
desc salgrade;

-- 조회(SELECT)
-- SELECT 조회하고 싶은 열이름 나열
-- FROM 조회할 테이블명

SELECT
    deptno
FROM
    dept;

SELECT
    deptno,
    dname
FROM
    dept;

SELECT
    *
FROM
    dept;

SELECT
    *
FROM
    emp;

SELECT
    empno,
    ename,
    deptno
FROM
    emp;

SELECT
    deptno
FROM
    emp;

-- DISTINCT : 중복 데이터 제거
SELECT DISTINCT
    deptno
FROM
    emp;

SELECT DISTINCT
    job,
    deptno
FROM
    emp;

-- ALIAS(별칭)
-- AS 별칭 : as 생략가능
SELECT
    ename           AS 사원명,
    sal             급여,
    comm            AS "추가 수당",
    sal * 12 + comm AS 연봉
FROM
    emp;
    
-- 원하는 순서로 출력 데이터를 정렬
-- ORDER BY 정렬할 열 이름 [정렬옵션]

-- emp 테이블에서 ename, sal 조회할 때 sal 내림차순 조회
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC;
    
-- 오름차순 조회
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal;    --  기본 정렬값이 오름차순(ASC)

-- EMP 테이블의 전체 열을 조회(부서번호는 오름차순이고, 급여의 내림차순)
SELECT
    *
FROM
    emp
ORDER BY
    deptno ASC,
    sal DESC;

-- 특정한 조건을 기준으로 데이터 조회
-- SELECT ~ FROM ~ WHERE 기준
SELECT
    *
FROM
    emp
WHERE
    deptno = 30;

-- 사원번호가 7782
SELECT
    *
FROM
    emp
WHERE
    empno = 7782;

-- 부서번호가 30이고 사원직책이 SALESMAN 인 사원 조회
-- 문자열 표현 : 홑따옴표
SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';
    
-- 사원번호가 7499이고 부서번호가 30인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;

-- 부서번호가 30이거나, 사원직책이 CLERCK 인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30
    OR job = 'CLERK';

-- 연산자
-- 산술연산자
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;

-- 비교연산자(>,<,=,<=,>=)
SELECT
    *
FROM
    emp
WHERE
    sal >= 3000;

-- 문자도 대소비교 연산자가 가능
-- ENAME 'F' 이상인 사원 조회(사원 이름의 첫문자가 F와 같거나 뒤 쪽인 것 조회)
SELECT
    *
FROM
    emp
WHERE
    ename >= 'F';

-- 급여갸 2500이상이고, 직업이 ANALYST인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        job = 'ANALYST'
    AND sal >= 2500;

-- 직무가 MANAGER, SALESMAN, CLERK인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    job = 'MANAGER'
    OR job = 'SALESMAN'
    OR job = 'CLERK';
    
-- 등가비교연산자 ( 같다 : =, 같지 않다 : !=, <>, ^=)

-- 급여가 3000이 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal != 3000;

SELECT
    *
FROM
    emp
WHERE
    sal <> 3000;

SELECT
    *
FROM
    emp
WHERE
    sal^= 3000;

-- 논리부정연산자 : NOT
SELECT
    *
FROM
    emp
WHERE
    NOT sal = 3000;
    
-- IN 연산자 : =의 의미와 같음
SELECT
    *
FROM
    emp
WHERE
    job IN ( 'MANAGER', 'SALESMAN', 'CLERK' );
    
-- IN 사용해서 부서번호가 10, 20번인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );

-- JOB 'MANAGER' 아니고, 'SALESMAN' 아니고, 'CLERK' 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
        job != 'MANAGER'
    AND job <> 'SALESMAN'
    AND job^= 'CLERK';

-- NOT + IN 
SELECT
    *
FROM
    emp
WHERE
    job NOT IN ( 'MANAGER', 'SALESMAN', 'CLERK' );
    
-- BETWEEN A AND B 연산자 : 급여가 2000 이상 3000 이하
SELECT
    *
FROM
    emp
WHERE
        sal >= 2000
    AND sal <= 3000;

SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;

-- 급여가 2000이상 3000이하가 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal NOT BETWEEN 2000 AND 3000;

-- LIKE 연산자와 와일드 카드( _ : 어떤 값이든 상관없이 단 한개의 문자 데이터
--                         % : 어떤 값이든 상관없고 길이와 상관없이 모든 문자 데이터)


-- 사원 이름이 S로 시작하는 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%';

-- 사원 이름의 두번째 글자가 L인 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';

-- 사원 이름에 AM 이 들어있는 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM%';

-- 사원 이름에 AM 이 들어있지 않는 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM%';

-- IS NULL 연산자
-- COMM 이 null 인 사원 조회
SELECT
    *
FROM
    emp
WHERE
-- comm - null; null에는 = 사용 못함
    comm IS NULL;

-- MGR 이 널이 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NOT NULL;

-- 집합 연산자
-- union(합집합), minus(차집합), interest(교집합)

-- deptno=10 or deptno=20 사원 조회 : union 사용해서
-- union (중복값 제거함)
SELECT
    *   -- > 이 부분 일치해야함
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    *   -- > 이 부분 일치해야함
FROM
    emp
WHERE
    deptno = 20;

-- UNION ALL(중복제거 안함)
SELECT
    *   -- > 이 부분 일치해야함
FROM
    emp
WHERE
    deptno = 10
UNION ALL
SELECT
    *   -- > 이 부분 일치해야함
FROM
    emp
WHERE
    deptno = 10;

-- UNION MINUS
SELECT
    *   -- > 이 부분 일치해야함
FROM
    emp
MINUS
SELECT
    *   -- > 이 부분 일치해야함
FROM
    emp
WHERE
    deptno = 10;

-- INTERSECT 일치하는 것만 찾기
SELECT
    *
FROM
    emp
INTERSECT
SELECT
    *
FROM
    emp
WHERE
    deptno = 10;
    
-- [문제] 사원 이름(ename)이 s로 끝나는 사원 데이터를 출력한다.
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%S';

-- [문제] 30번 부서(deptno)에서 근무하고 있는 사원 중에 직책(JOB)이
-- SALESMAN 인 사원의 사원 번호, 이름, 급여, 부서 번호를 출력한다.
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 30
INTERSECT
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    job = 'SALESMAN';

-- [문제] 20, 30번 부서에 근무하고 있는 사원 중 급여(SAL) 가 2000초과인
-- 사원을 다음 두 가지 방식의 SELECT 문을 사용하여 사원번호, 이름, 직책, 급여
-- 부서 번호를 출력하는 SQL 믄을 작성해 보시오.
-- 집합 연산자를 사용하지 않은 방식
-- 집합 연산자를 사용한 방식

SELECT
    empno,
    ename,
    job,
    sal,
    deptno
FROM
    emp
WHERE
    deptno IN ( 20, 30 )
    AND sal > 2000;

SELECT
    empno,
    ename,
    job,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 20
    OR deptno = 30
INTERSECT
SELECT
    empno,
    ename,
    job,
    sal,
    deptno
FROM
    emp
WHERE
    sal > 2000;

SELECT
    empno,
    ename,
    job,
    sal,
    deptno
FROM
    emp
WHERE
    sal > 2000
MINUS
SELECT
    empno,
    ename,
    job,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;


-- [문제] NOT BETWEEN A AND B 연산자를 쓰지 않고, 급여(SAL) 열 값이
-- 2000 이상 3000 이하 범위 이외의 값을 가진 데이터만 출력하도록 SQL 문을 작성하시오.

SELECT
    *
FROM
    emp
WHERE
    sal < 2000
    OR sal > 3000;

--SELECT
--    *
--FROM
--    emp
--WHERE
--    sal >= 2000
--INTERSECT
--SELECT
--    *
--FROM
--    emp
--WHERE
--    sal <= 3000;

-- [문제] 사원 이름에 E 가 포함되어 있는 30번 부서의 사원 중 급여가 1000~2000 사이가
-- 아닌 사원 이름, 사원 번호, 급여, 부서 번호를 출력하는 SQL 문을 작성
SELECT
    ename,
    empno,
    sal,
    deptno
FROM
    emp
WHERE
    ename LIKE '%E%'
    AND deptno = 30
MINUS
SELECT
    ename,
    empno,
    sal,
    deptno
FROM
    emp
WHERE
    sal BETWEEN 1000 AND 2000;

SELECT
    ename,
    empno,
    sal,
    deptno
FROM
    emp
WHERE
    ename LIKE '%E%'
    AND deptno = 30
    AND sal NOT BETWEEN 1000 AND 2000;


-- [문제] 추가 수당이 존재하지 않고 상급자가 있고 직책이 MANAGER, CLERK 인 사원
-- 중에서 사원 이름의 두 번째 글자가 L 이 아닌 사원의 정보를 출력하는 SQL 문을 작성
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL
    AND mgr IS NOT NULL
    AND job IN ( 'MANAGER', 'CLERK' )
MINUS
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';

SELECT
    *
FROM
    emp
WHERE
    comm IS NULL
    AND mgr IS NOT NULL
    AND job IN ( 'MANAGER', 'CLERK' )
    AND ename NOT LIKE '_L%';
    
-- 오라클 함수

-- 대소문자 변경 : UPPER(), LOWER(), INITCAP()

SELECT
    ename,
    upper(ename),
    lower(ename),
    initcap(ename)
FROM
    emp;

-- DUAL : SYSO 가 소유하는 테이블
--        임시 연산이나 함수의 결과값 확인하는 용도


-- 문자열 길이 : LENGTH / 문자열 바이트 수 반환 : LENGTHB
SELECT
    length('한글'),
    lengthb('한글'),
    length('AB'),
    lengthb('AB')
FROM
    dual;

SELECT
    ename,
    length(ename)
FROM
    emp;

-- [실습] 직책 이름이 6글자 이상인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    length(job) >= 6;

-- 문자열 추출 : SUBSTR(원본데이터, 시작위치, [추출길이]) (추출길이는 옵션)
SELECT
    job,
    substr(job, 1, 2),
    substr(job, 3, 2),
    substr(job, 5)
FROM
    emp;

-- [문제] EMP 테이블의 모든 사원 이름을 세번째 글자부터 끝까지 출력
SELECT
    ename,
    substr(ename, 3)
FROM
    emp;
    
-- 문자열 데이터 안에서 특정 문자 위치 찾기 : 
-- INSTR(문자열 데이터, 위치를 찾으려고 하는 부분 문자, 
-- 시작위치, 시작위치에서 찾으려는 문자가 몇 번쨰인지 지점)
SELECT
    instr('HELLO ORACLE!', 'L')       AS instr1,
    instr('HELLO ORACLE!', 'L', 5)    AS instr2,
    instr('HELLO ORACLE!', 'L', 5, 2) AS instr3
FROM
    dual;
    
-- 사원 이름에 S가 있는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    instr(ename, 'S') > 0;

-- 특정문자를 다른 문자로 변경 : REPLACE(원본, 찾는 문자, 바꿀 문자)
SELECT
    '010-1234-5678',
    replace('010-1234-5678', '-', ' ') AS replace1,
    replace('010-1234-5678', '-')      AS replace12  -- 대체할 문자 안주면 아예 빠져버린다.
FROM
    dual;

-- 문자열 연결 : CONCAT(문자1, 문자2)
SELECT
    concat(empno, concat(':', ename))
FROM
    emp;

-- 문자열 연결 : ||
SELECT
    empno || ename
FROM
    emp;

SELECT
    empno
    || ':'
    || ename
FROM
    emp;

-- 특정 문자열 제거 (아무것도 안주면 공백제거) : TRIM(), LTRIM(), RTRIM()
SELECT
    '    이것이     ',
    TRIM('    이것이    '),
    ltrim('    이것이    '),
    rtrim('    이것이    ')
FROM
    dual;

-- 숫자 함수
-- round() : 반올림, trunc() : 버림,
-- ceil() : 지정된 숫자보다 큰 정수 중에서 가장 작은 정수
-- floor() : 지정된 숫자보다 작은 정수 중에서 가장 큰 정수
-- mod() : 나머지

-- 반올림
SELECT
    round(1234.5678)      AS round,
    round(1234.5678, 0)   AS round1,
    round(1234.5678, 1)   AS round2,
    round(1234.5678, 2)   AS round3,
    round(1234.5678, - 1) AS round4,
    round(1234.5678, - 2) AS round5
FROM
    dual;

-- 버림
SELECT
    trunc(1234.5678)      AS trunc,
    trunc(1234.5678, 0)   AS trunc1,
    trunc(1234.5678, 1)   AS trunc2,
    trunc(1234.5678, 2)   AS trunc3,
    trunc(1234.5678, - 1) AS trunc4,
    trunc(1234.5678, - 2) AS trunc5
FROM
    dual;

-- ceil() : 지정된 숫자보다 큰 정수 중에서 가장 작은 정수
-- floor() : 지정된 숫자보다 작은 정수 중에서 가장 큰 정수
SELECT
    ceil(3.14),
    floor(3.14),
    ceil(- 3.14),
    floor(- 33.14)
FROM
    dual;

-- 나머지
SELECT
    mod(15, 6),
    mod(10, 2),
    mod(11, 2)
FROM
    dual;

-- 날짜 함수 : 연산이 가능함
-- sysdate, current_date, current_timestamp

SELECT
    sysdate,
    current_date,
    current_timestamp
FROM
    dual;

SELECT
    sysdate     AS now,
    sysdate - 1 AS yesterday,
    sysdate + 1 AS tommorrow
FROM
    dual;

-- add_months() : 몇 개월 이후 날짜 구하기
SELECT
    sysdate,
    add_months(sysdate, 3)
FROM
    dual;

-- 입사 20주년이 되는 사원들 조회
SELECT
    empno,
    ename,
    hiredate,
    add_months(hiredate, 240)
FROM
    emp;

-- 현재 날짜를 기준으로 입사 45년 미만인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    add_months(hiredate, 540) > sysdate;

-- months_between(날짜1, 날짜2) : 두 날짜 데이터 간의 날짜 차이를 개월 수로 출력

SELECT
    empno,
    ename,
    hiredate,
    sysdate,
    months_between(hiredate, sysdate)        AS months1,
    months_between(sysdate, hiredate)        AS months2,
    trunc(months_between(sysdate, hiredate)) AS months3
FROM
    emp;

-- next_day() : 특정 날짜를 기준으로 돌아오는 요일의 날짜 출력
-- last_day() : 특정 날짜가 속한 달의 마지막 날짜 출력
SELECT
    sysdate,
    next_day(sysdate, '월요일'),
    last_day(sysdate)
FROM
    dual;

-- 형변환 함수

SELECT
    empno,
    ename,
    empno + '500'
FROM
    emp
WHERE
    ename = 'SMITH';

SELECT
    empno,
    ename,
    'abcd' + empno
FROM
    emp
WHERE
    ename = 'SMITH';

-- TO_CHAR() : 숫자, 날짜, 데이터를 문자 데이터로 변환
-- TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환
-- TO_DATE() : 문자 데이터를 날짜 데이터로 변환

SELECT
    to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS') AS 현재날짜시간
FROM
    dual;

SELECT
    to_char(sysdate, 'MM')    AS mm,
    to_char(sysdate, 'MON')   AS mon,
    to_char(sysdate, 'MONTH') AS month,
    to_char(sysdate, 'DD')    AS dd,
    to_char(sysdate, 'DY')    AS dy,
    to_char(sysdate, 'DAY')   AS day
FROM
    dual;

SELECT
    to_char(sysdate, 'HH24:MI:SS')    AS hh24miss, -- 24시간
    to_char(sysdate, 'HH24:MI:SS AM') AS hhmiss_am,
    to_char(sysdate, 'HH:MI:SS P.M.') AS hhmiss_pm,
    to_char(sysdate, 'HH:MI:SS')      AS hhmiss  -- 12시간
FROM
    dual;

SELECT
    1300 - '1500',
    '1300' + 1500
FROM
    dual;

SELECT
    '1,300' - '1,500'
FROM
    dual;

-- 9: 숫자 한자리를 의미함   
SELECT
    to_number('1,300', '999,999') + to_number('1,500', '999,999')
FROM
    dual;

SELECT
    sal,
    to_char(sal, '$999,999') AS sal_$
FROM
    emp;   -- 오라클에서는 숫자의 개념이 아니라  문자의 개념으로 변함. 덧셈/뺄셈 불가능

-- 문자 데이터를 날짜 데이터로 변환
SELECT
    TO_DATE('2022-03-22', 'YYYY-MM-DD') AS date1,
    TO_DATE('20220322', 'YYYY-MM-DD')   AS date2
FROM
    dual;

DESC EMP;

-- 1981년 6월 1일 이후에 입사한 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    hiredate > TO_DATE('19810601', 'YYYY-MM-DD');

-- NULL 처리 함수

SELECT
    empno,
    ename,
    sal,
    comm,
    sal + comm
FROM
    emp;

-- nvl(널값 열, 널인 경우 사용할 값)
SELECT
    empno,
    ename,
    sal,
    nvl(comm, 0),
    sal + nvl(comm, 0)
FROM
    emp;

-- nvl2(널값 열, 널이 아닐 경우 사용할 값, 널인 경우 사용할 값)
SELECT
    empno,
    ename,
    sal,
    nvl2(comm, 'O', 'X'),
    sal + nvl2(comm, sal * 12 + comm, sal * 12)
FROM
    emp;

-- DECODE 함수와 CASE 문
-- decode( 대상이 될 열 혹은 데이터, 
--      조건 1, 조건 1과 일치 시 반환할 결과
--      조건 2, 조건 2와 일치 시 반환할 결과
--      조건 1 ~ 조건 n 까지 만족하지 않을 때 반환할 결과
-- )

-- job_id에 따라 비율을 다르게 준 다음 연산
SELECT
    empno,
    ename,
    job,
    sal,
    CASE job 
        WHEN 'MANAGER' THEN SAL*1.1
        WHEN 'SALESMAN' THEN SAL*1.05
        WHEN  'ANALYST' THEN SAL
        WHEN SAL*1.03 
        END AS upsal
FROM
emp;

SELECT
    empno,
    ename,
    job,
    sal,
    CASE
        WHEN comm IS NULL THEN
            ' 해당사항없음'
        WHEN comm = 0 THEN
            '수당없음'
    END AS comm_text
FROM
    emp;
    
-- [문제] EMP 테이블에서 월 평균 근무일수 21.5일 
-- 하루 급여(DAY_PAY), 시급(TIME_PAY)
-- day_paya 소수점 셋째자리에서 버리기
-- time_pay 소수점 둘째 자리에서 반올림
SELECT
    empno,
    ename,
    sal,
    trunc(sal / 21.5, 2)     AS day_pay,
    round(sal / 21.5 / 8, 1) AS time_pay
FROM
    emp;

-- EMP 테이블에서 입사일 기준으로 3개월이 지난 후 첫 월요일에 정직원이 됨
-- 정직원이 된 날짜 구하기
-- 추가수당을 조회할 때 NULL 인 경우는 N/A로 출력
SELECT
    empno,
    ename,
    hiredate,
    next_day(add_months(hiredate, 3), '월요일') AS r_job,
    nvl(to_char(comm), 'N/A') as comm
FROM
    emp;

SELECT
    comm,
    nvl(to_char(comm), 'N/A')    -- 에러 발생
FROM
    emp;


-- [문제] emp 테이블의 mgr 기준으로 출력
-- mgr 존재하지 않으면 0000
-- mgr 75인 경우 : 5555
-- mgr 76인 경우 : 6666
-- mgr 77인 경우 : 7777
-- mgr 78인 경우 : 8888
-- 그 외 원래대로 mgr 출력

select empno, ena,e, mgr, decode(substr(to_char(mgr),1,2) null, '0000', '75' '5555', '76', '6666', '77', '7777', '78', '8888', substr(to_char(mgr),1)) as chg_mgr from emp;

select empno, ename,
    case mgr is null then '0000'
    when mgr = ;
SELECT
    empno,
    ename,
    mgr,
    CASE
        WHEN mgr IS NULL THEN
            '0000'
        WHEN substr(to_char(mgr), 1, 2) = '75' THEN
            '5555'
        WHEN substr(to_char(mgr), 1, 2) = '76' THEN
            '6666'
        WHEN substr(to_char(mgr), 1, 2) = '77' THEN
            '7777'
        WHEN substr(to_char(mgr), 1, 2) = '88' THEN
            '8888'
        ELSE
            to_char(mgr)
    END AS chg_gr
FROM
    emp;

-- 다중행 함수
-- sum(), count(), max(), min(), avg()
SELECT
    SUM(comm)
FROM
    emp;

SELECT
    SUM(DISTINCT sal),
    SUM(sal)
FROM
    emp;

-- emp 테이블의 사원 수 출력
SELECT
    COUNT(*)
FROM
    emp;

-- 부서번호가 30인 사원 수 출력
SELECT
    COUNT(*)
FROM
    emp
WHERE
    deptno = 30;

-- 급여의 최대값
SELECT
    MAX(sal)
FROM
    emp;

-- 급여의 최소값
SELECT
    MIN(sal)
FROM
    emp;

-- 부서번호가 20번인 사원 중 제일 오래된 입사일 구하기
SELECT
    MIN(hiredate)
FROM
    emp
WHERE
    deptno = 20;

-- 부서번호가 20번인 사원 중 가장 최근 입사일 구하기
SELECT
    MAX(hiredate)
FROM
    emp
WHERE
    deptno = 20;

-- 부서번호가 30번인 사원들의 급여 평균 출력
SELECT
    round(AVG(sal))
FROM
    emp
WHERE
    deptno = 30;

-- 부서별 평균 급여 출력
SELECT
    deptno,
    AVG(sal)
FROM
    emp;

-- GROUP BY : 결과값을 원하는 열로 묶어 출력
SELECT
    deptno,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno;

-- 부서별, 직책별 급여 평균 출력
SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno,
    job
ORDER BY
    deptno,
    job;

-- group by : select 절에 group by 절에 포함 안되는 열은 사용 불가
SELECT
    ename,
    deptno,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno;

-- group by ~ having : 그룹을 잡을 떄 조건을 주는 경우

-- 각 부서의 직책별 평균 급여를 구하되, 평균 급여가 2000이상인 그룹만 출력
SELECT
    deptno,
    job,
    round(AVG(sal))
FROM
    emp
GROUP BY
    deptno,
    job
HAVING
    round(AVG(sal)) >= 2000;

--where : 출력 대상 행을 제한
--having : 그룹화된 대상을 제한

-- emp 테이블의 부서별 직책의 평균 급여가 500이상인 사원들의 부서번호, 직책, 
-- 평균급여를 출력
SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) >= 500
ORDER BY
    deptno,
    job;

SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno,
    job;

SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
WHERE
    sal <= 3000
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) >= 2000
ORDER BY
    deptno,
    job;

-- [문제] 부서별 평균급여, 최고급여, 최저급여, 사원수 출력
-- 평균급여는 소수점 제외
SELECT
    deptno,
    round(AVG(sal)) AS avg_sal,
    MAX(sal)        AS max_sal,
    MIN(sal)        AS min_sal,
    COUNT(empno)    AS cnt
FROM
    emp
GROUP BY
    deptno;

-- [문제] 같은 직책에 종사하는 사원이 3명 이상인 직책과 사원수 출력
SELECT
    job,
    COUNT(empno)
FROM
    emp
GROUP BY
    job
HAVING
    COUNT(job) >= 3;

-- [문제] 
SELECT
    to_char(hiredate, 'YYYY') AS hire_year,
    deptno,
    COUNT(*)                  AS cnt
FROM
    emp
GROUP BY
    to_char(hiredate, 'YYYY'),
    deptno;

-- join
-- 데이터가 여러 개의 테이블에 나뉘어 저장됨

-- 1) 내부조인 : 일치하는 컬럼을 기준으로 값 가져오기
-- ORA-00918: column ambiguously defined
SELECT
    empno,
    ename,
    e.deptno,
    dname,
    loc
FROM
    emp  e,
    dept d
WHERE
    e.deptno = d.deptno;

-- 표준문법 (inner 생략가능)
SELECT
    empno,
    ename,
    e.deptno,
    dname,
    loc
FROM
         emp e
    INNER JOIN dept d ON e.deptno = d.deptno;

-- 부서번호가 일치하면서
-- 급여가 3000 이상자만 출력
SELECT
    empno,
    ename,
    e.deptno,
    dname,
    loc
FROM
         emp e
    INNER JOIN dept d ON e.deptno = d.deptno
                         AND sal >= 3000;

-- 부서번호가 일치하는 사원들의 정보 출력
-- 급여가 2500 이하이고, 사원번호가 9999 이하인 사원 출력
SELECT
    e.empno,
    e.ename,
    e.deptno,
    d.dname,
    d.loc
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND e.sal <= 2500
        AND e.empno <= 9999;

SELECT
    e.empno,
    e.ename,
    e.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
                   AND e.sal <= 2500
                       AND e.empno <= 9999;

-- emp, salgrade 조인 : 비등가 조인
SELECT
    *
FROM
    salgrade;

SELECT
    empno,
    ename,
    job,
    sal,
    comm,
    deptno,
    grade
FROM
         emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal;

-- 자기자신 테이블 조인 : 셀프조인
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr = e2.empno;

-- outer join(외부조인)

select
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno as mgr_empno,
    e2.ename as mgr_ename
from
    emp e1 left outer join emp e2 on e1.mgr = e2.empno;
    

select
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno as mgr_empno,
    e2.ename as mgr_ename
from
    emp e1 right outer join emp e2 on e1.mgr =
e2.empno;
 
-- [문제] 각 부서별 평균급여, 최대급여, 최소급여, 사원수 출력
-- 부서코드, 부서명, 평균급여, 최대급여, 최소급여, 사원수
SELECT
    d.deptno,
    d.danme,
    round(AVG(sal)),
    MAX(sal),
    MIN(sal),
    COUNT(*)
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
GROUP BY
    d.deptno,
    d.danme;


-- [문제] 모든 부서정보와 사원 정보를 출력
-- (부서번호의 오름차순, 사원번호의 오름차순)
-- 부서번호, 부서명, 사원번호 사원명, 직책, 급여
select d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
from emp e join right outer
JOIN dept d ON e.deptno = d.deptno
order by d.deptno,
e.empno;

-- 세 개의 테이블 조인
SELECT
    e1.empno,
    e2.empno,
    e3.empno
FROM
         emp e1
    JOIN emp e2 ON e1.empno = e2.empno
    JOIN emp e3 ON e2.empno = e3.empno;

-- [문제] 모든 부서정보, 사원정보, 급여등급정보, 각 사원의 직속 상관의 정보 부서번호,
-- 사원번호 출력
SELECT
     d.detpno,
     d.dname,
     e1.empno,
     e1.ename,
     e1.mgr,
     e1.sal,
     e1.deptno as deptno_1,
     s.losal,
     s.hisal,
     s.grade,
     e2.empno as mgr_empno,
     e2.ename as mgr_ename
from emp e1 
    right outer join dept d on e1.deptno = d.deptno
    left outer join salgrade s on e1.sal between s.losal and s.hisal
    left outer join emp e2 on e1.mgr = e2.empno
order by d.deptno,
e1.empno;
     
     
-- 서브쿼리 : 쿼미 문 안에 또 다른 쿼리문 존재
-- select 조회할 열
-- from 테이블 명
-- where 조건식 (select 조회할 열 from 테이블명 where 조건식)

-- JONES 사원의 급여보다 높은 급여를 받는 사원 조회

-- JONES 사원의 급영
SELECT
    sal
FROM
    emp
WHERE
    ename = 'JONES';    -- 2975

SELECT
    *
FROM
    emp
WHERE
    sal > 2975;

SELECT
    *
FROM
    emp
WHERE
    sal > (
        SELECT
            sal
        FROM
            emp
        WHERE
            ename = 'JONES'
    );

-- ALLEN 사원의 추가수당보다 많은 추가수당을 받는 사원정보
SELECT
    *
FROM
    emp
WHERE
    comm > (
        SELECT
            comm
        FROM
            emp
        WHERE
            ename = 'ALLEN'
    );

-- 'WARD' 보다 빨리 입사한 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    hiredate < (
        SELECT
            hiredate
        FROM
            emp
        WHERE
            ename = 'WARD'
    );

-- 실행결과가 하나로 나오는 단일행 서브쿼리 사용 연산자
-- >, <, >=, <=, =, <>, ~=, != (같지않음)

-- 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는
-- 사원정보와 소속부서 정보를 조회
SELECT
    e.empno,
    e.ename,
    d.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        d.deptno = 20
    AND e.sal > (
        SELECT
            AVG(sal)
        FROM
            emp
    );

-- 실행결과가 여러개로 나오는 다중행 서브쿼리 사용 연산자
-- IN, ANY(SOME), ALL, EXISTS

SELECT * FROM EMP
WHERE DEPTNO IN (20,30);   -- DEPTNO가 20 이거나(OR) 30

-- IN : 메인쿼리의 데이터가 서브쿼리 결과 중 하나라도 일치한 데이터가 있다면 TRUE

-- 각 부서별 최고 급여와 동일한 급여를 받는 사원 정보 출력
SELECT
    *
FROM
    emp
WHERE
    sal IN (
        SELECT
            MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );

-- 각 부서별 최고 급여
SELECT
    MAX(sal)
FROM
    emp
GROUP BY
    deptno;

-- ANY(SOME) : 서브쿼리가 반환한 여러 결과 값 중에서 메인쿼리의 조건식 중 하나라도
-- TRUE 라면 메인쿼리 조건식을 TRUE로 반환

-- IN 	== 	= ANY
SELECT
    *
FROM
    emp
WHERE
    sal = ANY (
        SELECT
            MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );

-- 각 부서별 최고 급여보다 작은 급여를 받는 사원 정보 출력
SELECT
    *
FROM
    emp
WHERE
    sal < ANY (
        SELECT
            MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );

-- 30번 부서 사원드르이 최소 급여보다 많은 급여를 받는 사원 정보 출력
SELECT
    *
FROM
    emp
WHERE
    sal > ANY (
        SELECT
            SAL
        FROM
            emp
        GROUP BY
            deptno = 30
    );

-- ALL : 서브쿼리가 반환한 여러 결과 값을 메인 쿼리의 조건식이 모두 만족


SELECT
    *
FROM
    emp
WHERE
    sal < ALL (
        SELECT DISTINCT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );

-- 다중열 서브쿼리

-- 자신의 부서 내에서 최고 연봉과 동일한 급여를 받는 사원 출력
SELECT
    *
FROM
    emp
WHERE
    ( deptno, sal ) IN (
        SELECT
            deptno, MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );

-- FROM 절에 사용하는 서브쿼리(인라인뷰)
SELECT
    e10.empno,
    e10.ename,
    e10.deptno,
    d.dname,
    d.loc
FROM
    (
        SELECT
            *
        FROM
            emp
        WHERE
            deptno = 10
    ) e10,
    (
        SELECT
            *
        FROM
            dept
    ) d
WHERE
    e10.deptno = d.deptno;

-- [문제] 10번부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진
-- 사원정보, 부서정보를 출력 (NOT IN)
SELECT
    e.empno,
    e.ename,
    e.job,
    e.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        e.deptno = 10
    AND job NOT IN (
        SELECT
            job
        FROM
            emp
        WHERE
            deptno = 30
    );

-- [문제] 직책이 SALESMAN 인 사람들의 최고급여보다 높은 급여를 받는 사원들의
-- 사원정보, 급여 등급 정보를 출력
-- EMPNO, ENAME, SAL, GRADE 출력

-- MAX() 쓰는 형태
SELECT
    empno,
    ename,
    e.sal,
    s.grade
FROM
         emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
WHERE
    sal > (
        SELECT
            MAX(sal)
        FROM
            emp
        WHERE
            job = 'SALESMAN'
    );

-- MAX() 안쓰는 형태
SELECT
    empno,
    ename,
    e.sal,
    s.grade
FROM
         emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
WHERE
    sal > ANY (
        SELECT
            sal
        FROM
            emp
        WHERE
            job = 'SALESMAN'
    );

-- DML(데이터 조작어 : 삽입, 삭제, 수정)
-- COMMIT(커밋) : 데이터베이스에 최종 반영, 
-- ROLLBACK(롤백) : 지금 반영된 걸 최소

-- DEPT 테이블의 데이터를 추출하여 DEPT_TEMP 테이블 생성
CREATE TABLE dept_temp
    AS
        SELECT
            *
        FROM
            dept;

-- INSERT(삽입)
-- INSERT INTO 테이블명(열이름...)
-- VALUES(데이터...)

-- 문자, 날짜 데이터를 ''사용
INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    50,
    'DATABASE',
    'SEOUL'
);

INSERT INTO dept_temp VALUES (
    60,
    'NETWORK',
    'BUSAN'
);

INSERT INTO dept_temp (
    deptno,
    dname
) VALUES (
    70,
    'NETWORK'
);

--INSERT INTO DEPT_TEMP
--VALUES (800, 'NETWORK', 'BUSAN');

INSERT INTO dept_temp VALUES (
    80,
    'NETWORK',
    NULL
);

SELECT
    *
FROM
    dept_temp;

-- EMP 테이블의 구조만 복사해서 새로운 테이블 생성
CREATE TABLE emp_temp
    AS
        SELECT
            *
        FROM
            emp
        WHERE
            1 <> 1;

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    9999,
    '신짱구',
    'MANAGER',
    NULL,
    '2021-01-05',
    5000,
    1000,
    10
);

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    8888,
    '맹구',
    'MANAGER',
    9999,
    sysdate,
    4000,
    500,
    20
);

-- EMP 테이블에서 부서번호가 20번인 사원들만 EMP_TEMP에 삽입

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
)
    SELECT
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno
    FROM
        emp
    WHERE
        deptno = 20;

-- EMP 테이블에서 SALGRADE 테이블을 참조하여 등급이 1인 사원을 
-- EMP_TEMP에 추가하고 싶을 때
INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
)
    SELECT
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno
    FROM
             emp e
        JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
    WHERE
        s.grade = 1;


-- 수정
-- UPDATE 테이블명
-- SET 변경할 열 = 값, 변경할 열 = 값
-- [WHERE] 선택



-- LOC를 SEOUL로 변경
UPDATE dept_temp
SET
    loc = 'SEOUL';
-- WHERE 없으면 전체가 다 변경됨

-- DEPTNO=50인 경우에 LOC를 BUSAN으로 변경
UPDATE dept_temp
SET
    loc = 'BUSAN'
WHERE
    deptno = 50;

-- EMP_TEMP 사원 중 SAL 3000이하인 사원만 COMM 300으로 수정
UPDATE emp_temp
SET
    comm = 300
WHERE
    sal <= 3000;

-- UPDATE 서브쿼리
-- DEPT 테이블에서 부서번호가 40번인 부서명과 지역 추출

UPDATE dept_temp
SET
    ( dname,
      loc ) = (
        SELECT
            dname,
            loc
        FROM
            dept
        WHERE
            deptno = 40
    );

-- DNAME이 OPERATIONS인 부서번호 추출 : DEPT
-- 추출된 부서번호와 일치하는 부서번호의 지역을 'SEOUL'로 변경
UPDATE dept_temp
SET
    loc = 'SEOUL'
WHERE
    deptno = (
        SELECT
            deptno
        FROM
            dept
        WHERE
            dname = 'OPERATIONS'
    );

-- EMPNO=7369인 사원의 SAL 1500으로 변경
UPDATE emp_temp
SET
    sal = 1500
WHERE
    empno = 7369;



-- 삭제
-- DELETE [FROM]
-- [WHERE]

-- JOB이 ANALYST인 사원 삭제
DELETE FROM emp_temp
WHERE
    job = 'ANALYST';

DELETE emp_temp;    -- 내용만 없어짐

-- EMP_TEMP 에서 급여등급이 3이고, 20번부서의 사원만 삭제
DELETE FROM emp_temp
WHERE
    empno IN (
        SELECT
            empno
        FROM
                 emp_temp e
            JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
        WHERE
                s.grade = 3
            AND e.deptno = 20
    );


-- [문제] EXAM_EMP 생성
CREATE TABLE exam_emp
    AS
        SELECT
            *
        FROM
            emp;

-- [문제] EXAM_DEPT 생성
CREATE TABLE exam_dept
    AS
        SELECT
            *
        FROM
            dept;

-- [문제] EXAM_SALGRADE 생성
CREATE TABLE exam_salgrade
    AS
        SELECT
            *
        FROM
            salgrade;

-- 
INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7201,
    'TEST_USER1',
    'MANAGER',
    7788,
    '2016-01-02',
    4500,
    NULL,
    50
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7201,
    'TEST_USER2',
    'CLERK',
    7788,
    '2016-02-21',
    1800,
    NULL,
    50
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7201,
    'TEST_USER3',
    'ANALYST',
    7201,
    '2016-04-11',
    3400,
    NULL,
    60
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7201,
    'TEST_USER4',
    'SALESMAN',
    7201,
    '2016-05-31',
    2700,
    300,
    60
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7201,
    'TEST_USER5',
    'CLERK',
    7201,
    '2016-07-20',
    2600,
    NULL,
    70
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7201,
    'TEST_USER6',
    'CLERK',
    7201,
    '2016-07-20',
    2600,
    NULL,
    70
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7201,
    'TEST_USER7',
    'LECTURER',
    7201,
    '2016-10-28',
    2300,
    NULL,
    80
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7201,
    'TEST_USER8',
    'STUDENT',
    7201,
    '2018-03-09',
    1200,
    NULL,
    80
);



-- [실습3]
-- EXAM_EMP 에 속한 사원 중 50번 부서에서 근무하는 사원들의 평균급여보다 
-- 많은 급여를 받고 있는 사원들을 70번 부서로 옮기는 
--SQL문 작성하기
SELECT
    AVG(sal)
FROM
    exam_emp
WHERE
    deptno = 50;

UPDATE exam_emp
SET
    deptno = 70
WHERE
    sal >= (
        SELECT
            AVG(sal)
        FROM
            exam_emp
        WHERE
            deptno = 50
    );

-- [실습4]
-- EXAM_EMP에 속한 사원 중 60번 부서의 사원 중에서
-- 입사일이 가장 빠른 사원보다 늦게 입사한 사원의 급여를 10% 인상하고
-- 80번 부서로 옮기는 SQL문 작성하기
UPDATE exam_emp
SET
    sal = sal * 1.1,
    deptno = 80
WHERE
    hiredate > (
        SELECT
            MIN(hiredate)
        FROM
            exam_emp
        WHERE
            deptno = 60
    );

SELECT
    MIN(hiredate)
FROM
    exam_emp
WHERE
    deptno = 60;

-- [실습5]
-- EXAM_EMP에 속한 사원 중, 급여 등급이 5인 사원을 삭제하는 SQL문 작성하기
DELETE FROM exam_emp
WHERE
    empno IN (
        SELECT
            empno
        FROM
                 exam_emp e
            JOIN exam_salgrade ON e.sal BETWEEN s.losal AND s.hisal
        WHERE
            s.grade = 5
    );


select * from exam_emp;




SELECT
    *
FROM
    dept_temp;

ROLLBACK;   -- 돌려보내기

COMMIT;     -- 최종 반영하기

-- 트랜잭션 : 관계형 데이터베이스에서 하나의 작업 또는 밀접하게 관련되어 있는 
-- 작업수행을 위해 나눌 수 없는 최소 수행 단위

create table dept_tcl as select * from dept;

select * from dept_tcl;

-- 트랜잭션과 관련있는 명령어
insert into dept_tcl values(50, 'DATABASE', 'SEOUL');
update dept_tcl set loc='BUSAN' where deptno=40;
delete from dept_tcl where dname='RESEARCH';

-------- 하나의 트랜잭션
rollback;

commit;

-- 세션(session) : 어떤 활동을 위한 시간이나 기간
-- 데이터베이스 세션 : 데이터베이스 접속을 시작으로 여러 데이터베이스에서 
-- 작업을 수행한 후 접속 종료

delete from dept_tcl where deptno=50;

update dept_tcl set loc='SEOUL'
where deptno=30;

-- DDL(데이터 정의어) : 객체 생성(CREATE), 변경(ALTER), 삭제(DROP)

-- 테이블 생성
-- CREATE table 테이블명(
--    열이름 자료형, 
--    열이름 자료형,
--    열이름 자료형, 
--    ...);

-- 테이블명 규칙
-- 문자로 시작
-- 같은 사용자 소유의 테이블명 중복 불가
-- 영문자(한글 가능), 특수문자 가능($, #, _)
-- SQL 키워드(SELECT, DELETE ... )는 테이블명 사용 불가

-- 자료형
-- 문자 :
-- CHAR(n) - 고정길이 ex) name char(10); => 들어가는 글자가 3이어도 10을 잡음
-- VARCHAR2(n) - 가변길이 ex) name varchar2(10); => 들어가는 글자가 3이면 3만 잡음
--                                              => 메모리에 유연성
-- NCHAR(n) - 고정길이 (유니코드) ex) name nchar(10); 한글/영어 모두 10개의 문자
-- NVARCHAR(n) - 가변길이 (유니코드) 

-- 숫자형
-- NUMBER(숫자1, 숫자2) : 숫자1(자릿수), 숫자2(소수점자릿수)
-- ex) empno number(4) : 숫자로 4자리 허용
--     price number(7,2) : 숫자로 7자리 허용되는데 (소수점이 들어온다면 2자리 허용)
--     job number : 저장 데이터 크기에 맞게 자동 조절 (괄호 안에 숫자 안주면)

-- 날짜형
-- DATE : 년, 월, 일, 시, 분, 초
-- TIMESTAMP : 년, 월, 일, 시, 분, 초 + 밀리초 입력가능

-- table 생성
-- 구조 설계 후 테이블 생성하는 방법
create table emp_ddl (
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    mgr number(4),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2));

-- table 삭제
DROP TABLE emp_ddl;

-- 다른 테이블 구조 이용해서 생성(데이터까지 포함)
-- table 생성(ctrl+c, ctrl+v 개념)
CREATE TABLE emp_ddl
    AS
        SELECT
            *
        FROM
            emp;

-- 다른 테이블 구조만 이용해서 생성
-- table 생성(데이터 포함X)
CREATE TABLE emp_ddl1
    AS
        SELECT
            *
        FROM
            emp
        WHERE
            1 <> 1;

-- 테이블 변경 : ALTER
SELECT
    *
FROM
    emp_ddl;

-- 열(컬럼) 추가 : ADD
ALTER TABLE emp_ddl ADD hp VARCHAR2(20);

-- 열 이름을 변경 : RENAME
ALTER TABLE emp_ddl RENAME COLUMN hp TO tel;

-- 열 자료형 변경 : MODIFY
ALTER TABLE emp_ddl MODIFY
    empno NUMBER(5);

-- 데이터가 삽입되어 있을 때는 데이터의 길이와 밪지 않는다면 변경 불가
-- alter table emp_ddl modify empno number(3); -- 오류발생. 이미 데이터가 4자리로 들어가있었기 때문.

desc emp_ddl;

-- 열 삭제 : DROP COLUMN
ALTER TABLE emp_ddl DROP COLUMN tel;

-- 테이블 명 변경 : RENAME
RENAME emp_ddl TO emp_rename;

-- 테이블 삭제 : drop
DROP TABLE emp_rename;

CREATE TABLE emp_hw (
    id     CHAR(8),
    name   VARCHAR2(10),
    adddr  VARCHAR2(50),
    nation CHAR(4),
    email  VARCHAR2(50),
    age    NUMBER(7, 2)
);

desc emp_hw;

ALTER TABLE emp_hw ADD bigo VARCHAR2(20);

ALTER TABLE emp_hw MODIFY
    bigo VARCHAR2(30);

ALTER TABLE emp_hw RENAME COLUMN bigo TO remark;


-- 제약조건 (테이블의 특정 열에 지정)
-- 입력, 수정, 삭제 영향을 주는 부분 => 데이터의 무결성(정확성, 일관성) 유지
-- 1) NOT NULL : 지정한 열에 NULL 을 허용하지 않음
-- 2) UNIQUE : 지정한 열이 유일한 값을 가져야 함
-- 3) PRIMARY KEY : 지정한 열이 유일값이면서 NULL이 아님(하나만 지정)
-- 4) FOREIGN KEY : 다른 테이블의 열을 참조하여 존재하는 값만 입력 가능
-- 5) CHECK : 설정한 조건식을 만족하는 데이터만 입력 가능

-- NOT NULL 제약 조건
CREATE TABLE table_notnull (
    login_id  VARCHAR2(20) NOT NULL,
    login_pwd VARCHAR2(20) NOT NULL,
    tel       VARCHAR2(20)
);
    
-- insert into table_notnull (login_id, login_pwd, tel)
-- values ('test_id_01', null, '010-1234-5678');
-- cannot insert NULL into ("SCOTT"."TABLE_NOTNULL"."LOGIN_PWD")

-- insert into table_notnull (login_id, tel)
-- values ('test_id_01', '010-1234-5678');
-- cannot insert NULL into ("SCOTT"."TABLE_NOTNULL"."LOGIN_PWD")

INSERT INTO table_notnull (
    login_id,
    login_pwd
) VALUES (
    'test_id_01',
    '12345'
);
-- 1 행 이(가) 삽입되었습니다.
-- tel 은 null을 허용한 것.

UPDATE table_notnull
SET
    login_pwd = NULL
WHERE
    login_id = 'test_id_01';
-- cannot update ("SCOTT"."TABLE_NOTNULL"."LOGIN_PWD") to NULL

-- scott가 사용한 모든 제약조건 확인
SELECT
    *
FROM
    user_constraints;

-- 제약조건명 지정
CREATE TABLE table_notnull2 (
    login_id  VARCHAR2(20)
        CONSTRAINT tblnn2_lgnid_nn NOT NULL,
    login_pwd VARCHAR2(20)
        CONSTRAINT tblnn2_lgnpwd_nn NOT NULL,
    tel       VARCHAR2(20)
);

-- table_notnull tel 컬럼을 not null 제약 조건 추가
desc table_notnull;

SELECT
    *
FROM
    table_notnull;

ALTER TABLE table_notnull MODIFY (
    tel NOT NULL
); -- 이미 tel이 null인  것이 있어서 오류 발생

UPDATE table_notnull
SET
    tel = '010-1234-1234'
WHERE
    login_id = 'test_id_01';

-- 제약조건 이름 변경
alter table table_notnull2 rename constraint tblnn2_lgnid_nn
to tblnn2_id_nn;

-- 제약조건 삭제
alter table table_notnull2 drop constraint tblnn2_id_nn;

-- 2) UNIQUE : 지정한 열이 유일한 값을 가져야 함(null 제외)
-- null은 들어갈 수 있음
create table table_unique (
    login_id varchar2(20) unique,
    login_pwd varchar2(20) not null,
    tel varchar2(20) 
);

INSERT INTO table_unique (
    login_id,
    login_pwd,
    tel
) VALUES (
    'test_id_01',
    '12345',
    '010-1234-1234'
);

-- unique constraint (SCOTT.SYS_C007026) violated
-- login_id가 중복되면 안되는데 중복돼서 오류 발생
INSERT INTO table_unique (
    login_id,
    login_pwd,
    tel
) VALUES (
    'test_id_01',
    '54321',
    '010-4321-4321'
);

INSERT INTO table_unique (
    login_id,
    login_pwd,
    tel
) VALUES (
    null,
    '54321',
    '010-4321-4321'
);

-- unique 제약조건 이름 지정
create table table_unique2 (
    login_id varchar2(20) constraint tblunq2_lgnid_unq unique,
    login_pwd varchar2(20) constraint tblunq2_lgnpwd_nn not null,
    tel varchar2(20) 
);

-- table_unique2의 tel unique 제약조건 추가
alter table table_unique2 modify(tel not null);

-- 3) PRIMARY KEY : 지정한 열이 유일값이면서 NULL이 아님(하나만 지정)
-- not null + unique
-- 각 행을 식별하는 용도***
--create table table_pk(
--    login_id varchar2(20) primary key,
--    login_pwd varchar2(20)  not null,
--    tel varchar2(20));

insert into table_pk values('test_01', 'pw_01', '010-1234-1234');

-- unique constraint violated
insert into table_pk values('test_01', 'pw_01', '010-1234-1234');

-- table can have only one primary key (하나의 테이블에는 하나의 pk만 가능)
--create table table_pk2(
--    login_id varchar2(20) primary key,
--    login_pwd varchar2(20)  primary key,
--    tel varchar2(20));

create table table_pk2(
    login_id varchar2(20) constraint tblpk2_lgnid_pk primary key,
    login_pwd varchar2(20) constraint tblpk2_lgnpw_nn not null,
    tel varchar2(20));

-- 제약조건 지정시 다른 방식
create table table_con(
    col1 varchar2(20),
    col2 varchar2(20),
    primary key(col1),
    constraint tblcon_unq_unique(col2));

-- 4) FOREIGN KEY : 다른 테이블의 열을 참조하여 존재하는 값만 입력 가능
CREATE TABLE dept_fk (
    deptno NUMBER(2)
        CONSTRAINT deptfk_deptno_pk PRIMARY KEY,
    dname  VARCHAR2(20),
    loc    VARCHAR2(13)
);

CREATE TABLE emp_fk (
    empno  NUMBER(4)
        CONSTRAINT empfk_empno_pk PRIMARY KEY,
    ename  VARCHAR2(10),
    deptno NUMBER(2)
        CONSTRAINT empfk_deptno_fk
            REFERENCES dept_fk ( deptno )
);

-- parent key not found
INSERT INTO emp_fk (
    empno,
    ename,
    deptno
) VALUES (
    7899,
    'hong',
    20
);

-- 외래키 수행 순서
-- 부모 테이블에 데이터가 먼저 삽입되어야 함
-- 자식테이블 데이터 삽입

INSERT INTO dept_fk VALUES (
    10,
    'DATABASE',
    'SEOUL'
);

INSERT INTO emp_fk (
    empno,
    ename,
    deptno
) VALUES (
    7899,
    'hong',
    10
);

-- child record found
DELETE FROM dept_fk
WHERE
    deptno = 10;

-- 외래키 삭제 수행 순서
-- 자식 테이블에 해당하는 데이터 삭제
-- 부모 테이블에 해당하는 데이터 삭제

DELETE FROM emp_fk
WHERE
    deptno = 10;

DELETE FROM dept_fk
WHERE
    deptno = 10;


-- 부모 데이터를 삭제할 때 참조하고 있는 데이터도 함께 삭제
-- 부모 데이터를 삭제할 때 참조하고 있는 데이터를 null로 수정
CREATE TABLE dept_fk2 (
    deptno NUMBER(2)
        CONSTRAINT deptfk2_deptno_pk PRIMARY KEY,
    dname  VARCHAR2(20),
    loc    VARCHAR2(13)
);

-- ON DELETE CASCADE : 열 데이터 삭제 시 참조 데이터 함께 삭제
CREATE TABLE emp_fk2 (
    empno  NUMBER(4)
        CONSTRAINT empfk2_empno_pk PRIMARY KEY,
    ename  VARCHAR2(10),
    deptno NUMBER(2)
        CONSTRAINT empfk2_deptno_fk
            REFERENCES dept_fk2 ( deptno )
                ON DELETE CASCADE
);     -- 자식테이블한테 ON DELETE CASCADE

INSERT INTO dept_fk2 VALUES (
    10,
    'DATABASE',
    'SEOUL'
);

INSERT INTO emp_fk2 (
    empno,
    ename,
    deptno
) VALUES (
    7899,
    'hong',
    10
);

DELETE FROM dept_fk2
WHERE
    deptno = 10;

SELECT
    *
FROM
    emp_fk2;

-- ON DELETE SET NULL : 열 데이터 삭제시 참조 데이터를 NULL로 수정
CREATE TABLE dept_fk3 (
    deptno NUMBER(2)
        CONSTRAINT deptfk3_deptno_pk PRIMARY KEY,
    dname  VARCHAR2(20),
    loc    VARCHAR2(13)
);

CREATE TABLE emp_fk3 (
    empno  NUMBER(4)
        CONSTRAINT empfk3_empno_pk PRIMARY KEY,
    ename  VARCHAR2(10),
    deptno NUMBER(2)
        CONSTRAINT empfk3_deptno_fk
            REFERENCES dept_fk2 ( deptno )
                ON DELETE SET NULL
);   

INSERT INTO dept_fk3 VALUES (
    10,
    'DATABASE',
    'SEOUL'
);

INSERT INTO emp_fk3 (
    empno,
    ename,
    deptno
) VALUES (
    7899,
    'hong',
    10
);

DELETE FROM dept_fk3
WHERE
    deptno = 10;

SELECT
    *
FROM
    emp_fk3;

select * from emp_fk3;

-- 5) CHECK : 설정한 조건식을 만족하는 데이터만 입력 가능
create table tbl_check(
    login_id varchar2(20) constraint tblck_lgnid_pk primary key,
    login_pwd varchar2(20) constraint tblck_lgnpwd_ck check (length(login_pwd)>3),
    tel varchar(20));

-- check constraint violated
insert into tbl_check values('test_id1', '123', '010-1234-1234');

insert into tbl_check values('test_id1', '1234', '010-1234-1234');

-- 기본값 지정 : default
create table tbl_default(
    login_id varchar2(20) constraint tbl_lgnid_pk primary key,
    login_pwd varchar2(20) default '1234',
    tel varchar(20));

insert into tbl_default values('test_id1', null, '010-1234-1234');

select * from tbl_default;

insert into tbl_default (login_id, tel)
values('test_id2', '010-1234-1234');

-- 값을 명시하면 명시된 값이 들어가고,
-- 칼럼을 비워두고 아무 것도 안넣으면 기본값이 들어감


-- [실습] dept_const 테이블 생성
create table dept_const(
    deptno number(2) constraint deptconst_deptno_pk primary key,
    dname varchar2(14) constraint deptconst_deptno_unq unique,
    loc varchar2(13) constraint deptconst_loc_nn not null);

--create table dept_const(
--    deptno number(2),
--    dname varchar2(14),
--    loc varchar2(13),
--    constraint deptconst_deptno_pk primary key(deptno),
--    constraint deptconst_deptno_unq unique(dname),
--    constraint deptconst_loc_nn not null(loc));


-- [실습]
CREATE TABLE emp_const (
    empno number(2) constraint empconst_empno_pk primary key,
    ename varchar2(10) constraint empconst_ename_nn not null,
    job varchar2(9),
    tel varchar2(20) constraint empconst_tel_unq unique,
    hiredate date,
    sal number(7,2) constraint empconst_sal_chk check (sal between 1000 and 9999),
    comm number(7,2),
    deptno number(2) constraint empconst_deptno_fk references dept_const(deptno));
    
commit;

-- 시퀀스(sequence) : 규칙에 따라 순번을 생성

-- 가장 기본 형태의 번호 생성기(1씩 증가)
create sequence dept_seq;

create table dept_sequence as select * from dept where 1<>1;

select * from dept_sequence;

insert into dept_sequence(deptno, dname, loc)
values (dept_seq.nextval,'DATABASE', 'SEOUL');

-- 가장 마지막으로 생성된 시퀀스 확인
select dept_seq.currval from dual;

-- sequence 삭제
drop sequence dept_seq;

create sequence dept_seq
increment by 10 -- 시퀀스에서 생성할 번호의 증가값
start with 10   -- 시퀀스에서 생성할 번호의 시작값
maxvalue 90 -- 시퀀스에서 생성할 번호의 최댓값
minvalue 0  -- 시퀀스에서 생성할 번호의 최솟값(시작값하고 같다?)
nocycle     -- 시퀀스에서 생성한 번호가 최댓값에 도달할 경우 다시 시작할 것인가 여부 (cycle or nocycle)
cache 2;    -- 시퀀스가 생성할 번호를 메모리에 미리 할당해 놓은 수를 지정

insert into dept_sequence(deptno, dname, loc)
values (dept_seq.nextval,'DATABASE', 'SEOUL');

select * from dept_sequence;

-- 시퀀스 수정
alter sequence dept_seq 
increment by 3 
maxvalue 99 
cycle;

insert into dept_sequence(deptno, dname, loc)
values (dept_seq.nextval,'DATABASE', 'SEOUL');


-- 뷰(view) : 가상 테이블
--           하나 이상의 테이블을 조회하는 select 문을 저정한 객체
--           편리성 - select 문의 복잡도를 완화
--           보안성 - 테이블의 특정 열을 노출하고 싶지 않은 경우

-- 생성
create view vm_emp20 
as (select empno, ename, job, deptno 
from emp 
where deptno=20); 

select * from vm_emp20;

-- insert
insert into vm_emp20(empno, ename, job, deptno)
values(8000,'TEST','MANAGER',20);

-- view와 원본테이블 연결 여부
select * from emp;

-- 생성된 뷰들의 속성 확인하기
select * 
from USER_UPDATABLE_COLUMNS
where TABLE_NAME='VM_EMP20';

-- 뷰 생성시 원본 데이터 수정 불가하도록 작성
-- with read only : 뷰의 열람만을 허용. view의 수정을 허락하지 않음.
create view vm_emp_read 
as select empno, ename, job from emp with read only;

select * 
from USER_UPDATABLE_COLUMNS
where TABLE_NAME='VM_EMP_READ';

insert into vm_emp_read(empno, ename, job)
values(8001,'TEST','MANAGER');

-- 뷰 삭제
drop view vm_emp20;
drop view vm_emp_read;

-- 인덱스 : 빠른 검색
-- 인덱스 사용 여부에 따라 Table Full Scan, Index Scan
-- 인덱스X -> Table Full Scan
-- 인덱스O -> Index Scan

-- scott가 가지고 있는 인덱스 확인하기
select * from user_indexes; -- pk 설정된 값들은 인덱스로 사용됨

-- 인덱스 생성
-- create index 인덱스명 on 테이블명(열이름1 asc, 열이름2 desc, ....)
create index idx_emp_sal on emp(sal);
-- 인덱스 이름 : idx_emp_sal
-- emp 테이블에서
-- sal 을 기준으로 잡겠다.

-- index가 설정된 컬럼 조회
select * from user_ind_columns;

select * from emp where deptno=20;

-- index 삭제
drop index idx_emp_sal;


