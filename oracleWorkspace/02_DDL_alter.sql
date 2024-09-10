-- ALTER 구문 연습
-- ALTER TABLE 테이블명 ADD 추가될 칼럼명 칼럼 타입 : 새로운 열 추가
ALTER TABLE student ADD stdTel VARCHAR2(13);
-- 테이블의 상세 정보 확인
DESCRIBE student;
-- 여러 개의 열을 한 번 추가 : stdAge, stdAddress2
AlTER TABLE student ADD (stdAge VARCHAR(2), stdAddress2 VARCHAR2(50));
DESCRIBE student;
-- ALTER TABLE 테이블명 MODIFY 칼럼명 바꿀 데이터 타입 : 데이터 형식, 제약 조건 변경
-- 데이터 타입 변경 시에는 기존 데이터 저장되어있을 때 데이터의 형식 변경이 가능한지 반드시 확인
ALTER TABLE student MODIFY stdAge INT;
DESCRIBE student;
-- ALTER TABLE 테이블명 RENAME COLUMN 변경 전 이름 TO 변경 후 이름 : 열 이름 변경
-- 열 이름 변경하면서 데이터 타입을 같이 적으면 오류
-- stdTel -> stdHP
ALTER TABLE student RENAME COLUMN stdTel TO stdHP;
DESCRIBE student;
-- ALTER TABL 테이블명 DROP COLUMN 삭제할 열 이름 : 열 삭제 : 공간도 삭제
-- 열 1개 삭제(stdHP)
ALTER TABLE student DROP COLUMN stdHP;
DESCRIBE student;
-- ALTER TABLE 테이블명 DROP (열1, 열2, 열3, ..., 열n): 여러 열 삭제
ALTER TABLE student DROP (stdAge, stdAddress2);
DESCRIBE student;
-- ALTER TABLE 테이블명 MODIFY 칼럼명 바꿀 [데이터 타입] 제약 조건 : 제약 조건 변경
-- 열의 제약 조건 변경 stdName 칼럼 NOT NULL -> NULL
ALTER TABLE student MODIFY stdName NULL;
DESCRIBE student;
-- 테이블 ALTER 연습 문제
-- product 테이블에 숫자 값을 갖는 prdStock과 제조일을 나타내는 prdDate 열 추가
-- int == NUMBER(38)
ALTER TABLE product ADD (prdStock int, prdDate date);
DESCRIBE product;
-- product 테이블의 prdCompany열을 NOT NULL로 변경
-- 제약 조건 변경은 제약 조건만 언급해도 가능
ALTER TABLE product MODIFY prdCompany NOT NULL;
DESCRIBE product;
-- publisher 테이블에 pubPhone, pubAddress열 추가
ALTER TABLE publisher ADD (pubPhone VARCHAR2(20), pubAddress VARCHAR2(30));
DESCRIBE publisher;
-- publisher 테이블에서 pubPhone열 삭제
ALTER TABLE publisher DROP COLUMN pubPhone;
DESCRIBE publisher;
-- 한 문장씩 실행
-- 테이블 새로 고침 하고 결과 확인
-----------------------------------------------------------------------------------
-- 기본 키 / 외래 키 제약 조건 추가 및 삭제
-- 없을 수 있어서 실행하는 코드이므로 확인만 하고 SKIP
ALTER TABLE department2 ADD CONSTRAINT PK_department_depNo PRIMARY KEY (dptNo);
ALTER TABLE student2 ADD CONSTRAINT FK_student_department FOREIGN KEY (dptNo) REFERENCES department(dptNo);
-------------------------------------------------------------------------------------
-- 기본 키 제약 조건 삭제
-- ALTER TABLE 테이블명 DROP PRIMARY KEY;
-- department2 테이블의 기본 키 삭제
ALTER TABLE department2 DROP PRIMARY KEY;
-- ORA-02273 : 고유/기본 키가 외부 키에 의해 참조되었습니다
-- department2 테이블을 student2, professor 테이블이 외래 키로 참조하고 있음
-- 이런 경우 기본 키 제거하면 무결성 제약 조건을 위배하게 됨 - 외래 키는 다른 테이블의 기본 키를 참조해야 함(즉, 참조되는 테이블은 기본 키를 삭제하면 안 된다)
-- 기본 키 삭제하려면 테이블을 참고하고 있는 다른 테이블의 외래 키를 삭제한 후에 참조되는 테이블의 기본 키를 삭제할 수 있음
-- 외래 키 제약 조건 삭제 : 외래 키명이 필요
-- ALTER TABLE 테이블명 DROP CONSTRAINT 외래 키명;
-- student2, professor 테이블의 외래 키 제약 조건 삭제
-- 외래 키명이 필요한데 명시적으로 부여하지 않은 경우에는 시스템이 만든 외래 키명을 확인해서 삭제해야 함
-- 외래 키명 확인 방법1. 테이블 편집기에서 확인 가능
-- SYS_C008397 편집기에서 확인한 외래 키명
ALTER TABLE student2 DROP CONSTRAINT SYS_C008397;
-- 외래 키명 확인 방법2. 쿼리 구문 이용(모든 테이블의 제약 조건은 시스템용 테이블인 user_constraints에 저장되어있음
SELECT * FROM user_constraints WHERE table_name = 'STUDENT2';
-- professor 테이블의 외래 키 삭제
-- 외래 키명 확인 : SYS_C008402
SELECT * FROM user_constraints WHERE table_name = 'PROFESSOR';
ALTER TABLE professor DROP CONSTRAINT SYS_C008402;
SELECT * FROM user_constraints WHERE table_name = 'PROFESSOR';
-- department2 테이블을 참조하는 외래 키를 모두 삭제했으므로 기본 키 삭제
ALTER TABLE department2 DROP PRIMARY KEY;
SELECT * FROM user_constraints WHERE table_name = 'DEPARTMENT2';
-------------------------------------------------------------------------------------------------------
-- 기본 키 제약 조건 추가
-- 기본 키나 외래 키 제약 조건은 관리하려면 제약 조건명이 있는 게 효율적임
-- department2 기본 키 추가
-- 방법1. ALTER TABLE 테이블명 ADD PRIMARY KEY (기본 키 열 이름) : 제약 조건명을 시스템이 부여
ALTER TABLE department2 ADD PRIMARY KEY (dptNo);
SELECT * FROM user_constraints WHERE table_name = 'DEPARTMENT2';
-- 방법2. ALTER TABLE 테이블명 ADD CONSTRAINT 기본 키명 PRIMARY KEY (기본 키 열 이름) : 개발자가 제약 조건명을 명시
-- pk_테이블명_칼럼명
ALTER TABLE department2 ADD CONSTRAINT pk_department2_dptNo PRIMARY KEY (dptNo);
SELECT * FROM user_constraints WHERE table_name = 'DEPARTMENT2';
-- 외래 키 제약 조건 추가
-- student2/professor 테이블의 외래 키 제약 조건 추가
-- fk_현재 테이블_참조 테이블
-- 방법1. ALTER TABLE 테이블명 ADD CONSTRAINT 외래 키명 FOREIGN KEY (외래 키 열 이름) REFERENCES 참조 테이블명(기본 키 열 이름)
ALTER TABLE student2 ADD CONSTRAINT fk_student2_department2 FOREIGN KEY (dptNo) REFERENCES department2(dptNo);
SELECT * FROM user_constraints WHERE table_name = 'STUDENT2';
-- 방법2. ALTER TABLE 테이블명 ADD FOREIGN KEY (외래 키 열 이름) REFERENCES 참조 테이블명(기본 키 열 이름)
ALTER TABLE professor ADD FOREIGN KEY (dptNo) REFERENCES department2(dptNo);
SELECT * FROM user_constraints WHERE table_name = 'PROFESSOR';
------------------------------------------------------------------------------------------
-- ON DELETE CASCADE
-- 참조되는 테이블인 부모 테이블(기본 키 테이블)의 데이터가 삭제되었을 때 
-- 참조하는 외래 키 테이블의 데이터도 자동으로 삭제되도록 설정
-- 연습
-- student2 테이블의 제약 조건 삭제
ALTER TABLE student2 DROP CONSTRAINT fk_student2_department2;
-- student2 테이블의 FOREIGN KEY 제약 조건을 추가(옵션으로 ON DELETE CASCADE 추가)
ALTER TABLE student2 ADD CONSTRAINT fk_student2_department2 FOREIGN KEY (dptNo) REFERENCES department2(dptNo) ON DELETE CASCADE; -- 참조되는 테이블의 데이터가 삭제되면 현재 테이블의 데이터도 삭제
-- ON DELETE CASCADE로 설정한 외래 키 제약 조건의 동작 확인
-- 데이터 삭제 시 일어나는 상황 확인
INSERT ALL INTO department2 (dptNo, dptName, dptTel) VALUES ('001', '경영학과', '02-111-1111') INTO department2(dptNo, dptName, dptTel) VALUES ('002', '기계공학과', '02-222-2222') INTO department2(dptNo, dptName, dptTel) VALUES ('003', '컴퓨터공학과', '02-333-3333') SELECT *  FROM dual;
INSERT ALL INTO student2 VALUES ('2023001', '홍길동', 3, '서울', '1999-01-01', '002') INTO student2 VALUES ('2023002', '이몽룡', 1, '서울', '2001-05-03', '001') INTO student2 VALUES ('2023003', '성춘향', 4, '서울', '1996-10-10', '003') SELECT * FROM dual;
 -- department2 테이블이 student2가 참조하고 있기 때문에 레코드가 삭제되면 참조하고 있는 테이블에서 문제가 생김
 -- 단, CASCADE 조건이 외래 키에 들어가있으면 
 -- 현재 레코드가 참조하는 기본 키 데이터가 삭제되면 현재 레코드도 삭제하라는 옵션
 DELETE FROM department2 WHERE dptNo = '001'; -- dptNo가 001인 인스턴스(, 튜플, 레코드)를 삭제
 -- 기본 키 001을 참조하는 레코드가 student2 테이블에 있으므로 확인
 SELECT * FROM student2;