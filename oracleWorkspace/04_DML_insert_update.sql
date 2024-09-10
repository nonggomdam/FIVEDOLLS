-- 데이터 조작어 : DML(DATA MANAGEMENT LANGUAGE)
-- INSERT
-- UPDATE
-- DELETE
-- SELECT
-- 연습용 테이블 생성
CREATE TABLE publisher (
    pubNo VARCHAR(10) NOT NULL PRIMARY KEY,
    pubName VARCHAR(30) NOT NULL
);
CREATE TABLE book (
    bookNo VARCHAR(10) NOT NULL PRIMARY KEY,
    bookName VARCHAR(30) NOT NULL,
    bookAuthor VARCHAR(30),
    bookPrice INT DEFAULT 10000 CHECK (bookPrice > 1000),
    bookDate DATE,
    pubNo VARCHAR(10) NOT NULL,
    
    CONSTRAINT FK_book_publisher FOREIGN KEY (pubNo) REFERENCES publisher(pubNo)
);
-- INSERT문 기본 형식
-- 형식1. INSERT INTO 테이블명(열 이름 리스트) VALUES (값 리스트);
-- 열 이름 리스트와 값 리스트의 순서는 동일
-- 열 이름 리스트에 해당하는 열에만 값을 저장(부분 저장이 가능, NULL 허가되는 칼럼은 제외될 수 있음)
-- publisher 테이블에 데이터 입력
-- SQL에서 문자열 표현은 ''를 사용함
-- SQL 오류 : ORA-00984 : 열을 사용할 수 없습니다
-- 00984. 00000 - "column not allowed here" - 칼럼에 값을 넣으려고 할 때 해당 칼럼이 거부함 : "" 이용한 경우 주로 나오는 에러
INSERT INTO publisher(pubNo, pubName) VALUES ('001', '서울 출판사');
-- INSERT INTO publisher(pubName, pubNo) VALUES ('002', '강남 출판사');
-- SQL 오류 : ORA-12899 : "C##DML_SQL"."PUBLISHER"."PUBNO" 열에 대한 값이 너무 큼(실제 : 16, 최대값 : 10) 두 칼럼 모두 문자열이어서 칼럼에 지정된 
-- 크기 문제가 없었으면 저장되었을 것임, '강남 출판사'가 16byte인데 10byte에 저장하려니 에러가 발생
-- 값 리스트의 순서가 잘못되어서 에러 발생
INSERT INTO publisher(pubName, pubNo) VALUES ('강남 출판사', '002'); -- 열 이름과 값의 순서를 맞춰서 저장
INSERT INTO publisher(pubNo, pubName) VALUES ('003', '종로 출판사');
-- 1개의 칼럼에만 값을 저장
-- INSERT INTO publisher(pubNo) VALUES ('003');
-- ORA-01400 : NULL을 ("C##DML_SQL"."PUBLISHER"."PUBNAME") 안에 삽입할 수 없습니다
-- 칼럼 pubName이 NULL을 허용하지 않아서 발생되는 에러
-- 칼럼이 NULL을 허용하면 값을 안 넣을 수 있다
-- publisher 테이블 내용 조회 : SELECT 칼럼명들 FROM 테이블명;
-- * : ALL을 의미, 모든 칼럼
SELECT * FROM publisher;
-- book 테이블 생성 후 값을 입력
-- book 테이블에 값을 입력
INSERT INTO book(bookNo, bookName, bookAuthor, bookPrice, bookDate, pubNo) VALUES ('1', '자바', '홍길동', 20000, '2022-10-10', '001');
-- 형식2. INSERT INTO 테이블명 VALUES (값 리스트);
-- 모든 칼럼에 데이터를 저장(NULL값 허가 여부와 상관 없이 모든 칼럼의 값을 값 리스트에서 표현해야 함)
-- 칼럼 LIST를 생략할 때에는 값의 순서를 테이블 생성할 때 작성했던 칼럼 순서에 맞춰줘야 함
-- 생성에 관여하지 않은 경우에는 SELECT문으로 출력되었을 때 나오는 칼럼 순서에 맞춰줌
INSERT INTO book VALUES ('2', '자바스크립트', '이몽룡', 23000, '2019-11-10', '003');
-- book 테이블 입력 결과 확인
SELECT * FROM book;
-- 여러 개의 데이터를 한 번에 INSERT : DBMS마다 다름
-- 표준 SQL : INSERT ALL INTO 
-- 오라클 : INSERT ALL INTO 테이블명(칼럼 리스트) VALUES (값 리스트) INTO 테이블명(칼럼 리스트) VALUES (값 리스트) INTO 테이블명(칼럼 리스트) VALUES (값 리스트) SELECT * FROM DUAL;
-- dual 테이블 : 1개의 행과 1개의 열만 있는 dummy 테이블, SYSTEM 소유 테이블이지만 모든 사용자가 접근 가능
-- dual 테이블 용도 : 간단한 함수의 계산 결과값을 확인할 때, 여러 값을 입력할 때 입력 결과를 받기 위한 더미 테이블로 사용
INSERT ALL INTO book(bookNo, bookName, bookAuthor, bookPrice, bookDate, pubNo) VALUES ('3', '데이터베이스', '성춘향', 35000, '2021-05-12', '002') INTO book(bookNo, bookName, bookAuthor, bookPrice, bookDate, pubNo) VALUES ('4', '알고리즘', '변학도', 28000, '2022-07-12', '003') INTO book (bookNo, bookName, bookAuthor, bookPrice, bookDate, pubNo) VALUES ('5', '웹 프로그래밍', '강길동', 33000, '2023-02-20', '002') SELECT * FROM dual;
-- 또는(모든 열에 데이터를 입력하는 경우 칼럼 리스트 생략 가능)
INSERT ALL INTO book VALUES ('6', '데이터베이스', '성춘향', 35000, '2021-05-12', '002') INTO book VALUES ('7', '알고리즘', '변학도', 28000, '2022-07-12', '003') INTO book VALUES ('8', '웹 프로그래밍', '강길동', 33000, '2023-02-20', '002') SELECT * FROM dual;
-- book 테이블 내용 조회
SELECT * FROM book;
--------------------------------------------------------------------------
-- INSERT문 연습 문제
-- DMLSQL DB에 학과/학생 테이블 생성하고 
-- INSERT문 사용하여 데이터 입력
-- 데이터 입력 순서
-- department 테이블에 먼저 입력하고 
-- student 테이블에 입력
-- 학과 테이블
DROP TABLE department;
CREATE TABLE department (
    dptNo VARCHAR(10) NOT NULL PRIMARY KEY,
    dptName VARCHAR(30) NOT NULL,
    dptTel VARCHAR(13) NOT NULL
);
INSERT INTO department(dptNo, dptName, dptTel) VALUES ('001', '경영학과', '02-111-1111');
INSERT INTO department VALUES ('002', '기계공학과', '02-222-2222');
INSERT INTO department VALUES ('003', '컴퓨터공학과', '02-333-3333');
-- 학생 테이블
DROP TABLE student;
CREATE TABLE student (
    stdNo VARCHAR(10) NOT NULL PRIMARY KEY,
    stdName VARCHAR(30) NOT NULL,
    stdYear INT DEFAULT 4 CHECK (stdYear >= 1 AND stdYear <= 4),
    stdAddress VARCHAR(30),
    stdBirth DATE,
    dptNo VARCHAR(10) NOT NULL,
    
    FOREIGN KEY (dptNo) REFERENCES department(dptNo)
);
INSERT INTO student(stdNo, stdName, dptNo) VALUES ('2023001', '홍길동', '002');
SELECT * FROM student;
INSERT ALL INTO student VALUES ('2023002', '이몽룡', 1, '서울시', '2021-05-03', '001') INTO student VALUES ('2023003', '성춘향', 4, '경기도', '1996-10-10', '003') SELECT * FROM dual;
INSERT ALL INTO student VALUES ('2016002', '변학도', 4, '서울시', '1955-05-07', '001') INTO student VALUES ('2023003', '손흥민', 3, '경기도', '1997-11-11', '002') SELECT * FROM dual;
---------------------------------------------
-- 시퀀스(오라클이 제공하는 객체) : 테이블로 제공됨 
-- 데이터베이스 객체로 유일한 값으로 일련 번호 생성
-- 지정된 수치로 증가하거나 감소
-- 기본 키값을 일련 번호로 자동 생성할 때 사용
-- 최대 15개까지 생성 가능
-- 일반 테이블과 독립적으로 저장되고 생성
-- 하나의 시퀀스를 여러 테이블에서 사용 가능
-- 기본 문법
-- CREATE SEQUENCE 시퀀스명 START WITH 시작값 INCREMENT BY 증가감값(+/-) MAXVALUE 최대값 MINVALUE 최소값 NOCYCLE/CYCLE; -- 순회 여부
-- 시퀀스 생성하고 테이블에 칼럼값으로 설정하는 연습
CREATE SEQUENCE num_seq START WITH 1 INCREMENT BY 1 MAXVALUE 1000 MINVALUE 1 NOCYCLE;
-- 시퀀스 적용할 테이블 생성
CREATE TABLE board (
    bNo NUMBER PRIMARY KEY,
    bSubject VARCHAR2(30) NOT NULL,
    bName VARCHAR2(20) NOT NULL,
    bContent VARCHAR2(200)
);
-- 게시글 번호가 bNo값은 자동 생성되도록 시퀀스 사용
-- 시퀀스 사용 시 입력 데이터값으로 사용 : 시퀀스명.NEXTVAL
INSERT INTO board VALUES (num_seq.NEXTVAL, '추석', '홍길동', '추석');
INSERT INTO board VALUES (num_seq.NEXTVAL, '추석', '홍길동', '추석');
INSERT INTO board VALUES (num_seq.NEXTVAL, '추석', '홍길동', '추석');
INSERT INTO board VALUES (num_seq.NEXTVAL, '추석', '홍길동', '추석');
-- board 테이블 검색
SELECT * FROM board;
-- 현재 시퀀스값 검색(현재 진행되어져서 최종 사용된 시퀀스 VALUE 출력)
SELECT num_seq.CURRVAL FROM dual; -- 연산식의 결과 확인을 위해서 dual 더미 테이블 사용
-- 시퀀스 수정 : ALTER SEQUENCE 시퀀스명 수정할 옵션명 수정 후 값
ALTER SEQUENCE num_seq MAXVALUE 10000;
-- 시퀀스 설정 확인 : SELECT 시퀀스 옵션명 FROM user_sequences;
-- user_sequences 시퀀스 객체명(테이블 형태)
SELECT sequence_name, max_value FROM user_sequences;
-- 시퀀스 삭제 : DROP SEQUENCE 시퀀스명
DROP SEQUENCE num_seq;
SELECT sequence_name FROM user_sequences;
-------------------------------------------------------------------------------------------------------------
-- UPDATE 구문 테이블 준비
-- 데이터가 어느 정도 저장되어있는 테이블 준비
-- 외부 파일을 오라클 DB로 IMPORT해서 테이블 생성 데이터 저장
-- 준비된 파일 확인
SELECT * FROM product;
-- 기본 키 제약 조건 추가
ALTER TABLE product ADD CONSTRAINT PK_product_prdNo PRIMARY KEY (prdNo);
-- 빈 열 추가
ALTER TABLE product ADD etc VARCHAR2(30);
-- UPDATE문
-- 특정 열의 값을 수정하는 명령어
-- 조건에 맞는 행을 찾아서 열의 값 수 >=, 조건을 사용하지 않으면 모든 열의 값이 동일하게 변경될 수도 있음
-- 조건절 : WHERE
-- UPDATE 테이블명 SET 변경 열 = 값; -- 모든 행의 변경 열의 값이 지정된 값으로 대입
UPDATE product SET etc = '설명';
SELECT * FROM product;
-- UPDATE 테이블명 SET 변경 열 = 값 [WHERE 조건];
-- 상품 번호(prdNo)가 5인 상품 행(레코드)의 prdName의 값을 UHD TV로 변경
UPDATE product SET prdName = 'UHD TV' WHERE prdNo = '5';
-- 변경 확인 : WHERE 구문 사용해서 prdNo가 5번인 제품 정보만 조회
SELECT * FROM product WHERE prdNo = '5';
-- UPDATE문 연습 문제
-- 상품명이 '등산 배낭 옵티마'인 행을 찾아서 가격을 80000으로 변경
UPDATE product SET prdPrice = 80000 WHERE prdName = '등산 배낭 옵티마';
SELECT * FROM product WHERE prdName = '등산 배낭 옵티마';
-------------------------------------------------------------------
-- DELETE문
-- 테이블에 있는 기존 행을 삭제하는 명령어
-- DELETE문 기본 형식
-- DELETE FROM 테이블명 [WHERE 조건];
-- 상품명이 그늘막 텐트인 행 삭제 : 조건이 맞는 모든 행 삭제
DELETE FROM product WHERE prdName = '그늘막 텐트';
SELECT * FROM product WHERE prdName = '그늘막 텐트';
SELECT * FROM product;
-- 삼성 전자 제품은 모두 삭제하시오
DELETE FROM product WHERE prdMaker = '삼성 전자';
SELECT * FROM product;
-- 테이블의 모든 행 삭제 : 모든 행을 삭제하는 건 위험한 일이므로 거의 사용하지 않음
-- DELETE FROM 테이블명;
-- 데이터만 삭제하기 때문에 공간(테이블)은 남아있음
DELETE FROM product;
SELECT * FROM product; -- 해당 테이블이 없으면 오류 남 테이블이 있고 데이터가 없으면 칼럼명만 출력














---------------------------------------------------------------------------------------
-- 종합 문제 
-- 다음과 같이 SQL문 작성
-- 1. 고객 테이블(customer) 생성
DROP TABLE customer; -- 이 테이블의 기본 키가 다른 테이블의 외래 키와 연결되어있으면 삭제 안 됨, CASCADE CONSTRAINTS 기능(옵션 사용하면 무조건 삭제 가능)
-- 테이블 삭제(DROP)
CREATE TABLE customer (
    custNo VARCHAR2(10) NOT NULL PRIMARY KEY, -- 기본 키 사용 칼럼은 NOT NULL 처리해야 함(개발자가 명시적으로 NOT NULL 처리해야 함)
    custName VARCHAR2(30) NOT NULL,
    custTel VARCHAR2(30)
);

-- 2. 고객 테이블의 전화번호 열을 NOT NULL로 변경
-- 기존에 생성한 테이블의 구조 변경 : ALTER 구문
ALTER TABLE customer MODIFY custTel NOT NULL; -- 테이블 특정 열의 구조 변경 ALTER ~ MODIFY, 열 추가 ALTER ~ ADD, 열 삭제 ALTER ~ DROP(특정 칼럼의 공간 지움)

-- 3. 고객 테이블에 ‘성별’, ‘나이’ 열 추가(여러 열 추가 (칼럼, 칼럼1, ...)
ALTER TABLE customer ADD (custGender VARCHAR2(10), custAge INT); -- INT == NUMBER(38)

-- 4. 고객 테이블에 데이터 삽입(3개) -- 필드명 나열하는 구문을 제외하면 VALUES에 들어가는 실제 값은 칼럼을 추가한 순서대로 나열해야 함
INSERT ALL INTO customer VALUES ('1', '홍길동', '010-111-1111', '남', 20) INTO customer VALUES ('2', '성춘향', '010-222-1111', '여', 20) INTO customer VALUES ('3', '이몽룡', '010-333-1111', '남', 20) SELECT * FROM dual;

-- 5. 고객명이 홍길동인 고객의 전화 번호값 수정(값은 임의로) : UPDATE 테이블명 SET 칼럼명 = 바꿀 값 WHERE 조건
UPDATE customer SET custTel = '010-222-2222' WHERE custName = '홍길동';

-- 6. 나이가 20살 미만인 고객 삭제 : DELETE FROM 테이블명 -> 테이블 내 모든 데이터 삭제, DELETE FROM 테이블명 [WHERE 조건] -> 조건에 맞는 데이터 삭제
DELETE FROM customer WHERE custAge < 20; -- 0개 행 이(가) 삭제되었습니다.
DELETE FROM customer WHERE custGender = '여';
-- DELETE는 데이터만 지움(공간은 유지) : 레코드(행, 인스턴스)가 들어갈 수 있는 공간 유지 : 특정 레코드의 특정 칼럼만 지울 수는 없음
-- customer 테이블의 이몽룡 전화 번호 데이터를 삭제하시오
-- DELETE 구문은 이몽룡 데이터 전체를 삭제함, 전화 번호 데이터만 삭제는 NULL값으로 전화 번호를 변경(단, 전화 번호 필드가 NOT NULL 제약 조건이 없어야 함)


-- 테이블 조회
SELECT * FROM customer;











