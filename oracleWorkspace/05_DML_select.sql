-- SELECT 연습
-- 필요 데이터 : 테이블 임포트 통해서 준비
-- 서점 DB : 서점 진열된 책 테이블(book), 책 판매 테이블(bookSale), 책 구매 고객(거래처) 테이블(client), 출판사 테이블(publisher)
-- 테이블 상호 연결 : 무결성 제약 조건 구성
-- 테이블들의 기본 키를 구성하고, 외래 키를 구성 : 노트에 기록되어있음
-- SQL 구문 이용해서 처리
-- 기본 키 제약 조건 추가 ---------------------------------
-- 구조 변경이므로 ALTER 구문 사용, 추가하므로 ADD CONSTRAINT
ALTER TABLE publisher ADD CONSTRAINT PK_publisher_pubNo PRIMARY KEY (pubNo);
ALTER TABLE book ADD CONSTRAINT PK_book_bookNo PRIMARY KEY (bookNo);
ALTER TABLE client ADD CONSTRAINT PK_client_clientNo PRIMARY KEY (clientNo);
ALTER TABLE bookSale ADD CONSTRAINT PK_bookSale_bsNo PRIMARY KEY (bsNo);
-- 변경 확인(구조 확인 구문)
DESCRIBE publisher;
DESCRIBE book;
DESCRIBE client;
DESCRIBE bookSale;
-- 제약 조건 변경 확인
SELECT * FROM user_constraints WHERE table_name = 'PUBLISHER';
SELECT * FROM user_constraints WHERE table_name = 'BOOK';
SELECT * FROM user_constraints WHERE table_name = 'CLIENT';
SELECT * FROM user_constraints WHERE table_name = 'BOOKSALE';
-- 외래 키 제약 조건 추가 ---------------------------------------------
ALTER TABLE book ADD CONSTRAINT FK_book_publisher FOREIGN KEY (pubNo) REFERENCES publisher(pubNo); -- publisher 테이블의 기본 키와 book 테이블의 pubNo 칼럼을 연결
ALTER TABLE bookSale ADD CONSTRAINT FK_bookSale_client FOREIGN KEY (clientNo) REFERENCES client(clientNo); -- 참조되는 테이블의 칼럼은 기본 키여야 한다
ALTER TABLE bookSale ADD CONSTRAINT FK_bookSale_book FOREIGN KEY (bookNo) REFERENCES book(bookNo); -- 기본 키가 아닌 일반 칼럼 연결로는 무결성 제약 조건 구성되지 않음
-- 제약 조건 변경 확인
SELECT * FROM user_constraints WHERE table_name = 'BOOK';
SELECT * FROM user_constraints WHERE table_name = 'BOOKSALE';
---------------------------------------------------------------------------------------
-- SELECT 구문의 문법 : 
-- SELECT 필드(칼럼) 리스트 FROM 테이블명 [WHERE 조건절]
-- 칼럼 리스트에 쓸 수 있는 기호 : *(ALL, 모든 칼럼)
-- 1. 거래하는 출판사들의 모든 정보를 조회하시오
-- SELECT에 의해서 반환되는 객체는 테이블 객체임(임시 테이블을 만들어서 테이블 객체를 반환함 -- 백엔드 개발 시 중요함)
SELECT * FROM publisher;
-- 2. 서점에 진열된 도서의 모든 정보를 조회하시오. 
SELECT * FROM book;
-- 3. 서점 고객에 대한 모든 정보를 조회하시오. 
SELECT * FROM client;
-- 4. 서점 판매 데이터를 조회하시오. 
SELECT * FROM bookSale;
-- 일부 칼럼만 조회
-- SELECT 칼럼1, 칼럼2, ..., 칼럼N FROM 테이블명
-- 도서명과 가격만 검색하여 출력
SELECT bookName, bookPrice FROM book;
-- 저자만 검색하여 출력
SELECT bookAuthor FROM book;
-- 한 개의 칼럼이어도 테이블 객체로 반환
-- 한 개 칼럼 조회 시 중복되는 데이터 처리 방법은????? 
-- 현 서점에 진열된 책의 저자 이름 : 한 명의 저자가 1개 이상의 책을 출간할 수 있으므로 저자명만 검색하면 중복 데이터가 나올 수 있음
-- 중복 데이터는 한 번만 출력 : DISTINCT
-- 연산자와 연결될 때 자주 사용하게 됨
SELECT DISTINCT bookAuthor FROM book;
-- 칼럼 내에 있는 데이터를 원하는 조건에 맞춰서 검색하고자 할 때 
-- 도서 테이블에서 홍길동 저자가 쓴 책의 모든 정보를 출력하시오, 조건 : 홍길동 저자가 쓴
-- 조건 : 실제 데이터값에 대한 비교를 통해서 구성
SELECT * FROM book WHERE bookAuthor = '홍길동';
-- 조건 구문 문법
-- SELECT 필드 리스트 FROM 테이블명 WHERE 칼럼명 비교 연산자 실제 값;
-- 비교 연산자 : 비교, 범위, 포함 여부, NULL 여부, 논리 연산(AND OR), 패턴 매칭
-- 비교(=, <, >, <=, >=, !=)
-- 값의 크기를 비교해서 질의 검색, 문자도 크기가 있음
-- 저자가 홍길동인 도서의 도서명, 저자 출력
SELECT bookName, bookAuthor FROM book WHERE bookAuthor = '홍길동';
-- 도서 가격(조건 사용할 칼럼명)이 30000 이상(조건)인 도서(테이블명)의 도서명, 가격, 재고(칼럼 리스트) 출력(SELECT)
SELECT bookName, bookPrice, bookStock FROM book WHERE bookPrice >= 30000;
-- 논리 연산을 이용한 범위 조건 : >= AND <=, = OR =
-- 도서(테이블명)의 재고(비교 연산 대상 칼럼)가 3 ~ 5권(연산식으로 생성할 조건) 사이인 도서의 도서명, 재고(출력 필드명) 검색해서 출력하시오
SELECT bookName, bookStock FROM book WHERE bookStock >= 3 AND bookStock <= 5; -- 3 ~ 5권
-- BETWEEN 구문 : 범위 설정
-- 문법 BETWEEN 최소값 AND 최대값
-- 도서(테이블명)의 재고(비교 연산 대상 칼럼)가 3 ~ 5권(연산식으로 생성할 조건) 사이인 도서의 도서명, 재고(출력 필드명) 검색해서 출력하시오
SELECT bookName, bookStock FROM book WHERE bookStock BETWEEN 3 AND 5; -- == bookStock >= 3 AND bookStock <= 5
-- 특정 내용 리스트에 데이터값이 포함되는지의 여부
-- 출판사명이 서울 출판사거나 도서 출판 강남인 도서들의 모든 정보를 검색하여 출력하시오
-- 도서 테이블에서 출판사 번호가 1번이거나 2번인 도서의 모든 정보를 검색하여 출력하시오

SELECT * FROM book WHERE pubNo = '1' OR pubNo = '2';
-- IN, NOT IN을 사용 : 칼럼명 IN (값1, 값2, ..., 값N), 칼럼명 NOT IN(값1, 값2, ..., 값N)
-- IN 리스트에 포함되는 값, NOT IN 리스트에 포함되지 않는 값
-- 도서 테이블의 출판사 번호 1, 2번인 도서의 모든 정보 출력
SELECT * FROM book WHERE pubNo IN ('1', '2'); -- == pubNo = '1' OR pubNo = '2'
-- NOT IN은 칼럼값이 LIST에 포함되지 않은 경우 추출
-- 도서 테이블에서 출판사 번호 3번을 제외한 나머지 출판사에서 출판한 책의 정보를 출력하시오
SELECT * FROM book WHERE pubNo != '3';
SELECT * FROM book WHERE pubNo NOT IN ('3'); -- pubNo != '3'
-- 비교 대상이 NULL일 때 사용하는 문장
-- IS NULL : 저장 데이터값이 NULL인지 여부, IS NOT NULL : 저장 데이터값이 NOT NULL인지의 여부
-- 모든 고객의 고객 이름과 취미 출력
SELECT clientName, clientHobby FROM client;
-- 취미가 NULL이 아닌 고객들의 이름과 취미를 출력
SELECT clientName, clientHobby FROM client WHERE clientHobby IS NOT NULL; -- '' 문자도 포함
-- 취미가 NULL인 고객들의 이름과 취미를 출력
SELECT clientName, clientHobby FROM client WHERE clientHobby IS NULL; -- (null)은 dbms가 운영하는 특수 값 null을 표현, () 없이 null은 문자열을 의미
-- 취미가 ' '(스페이스 한 번 : 공백 문자)인 고객의 이름과 취미를 출력 : 데이터값을 실제 값과 비교하는 조건이므로 연산식을 사용해야 함 
SELECT clientName, clientHobby FROM client WHERE clientHobby = ' ';
-- 논리 연산(AND, OR)
-- 두 개의 비교 연산을 연결해서 한 개의 결과를 추출하고자 할 때
-- 저자(조건 비교 칼럼)가 '홍길동'이거나(OR) '성춘향'(=)인 도서(테이블명)의 모든(*) 정보를 출력 SELECT
SELECT * FROM book WHERE bookAuthor = '홍길동' OR bookAuthor = '성춘향';
-- 저자(비교 칼럼명)가 '홍길동'(=)이면서(이고)(AND) 재고(비교 칼럼명)가 3권 이상(>=)인 도서(테이블명)의 모든(*) 정보 출력 SELECT
SELECT * FROM book WHERE bookAuthor = '홍길동' AND bookStock >= 3;
--------------------------------------------------------------------------------------------------------------------
-- 문자열 데이터에 대해서 문자의 패턴을 검사하는 조건식 : LIKE 구문 패턴 문자열
-- 패턴 매칭 문자 기호 : % -> 0개 이상의 문자(문자열), _ -> 1개의 문자
-- ' ' 내부에 기호를 사용
-- ~로 시작하는 : '문자(열)%' -> 문자(열)로 시작하는 모든 문자열
-- EX. '홍%' : '홍'으로 시작하는 문자열 검색, 홍, 홍길, 홍길동, 홍길동이 집에 갔습니다
-- EX. '%홍%' : '홍' 문자를 포함하는 모든 문자열, 홍, 홍길, 홍길동, 홍길동이 집에 갔습니다, 친구 홍길동, 친구 홍씨, 친구 성은 홍
-- EX. '%홍' : '홍'으로 끝나는 모든 문자열, 홍, 동홍, 길홍, 친구 성은 홍, (홍길은 포함되지 않음)
-- 몇 개의 문자 : 4개의 문자로 이루어진 -> '____'
-- EX. '홍__' : 홍으로 시작하는 3글자 문자열
-- EX. '_길_' : 길을 포함하는 문자열 단, 길 앞에 한 문자 뒤로 한 문자만 포함되어야 함
-- EX. '__동' : 동으로 끝나는 3문자열
-- EX. '%___% : 3글자 이상 문자열
-- 출판사 테이블에서 출판사명(조건 검사 필드)에 '출판사'가 포함(LIKE %)된 모든 레코드의 모든(*) 정보 출력 SELECT
SELECT * FROM publisher WHERE pubName LIKE '%출판사%';
-- 고객 테이블에서 출생 년도(조건 비교 칼럼)가 1990년대(199로 시작하는 패턴)인 모든 레코드(행)을 모든 칼럼(*) 출력 SELECT
-- clientBirth 칼럼을 문자열 패턴 매칭으로 진행(오류 날 수 있음 - 날짜 형식이어서 오류 대신 검색된 데이터가 없음)
SELECT * FROM client WHERE clientBirth LIKE '199%'; -- 생년월일이 YYYY-MM-DD 형태를 가정하고 패턴을 생성
-- 고객 테이블에서 이름(조건 비교 칼럼)이 4글자(LIKE _)인 고객의 모든(*) 정보 출력 SELECT
SELECT * FROM client WHERE clientBirth LIKE '____'; -- 밑줄 문자 4개
-- NOT LIKE 사용(패턴과 매칭 되지 않는 데이터)
-- 도서 테이블에서 도서명(조건 비교 칼럼)에 '안드로이드'가 들어있지 않은(NOT LIKE %) 도서의 도서명(최종 출력할 칼럼 리스트)을 출력 SELECT
SELECT bookName FROM book WHERE bookName NOT LIKE ('%안드로이드%');
-- 연습 문제
-- 1. 고객 테이블에서 고객명, 생년월일, 성별(출력 칼럼 리스트) 출력 SELECT
SELECT clientName, clientBirth, clientGender FROM client; -- 칼럼 내 모든 데이터 출력
--2. 고객 테이블에서 주소(출력할 칼럼)만 검색하여 출력(단, 중복되는 튜플(데이터)은 한 번만 출력) : DISTINCT 구문 사용(칼럼명 앞에 사용)
SELECT clientAddress FROM client; -- 고객 테이블의 주소 칼럼의 모든 데이터 출력(중복 허용)
SELECT DISTINCT clientAddress FROM client; -- 서점의 고객의 주소 지역은 6군데임
-- 3.고객 테이블에서 취미(비교 칼럼)가 '축구'이거나(OR) '등산'인 고객의 고객명, 취미(출력 필드) 출력 SELECT
SELECT clientName, clientHobby FROM client WHERE clientHobby  = '축구' OR clientHobby = '등산';
SELECT clientName, clientHobby FROM client WHERE clientHobby  IN ('축구', '등산'); -- clientHobby = '축구' OR clientHobby = '등산';
-- 4.도서 테이블에서 저자(비교 칼럼)의 두 번째 위치(LIKE _, %)에 '길'이 들어 있는 저자명(출력 필드) 출력 SELECT(중복되는 튜플은 한 번만 출력) DISTINCT
SELECT DISTINCT bookAuthor FROM book WHERE bookAuthor LIKE '_길%';
-- 5.도서 테이블에서 발행일(비교 칼럼)이 2018년(LIKE %)인 도서의 도서명, 저자, 발행일(출력 칼럼) 출력 SELECT
-- 발행일이 문자열이 아닌 DATE 형태면 범위 이용해야 함 >= AND <=
-- bookDate가 문자열로 가정
SELECT bookName, bookAuthor, bookDate FROM book WHERE bookDate LIKE '2018%';
-- bookDate가 DATE형
SELECT bookName, bookAuthor, bookDate FROM book WHERE bookDate >= '2018-01-01' AND bookDate <= '2018-12-31';
-- DATE형에 BETWEEN AND 구문 사용 가능
SELECT bookName, bookAuthor, bookDate FROM book WHERE bookDate BETWEEN '2018-01-01' AND '2018-12-31';
-- 6.도서 판매 테이블에서 고객 번호(비교 칼럼) 1, 2(IN)를 제외한(NOT) 모든 튜플 정보(*) 출력 SELECT
SELECT * FROM bookSale WHERE clientNo NOT IN ('1', '2');

-- 7. 고객 테이블에서 취미(비교 필드)가 NULL이 아니면서(IS NOT NULL)(AND) 주소가 '서울'(LIKE %)인 고객의 고객명, 주소, 취미(출력 칼럼) 출력
SELECT clientName, clientAddress, clientHobby FROM client WHERE clientHobby IS NOT NULL AND clientAddress LIKE ('%서울%');

-- 8. 도서 테이블에서 가격이 25000 이상이면서(AND) 저자 이름에 '길동'이 들어가는(LIKE %) 도서의 도서명, 저자, 가격, 재고 출력
SELECT bookName, bookAuthor, bookPrice, bookStock FROM book WHERE bookPrice >= 25000 AND bookAuthor LIKE '%길동%';

-- 9. 도서 테이블에서 가격이 20,000 ~ 25,000원인 모든 튜플 출력
SELECT * FROM book WHERE bookPrice BETWEEN 20000 AND 25000;

-- 10. 도서 테이블에서 저자명에 '길동'이 들어있지(LIEK %) 않은(NOT) 도서의 도서명, 저자 출력
SELECT bookName, bookAuthor FROM book WHERE bookAuthor NOT LIKE ('%길동%');
-------------------------------------------------------------------------------------------------------
-- 출력된 결과의 정렬 : ORDER BY 구문(제일 마지막에 실행되는 구문)
-- FROM - WHERE - SELECT - ORDER BY
-- ORDER BY : 특정 열의 값을 기준으로 결과를 정렬
-- ASC(오름차순 - 생략 가능)/DSC(내림차순)
-- 도서 테이블의 모든(*) 정보를 도서명(정렬 기준 칼럼) 기준 오름차순(ORDER BY ASC) 출력
-- SELECT 필드 리스트 FROM 테이블명 [WHERE 조건절] ORDER BY 기준 칼럼 정렬 방식 - 정렬 기준 칼럼이 1개일 때
SELECT * FROM book ORDER BY bookName; -- 영문 우선, 한글, 숫자가 최우선(첫 글자를 기준으로 정렬, 숫자는 가중치 기준 정렬), 
-- 동일 글자가 계속 나오면 동일 글자 아닐 때까지 비교해서 정렬 순서 정함, 칼럼값이 동일하면 먼저 저장된 값이 먼저 출력
SELECT * FROM book ORDER BY bookName ASC;
-- 내림차순 정렬 : DESC
SELECT * FROM book ORDER BY bookName DESC; -- 오름차순 정렬과 반대
-- 도서 테이블에서 재고 수량을 기준으로 내림차순 정렬하고 도서명, 저자, 재고 출력
SELECT bookName, bookAuthor, bookStock FROM book ORDER BY bookStock DESC;
-- 위 결과는 재고가 동일한 레코드가 존재함, 정렬 기준 칼럼에 저장된 값이 동일한 경우 2차 정렬 기준 표현 가능
-- 도서 테이블에서 재고 수량을 기준으로 내림차순 정렬하고 재고 수량이 동일한 경우 저자명 기준 오름차순 정렬하고 도서명, 저자, 재고 출력
SELECT bookName, bookAuthor, bookStock FROM book ORDER BY bookStock DESC, bookAuthor ASC;
-- ORACLE SQL에는 MY SQL에서 사용하는 LIMIT 구문은 사용 불가
-------------------------------------------------------------------------------------------
-- 집계 함수 : 쿼리 구문 내에서 사용 가능한 특별한 SQL 함수 -> 함수명(칼럼명)
-- 집계 함수를 이용해서 구문을 작성하면 데이터 결과는 함수를 적용한 결과가 출력이 되게 됨
-- EX. SUM(bookStock) : bookStock 칼럼의 모든 데이터(WHERE 조건에 따라 달라질 수 있음)를 더한 결과가 반환되면서 출력
SELECT bookDate, bookStock FROM book; -- 15개 레코드 출력
SELECT bookName, bookStock FROM book WHERE bookName LIKE '안드로이드%'; -- 3개 레코드 출력
-- SUM(bookStock) 적용
SELECT SUM(bookStock) FROM book; -- 15개 레코드의 bookStock 데이터의 합계를 출력 : 합계 출력이므로 결과는 1개의 레코드로 출력됨
SELECT SUM(bookStock) FROM book WHERE bookName LIKE '안드로이드%'; -- 3개 레코드 bookStock 데이터의 합계를 출력 : 합계 출력이므로 결과는 1개의 레코드로 출력됨
-- 집계 함수 종류 : 반환되는 결과가 1개 -> SELECT 구문에서 사용
-- SUM(칼럼명) : 합계
-- AVG(칼럼명) : 평균
-- COUNT(칼럼명) : 선택된 열(칼럼)의 행 수(칼럼의 데이터가 NULL인 경우 제외)
-- COUNT(*) : 반환된 테이블의 전체 행 수(특정 칼럼 데이터가 NULL이어도 다른 칼럼 데이터가 유효 데이터가 있으면 제외 없이 계산)
-- MAX(칼럼명) : 최대
-- MIN(칼럼명) : 최소
-- 문법 : SELECT 집계 함수(칼럼명), 집계 함수2(칼럼명), ... FROM 테이블명 [WHERE 조건절]
-- SUM() : 합계
-- 도서 테이블에서 총 재고 수량을 계산해서 출력
SELECT SUM(bookStock) FROM book; -- 계산 결과가 1개의 레코드로 반환(테이블 객체로 반환), 칼럼명이 집계 함수 수식으로 나옴 : SUM(bookStock)
-- 칼럼명이 함수식이면 가독성이 떨어지므로 칼럼명에 대한 별명을 만들어서 사용 가능
-- 칼럼명 AS "별명" : "" 써야 함, ''는 안 됨
-- 도서 테이블에서 총 재고 수량을 계산하여 출력하되 칼럼명은 재고 수량으로 표현(별명)하시오
SELECT SUM(bookStock) AS "재고 수량" FROM book;
SELECT SUM(bookStock) AS "재고 수량" FROM book; -- 별명에 띄어쓰기가 없으면 큰 따옴표 생략 가능
-- 도서 테이블에서 총 재고 수량을 계산하여 출력하되 칼럼명은 SUM OF BOOKSTOCK으로 표현(별명)하시오
SELECT SUM(bookStock) AS "SUM OF BOOKSTOCK" FROM book;
-- SELECT SUM(bookStock) AS SUM OF BOOKSTOCK FROM book; -- 별명에 띄어쓰기가 있으면 큰 따옴표 반드시 사용해야 함
-- 집계 함수 사용 시 WHERE절의 조건에 맞는 데이터(레코드)에만 집계 함수 적용 가능
-- 도서 판매 테이블에서 고객 번호가 2인 호날두가 주문한 도서의 총(SUM) 주문 수량 조회
SELECT SUM(bsQty) FROM bookSale WHERE clientNo = '2'; -- 조건절이 포함된 집계 함수 확인
SELECT clientNo, bsQty FROM bookSale WHERE clientNo = '2';
-- 도서 판매 테이블에서 고객 번호가 2인 호날두가 주문한 도서의 총(SUM) 주문 수량과 고객 번호 조회
-- SELECT clientNo, SUM(bsQty) FROM bookSale -- clientNo는 3개의 값이 반환 SUM(bsQty)는 1개의 값만 반환
-- WHERE clientNo = '2';
-- ORA-00937 : 단일 그룹의 그룹 함수가 아닙니다 : SELECT 구문에 집계 함수를 사용했을 때 GROUP BY 처리하지 않는 한 일반 칼럼과 집계 함수식을 같이 사용할 수 없음
-- SELECT clientNo -> 일반 칼럼, SUM(bsQty) -> 집계 함수식
-- clientNo는 3개의 값이 반환 SUM(bsQty)는 1개의 값만 반환
SELECT clientNo, SUM(bsQty) FROM bookSale WHERE clientNo = '2'; 
-- SELECT clientNo -> 일반 칼럼, SUM(bsQty) -> 집계 함수식
-- 집계 함수식은 1개의 데이터를 반환, 일반 칼럼은 조건절 등에 의해 반환되는 개수가 0 ~ N개까지 반환 가능
-- 집계 함수식은 집계 함수식들끼리만 사용
-- 도서 판매 테이블에서 고객 번호가 2인 호날두가 주문한 도서의 총(SUM) 주문 수량을 "총 주문 수량"이라는 칼럼명으로 출력
SELECT SUM(bsQty) AS "총 주문 수량" FROM bookSale WHERE clientNo = '2';
-- AS절 생략 가능
SELECT SUM(bsQty) "총 주문 수량" FROM bookSale WHERE clientNo = '2';
-- "" 없어도 AS절 생략 가능
SELECT SUM(bsQty) 총주문수량 FROM bookSale WHERE clientNo = '2';
-- 도서 판매 테이블에서 최대(MAX) 주문량, 최소(MIN) 주문량, 전체 주문량의 평균(AVG), 전체 주문량의 합계(SUM)
SELECT MAX(bsQty), MIN(bsQty), AVG(bsQty), SUM(bsQty) FROM bookSale;
-- 도서 테이블에서 도서 가격 총액, 평균 가격, 최고가, 최저가를 출력하되 별명은 문제의 칼럼명으로 설정
SELECT SUM(bookPrice) AS "가격 총액", AVG(bookPrice) AS "평균 가격", MAX(bookPrice) AS 최고가, MIN(bookPrice) AS 최저가 FROM book;
-- 도서 판매 테이블에서 도서 판매 건수 출력(테이블에 저장된 레코드 수 출력)
SELECT COUNT(*) "총 판매 건수" FROM bookSale;
-- COUNT(특정 칼럼) VS 총 고객 수
SELECT COUNT(*) AS "총 고객 수" FROM client; -- 고객 테이블의 저장된 고객의 수를 출력
-- 특정 칼럼의 데이터 개수를 셀 때 NULL은 제외하고 셈
SELECT COUNT(clientHobby) AS "취미 입력된 고객 수" FROM client; -- 고객 테이블의 고객 중 취미가 있는 고객의 수
SELECT * FROM client;
SELECT COUNT(*) "총 고객 수", COUNT(clientHobby) "취미 입력된 고객 수" FROM client;
----------------------------------------------------------------------------------
-- book 테이블의 모든 데이터 출력
SELECT * FROM book;
-- book 테이블에 저장된 책의 수량을 출력 : book 테이블 단위로 책의 권 수를 개수
SELECT COUNT(*) AS "책의 권 수 " FROM book;
-- book 테이블에 저장된 책에 대해서 출판사별(출판사별로 나누어서 책의 권 수를 개수) 수량을 출력
-- 기준 칼럼의 데이터별로 레코드를 나눌 때 사용 문장 : GROUP BY
-- GROUP BY
-- 그룹 질의를 기술할 때 사용
-- 특정 열로 그룹화한 후 각 그룹에 대해 한 행씩 질의 결과 생성
-- book 테이블에 저장된 책에 대해서 출판사별(pubNo)(출판사별로 나누어서 책의 권 수를 개수) 수량을 출력
SELECT pubNo "출판사 번호", COUNT(*) "책의 권 수" FROM book GROUP BY pubNo; -- 집계 함수식이 SELECT절에 있지만 pubNo는 GROUP BY절의 기준 열이므로 표현 가능
-- 도서 판매 테이블에서 도서 번호별(GROUP BY 기준 열)로 주문 수량 합계(SUM)해서 출력(단, 도서 번호도 같이 출력)
-- bookNo GROU BY 기준 열 SELECT절에 집계 함수식과 같이 사용
SELECT bookNo "도서 번호", SUM(bsQty) "주문 수량 합계" FROM bookSale GROUP BY bookNo;
-- GROUP BY절에서 정렬
-- SELECT - FROM - [WHERE] - GROUP BY - ORDER BY
SELECT bookNo "도서 번호", SUM(bsQty) "주문 수량 합계" FROM bookSale GROUP BY bookNo ORDER BY bookNo ASC; -- bookNo 기준 오름차순 정렬
-- 또는
-- 나열된 순으로 열 번호가 설정 도서 번호 1, 주문 수량 합계 2
SELECT bookNo "도서 번호", SUM(bsQty) "주문 수량 합계" FROM bookSale GROUP BY bookNo ORDER BY 1; -- 첫 번째 열 기준 오름차순 정렬
-- 나열된 순으로 열 번호가 설정 도서 번호 1, 주문 수량 합계 2
SELECT bookNo "도서 번호", SUM(bsQty) "주문 수량 합계" FROM bookSale GROUP BY bookNo ORDER BY 1 DESC; -- 첫 번째 열 기준 내림차순 정렬
-- 나열된 순으로 열 번호가 설정 도서 번호 1, 주문 수량 합계 2
SELECT bookNo "도서 번호", SUM(bsQty) "주문 수량 합계" FROM bookSale GROUP BY bookNo ORDER BY "도서 번호"; -- SELECT절에서 설정한 칼럼의 별명을 이용한 정렬
-- 도서 판매 테이블에서 도서 번호별(GROUP BY 기준 열)로 주문 수량 합계(SUM)해서 출력(단, 도서 번호도 같이 출력)
-- 그리고, 주문 수량 합계의 결과별로 내림차순 정렬
-- 나열된 순으로 열 번호가 설정 도서 번호 1, 주문 수량 합계 2
SELECT bookNo "도서 번호", SUM(bsQty) "주문 수량 합계" FROM bookSale GROUP BY bookNo ORDER BY "주문 수량 합계" DESC;
-- ** ORDER BY ** 절은 가장 나중에 실행되는 구문 --
------------------------------------------------------------------------------------
-- HAVING 조건절 : GROUP BY에서 나온 GROUP의 결과에 대한 조건절, 수식은 집계 함수를 이용한 조건 수식을 사용
-- 반드시 GROUP BY절과 같이 사용
-- WHERE절보다 뒤에 나와야 함
-- SELECT ~ FROM ~ WHERE ~ GROUP BY ~ HAVING ~ ORDER BY
-- EX. 
-- 먼저 수행되고 GROUP BY
-- 도서 가격이 25000원보다 큰 도서들을 출판사 번호별로 GROUP을 구성
SELECT pubNo, COUNT(*) AS "도서 수 합계" FROM book WHERE bookPrice >= 25000 GROUP BY pubNo HAVING COUNT(*) >= 2; -- 도서 가격 25000 이상인 책이 2권 이상인 출판사 번호와 책의 수
-- 연습 문제 : 5_DML_select.sql에 계속
-- 도서 테이블에서 가격(정렬 기준 필드)순으로 내림차순(DESC) 정렬(ORDER BY)하여, 도서명, 저자, 가격(출력 필드) 출력 SELECT(가격이 같으면 저자순으로 오름차순(ASC) 정렬)
SELECT bookName, bookAuthor, bookPrice FROM book ORDER BY bookPrice DESC, bookAuthor ASC; -- 두 번째 정렬 기준인 경우에는 DESC/ASC 명시적 표기가 가독성이 높음
-- 도서 테이블에서 저자에 '길동'이 들어가는(LIKE %) 도서의 총 재고 수량(SUM()) 계산(계산 결과가 SELECT 필드로 표현)하여 출력 SELECT
-- 집계 함수는 반환 결과가 1개로 반환되게 됨 : SELECT절에 집계 함수를 이용한 출력이 있다면 집계 함수 사용하지 않는 일반 필드는 사용 불가
SELECT * FROM book WHERE bookAuthor LIKE '%길동%';
SELECT bookStock FROM book WHERE bookAuthor LIKE '%길동%';
SELECT SUM(bookStock) FROM book WHERE bookAuthor LIKE '%길동%'; -- 집계 함수 사용 시 칼럼명이 연산식으로 반환되므로 
-- 자바 프로그램에서 조회된 결과를 이용하려면 칼럼명이 코딩 되어야 함, 칼럼명이 식으로 되어있으면 코드가 길어지고 가독성이 떨어짐
SELECT SUM(bookStock) AS "총 재고 수량" FROM book WHERE bookAuthor LIKE '%길동%'; -- 집계 함수 사용 시 칼럼명이 연산식으로 반환되므로 칼렴명의 별칭을 만들어서 출력함
-- 저자명에 길동이 포함되는 저자가 출간한 책의 총 재고 수량과 저자명을 출력하시오
-- 집계 함수가 있는 SELECT절은 GROUP BY를 사용하지 않는 한 집계 함수 구문만 있어야 함
-- SELECT bookAuthor, SUM(bookStock) AS "총 재고 수량" FROM book WHERE bookAuthor LIKE '%길동%'; -- ORA-00937 : 단일 그룹의 그룹 함수가 아닙니다. 집계 함수의 반환은 1개 bookAuthor 반환은 5개 반환 테이블 구성 불가
-- 도서 테이블에서 ‘서울 출판사' 도서 중 최고가(MAX)와 최저가(MIN) 출력 SELECT
-- 도서 테이블은 출판사명이 아닌 출판사 번호를 갖고 있음 '1' 출판사 번호를 이용해서 검색
SELECT MAX(bookPrice) 최고가, MIN(bookPrice) "최저가" FROM book WHERE pubNo = '1'; -- 집계 함수 연산식만 나열하고 있으므로 오류 없음
-- 도서 테이블에서 출판사별(GROUP BY)로 총 재고 수량(SUM)과 평균 재고 수량(AVG) 계산하여 출력(‘총 재고 수량’으로 내림차순 정렬(ORDER BY))
-- SELECT ~ FROM ~ GROUP BY ~ ORDER BY
SELECT SUM(bookStock) AS "총 재고 수량", AVG(bookStock) AS "평균 재고 수량" FROM book GROUP BY pubNo ORDER BY "총 재고 수량" DESC;
-- 출력 결과에 대해 소수점 이하 자리수 처리
-- 집계 함수와 같이 사용 : ROUND(대상 값, 소수점 이하 자리수) - 반올림, CEIL() - 올림, FLOOR() - 내림
SELECT SUM(bookStock) AS "총 재고 수량", ROUND(AVG(bookStock)) AS "평균 재고 수량" FROM book GROUP BY pubNo ORDER BY "총 재고 수량" DESC;
-- 소수점 2째자리까지 표기
SELECT SUM(bookStock) AS "총 재고 수량", ROUND(AVG(bookStock), 2) AS "평균 재고 수량" FROM book GROUP BY pubNo ORDER BY "총 재고 수량" DESC;
-- 도서 판매 테이블에서 고객별(GROUP BY)로 ‘총 주문 수량’(SUM)과 ‘총 주문 건수’(COUNT(*)) 출력. 단 주문 건수가 2이상인(GROUP BY 조건절 : HAVING절) 고객만 해당
-- SELECT절에 일반 필드가 집계 함수와 같이 표현되는 경우는 GROUP BY절의 기준 열일 경우 일반 필드 표현 가능
SELECT clientNo, COUNT(*) AS "총 주문 건수", SUM(bsQty) AS "총 주문 수량" FROM bookSale GROUP BY clientNo HAVING COUNT(*) >= 2; -- HAVING 절의 조건은 집계 함수 사용해서 조건절을 구성해야 함
-- 한 개의 테이블을 활용한 검색 마무리 -----------