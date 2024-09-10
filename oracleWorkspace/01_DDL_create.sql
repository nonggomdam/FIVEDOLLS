-- 주석
-- CREATE TABLE
-- 테이블 구성, 속성(열)과 속성에 관한 제약 정의
-- 기본 키, 널 여부, 외래 키 등을 정의
-- 기본 문법
-- CREATE TABLE 테이블명 (열 이름 데이터 타입[, 제약 조건]);
-- SQL문은 대소문자 상관 없음
-- 상품 테이블 생성
-- 제약 조건
-- 기본 키 : prdNo, NOT NULL
-- prdName : NOT NULL
-- 기본 키 지정 방법1
CREATE TABLE product (
    prdNo VARCHAR2(10) NOT NULL PRIMARY KEY,
    prdName VARCHAR2(30) NOT NULL,
    prdPrice NUMBER(10),
    prdCompany VARCHAR2(30)
);
-- 기본 키 지정 방법2
CREATE TABLE product2 (
    prdNo VARCHAR2(10) NOT NULL,
    prdName VARCHAR2(30) NOT NULL,
    prdPrice NUMBER(10),
    prdCompany VARCHAR2(30), -- 칼럼 모두 만들고 그 후에 제약 조건을 나열 : PRIMARY KEY (칼럼명)
   
    PRIMARY KEY (prdNo)
);
-- 오류 보고
-- ORA-00955 : 기존의 객체가 이름을 사용하고 있습니다. 
-- 테이블은 물리적으로 저장소를 구별하는 식별자이기 때문에 이름이 중복되면 안 됨
-- 기본 키 지정 방법3
-- 제약 조건 이름 : 종류 약어_테이블명_칼럼명, 기본 키 : PK_product3_prdNo
CREATE TABLE product3 (
    prdNo VARCHAR2(10) NOT NULL,
    prdName VARCHAR2(30) NOT NULL,
    prdPrice NUMBER(10),
    prdCompany VARCHAR2(30), -- 칼럼 모두 만들고 그 후에 제약 조건을 나열 : CONSTRAINT 제약 조건 이름 PRIMARY KEY (칼럼명)
    
    CONSTRAINT PK_product3_prdNo PRIMARY KEY (prdNo)
);
-- sql developer 쿼리 실행 시 
-- 한 줄 쿼리는 해당 라인에 커서를 두고 실행 버튼
-- 여러 줄 쿼리는 블록을 설정하고 실행 버튼 단, 쿼리 구문 내부에 커서만 있으면 여러 줄이어도 실행됨
-- 여러 개의 쿼리를 실행하고자 하면 실행하려는 쿼리 블록 설정 후 실행 버튼
-- 실행 버튼만 누르면 해당 창의 모든 쿼리가 실행됨
-- 외래 키 제약 조건 추가
-- 외래 키는 현재 테이블의 속성의 값이 다른 테이블의 기본 키값을 사용할 때 외래 키로 지정해서 참조해놓으면 
-- 무결성 제약 조건이라는 원칙을 지킬 수 있음
-- 서점의 책이 출판된 출판사가 우리 서점과 거래하는 출판사임 보장하겠다
-- ex. 홍길동 책이 A 출판사에서 출판되었다고 저장되어있으면 우리 서점 db의 출판사 테이블에 A 출판사가 있다
-- 출판사 테이블과 책 테이블 : 책은 출판사에 의해 출판된다
-- 책 테이블의 속성 출판사(외래 키)에 저장되는 값은 출판사 테이블의 출판사 번호(기본 키)로 결정
-- 기본 키가 참조되는 출판사 테이블 먼저 만들어지고 
-- 기본 키를 참조하는 책 테이블이 나중에 만들어져야 함
/*
	출판사 테이블 생성(출판사 번호, 출판사명)
	publisher
    제약 조건
		- 기본 키 : pubNo, NOT NULL
        - pubName : NOT NULL로 설정
*/
-- 참조되는 테이블
CREATE TABLE publisher (
    pubNo VARCHAR(10) NOT NULL PRIMARY KEY,
    pubName VARCHAR(30) NOT NULL
);
-- 참조하는 테이블
-- 제약 조건 : bookPrice DEFAULT 10000, CHECK (bookPrice > 1000)
-- 제약 조건 : DEFAULT -> 해당 칼럼 데이터 입력 안 되면 기본 값을 저장
--          CHECK : 연산식이나 값의 나열을 통해서 저장되는 데이터의 제한을 둘 수 있음
-- 데이터 타입 INT : NUMBER(38, 0)
CREATE TABLE book (
    bookNo VARCHAR(10) NOT NULL PRIMARY KEY,
    bookName VARCHAR(30) NOT NULL,
    bookPrice INT DEFAULT 10000, CHECK (bookPrice > 1000),
    bookAuthor VARCHAR(30),
    bookDate DATE,
    pubNo VARCHAR(10) NOT NULL, -- FOREIGN KEY CONSTRAINT 제약 조건 이름 FOREIGN KEY (현재 테이블 필드명) REFERENCES 참조 테이블명(참조 테이블 필드명)
    
    CONSTRAINT FK_book_publisher FOREIGN KEY (pubNo) REFERENCES publisher(pubNo)
);
CREATE TABLE book2 (
    bookNo VARCHAR(10) NOT NULL PRIMARY KEY,
    bookName VARCHAR(30) NOT NULL,
    bookPrice INT DEFAULT 10000, CHECK (bookPrice > 1000),
    bookAuthor VARCHAR(30),
    bookDate DATE,
    pubNo VARCHAR(10) NOT NULL, -- FOREIGN KEY : FOREIGN KEY (현재 테이블 필드명) REFERENCES 참조 테이블명(참조 테이블 필드명)
    
    FOREIGN KEY (pubNo) REFERENCES publisher(prdNo)
);
-- 테이블 구성 확인
-- DESCRIBE 테이블명
-- DESCRIBE book;
-- 테이블 CREATE 연습 문제
-- 학생(student)과 학과(department) 테이블 생성하고 데이터 입력(각 3개씩 입력)
-- 제약 조건
-- 기본 키 설정 - NOT NULL 
-- 학생은 학과에 소속
-- 학생 이름과 학과명은 NULL 허용하지 않음
-- 학년은 4를 기본 값으로, 범위를 1~4로 설정
-- AND 키워드 사용 
-- 학과 테이블
CREATE TABLE department (
    dptNo VARCHAR(10) NOT NULL PRIMARY KEY,
    dptName VARCHAR(30) NOT NULL
);
-- 학생 테이블
CREATE TABLE student (
    stdNo VARCHAR(10) NOT NULL PRIMARY KEY,
    stdName VARCHAR(30) NOT NULL,
    stdYear INT DEFAULT 4 CHECK (stdYear >= 1 AND stdYear <= 4),
    dptNo VARCHAR(10) NOT NULL,
    
    FOREIGN KEY (dptNo) REFERENCES department(dptNo)
);
-- 그림과 같이 테이블 추가
-- 각 테이블간의 관계 파악하고 외래 키 설정
-- 데이터 타입과 크기는 용도에 맞게 지정
-- 기본 키 2개 설정 참고
-- CONSTRAINT PK_scores_stdNo_coursId PRIMARY KEY (stdNo, courseId)
-- professor/course/scores
-- 교수/과목/성적 테이블 추가
-- 성적 테이블에서 학번/과목 코드는 외래 키면서 기본 키(2개 : 복합 키)
-- 학과 테이블
CREATE TABLE department2 (
    dptNo VARCHAR(10) NOT NULL PRIMARY KEY,
    dptName VARCHAR(30) NOT NULL,
    dptTel VARCHAR(13) NOT NULL
);
-- 학생 테이블
CREATE TABLE student2 (
    stdNo VARCHAR(10) NOT NULL PRIMARY KEY,
    stdName VARCHAR(30) NOT NULL,
    stdYear INT DEFAULT 4 CHECK (stdYear >= 1 AND stdYear <= 4),
    stdAddress VARCHAR(30),
    stdBirth DATE,    
    dptNo VARCHAR(10) NOT NULL,
    
    FOREIGN KEY (dptNo) REFERENCES department(dptNo) -- 외래 키 이름을 명시하지 않음, 시스템이 자동으로 외래 키명을 생성해서 기록하게 됨
);
-- 교수 테이블
CREATE TABLE professor (
    profNo VARCHAR(10) NOT NULL PRIMARY KEY,
    profName VARCHAR(30) NOT NULL,
    profPosition VARCHAR(30),
    profTel VARCHAR(13),
    dptNo VARCHAR(10) NOT NULL,
    
    FOREIGN KEY (dptNo) REFERENCES department2(dptNo)
);
-- 과목 테이블
CREATE TABLE course (
    courseId VARCHAR(10) NOT NULL PRIMARY KEY,
    courseName VARCHAR(30) NOT NULL,
    courseCredit INT,
    profNo VARCHAR(10) NOT NULL,
    
    FOREIGN KEY (profNo) REFERENCES professor(profNo)
);
-- 성적 테이블
CREATE TABLE scores (
    stdNo VARCHAR(10) NOT NULL,
    courseId VARCHAR(10) NOT NULL,
    score int,
    grade char(2),
    
    PRIMARY KEY (stdNo, courseId),
    FOREIGN KEY (stdNo) REFERENCES student2(stdNo),
    FOREIGN KEY (courseId) REFERENCES course(courseId)
);
-- PRIMARY KEY (stdNo, courseId) : CONSTRAINT 제약 조건명은 생략할 수 있다