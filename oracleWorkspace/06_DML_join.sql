-- 조인
-- 여러 개의 테이블을 결합하여 조건에 맞는 행 검색하는 기능
-- INNER JOIN(내부 조인)/OUTER JOIN(외부 조인)
-- INNER JOIN
-- 여러 테이블을 조인하더라도 조인 조건은 두 개의 테이블만 관련됨
-- 두 테이블에서 공통되는 열이 있을 때(무결성 제약 조건으로 연결되어있는 경우) 
-- 공통 열의 값이 동일한 행(튜플, 레코드)만 반환
-- EX. 한 번이라도 책을 주문한 이력이 있는 고객의 고객 이름과 주문 수량을 조회
-- 주문 수량(bookSale 테이블), 고객 이름(client 테이블)에 있기 때문에 어느 한 개의 테이블만으로는 질의 구성 불가
-- JOIN 기능을 활용, bookSale 테이블과 client 테이블은 무결성 제약 조건으로 연결되어있음 : 조인 조건
-- ORA-00918 : 열의 정의가 애매합니다
-- 양쪽 테이블에서 동일 칼럼명(clientNo)이 있어서 어느 테이블의 칼럼명인지 구분 불가 오류
-- 두 개이상의 테이블을 사용할 때(조인)는 별칭이나 테이블명을 이용해서 칼럼을 구별해야 함
-- SELECT clientName, bsQty FROM bookSale JOIN client ON clientNo = clientNo;
SELECT clientName, bsQty FROM bookSale JOIN client ON bookSale.clientNo = client.clientNo;
-- JOIN 없이 bookSale 테이블만 쓰면 clientNo 외에는 조회가 불가능
SELECT clientNo, bsQty FROM bookSale;
SELECT clientName, clientAddress, bsQty FROM bookSale JOIN client ON bookSale.clientNo = client.clientNo;
-------------------------------------------------------------------------------
-- 조인 구성 형식
-- 1번 기본 형식
-- SELECT 열 리스트 FROM 테이블명1 INNER JOIN 테이블명2 ON 조인 조건(테이블명1.기본 키 = 테이블명2.외래 키);
-- 조인 종류를 표현하는 방식이 가장 많이 사용됨(가독성이 높음)
SELECT clientName, clientAddress, bsQty FROM client INNER JOIN bookSale ON bookSale.clientNo = client.clientNo;
-- 2번 방식 FROM절과 WHERE절 활용
-- 조인할 테이블을 , 이용해서 나열
SELECT clientName, bsQty FROM client, bookSale WHERE bookSale.clientNo = client.clientNo; -- 조인 조건
-- 3번 방식 FROM절과 WHERE절 활용 : 모든 칼럼에는 테이블명을 써줌(DBMS에게 칼럼의 소속 테이블을 알려줌으로써 성능 향상이 가능)
-- 조인할 테이블을 , 이용해서 나열
SELECT client.clientName, bookSale.bsQty FROM client, bookSale WHERE bookSale.clientNo = client.clientNo; -- 조인 조건
-- 4번 방식 : 테이블명 대신에 별칭을 사용
-- FROM절과 WHERE절 활용
-- 조인할 테이블을 , 이용해서 나열
SELECT c.clientName, b.bsQty FROM client c, bookSale b WHERE b.clientNo = c.clientNo; -- 조인 조건
-- 조인 코드는 조인 종류를 표현하는 기본 방식에 테이블 대신 별칭을 사용하는 방식으로 진행
-- 한 번이라도 도서를 주문한 이력이 있는 고객의 모든 고객 정보와 주문 정보를 출력
SELECT * FROM client c INNER JOIN bookSale b ON c.clientNo = b.clientNo;
-- 출력 결과 확인 : clientNo 칼럼은 양쪽 테이블 모두에 있기 때문에 칼럼명이 두 번째 칼럼은 CLIENTNO_1로 반환됨(반환 결과가 테이블이므로 같은 속성명이 있으면 안 됨)
-- 필요한 열만 추출, SELECT절에 표현
-- 한 번이라도 도서를 주문한 이력이 있는 고객의 고객 번호(양쪽 테이블 모두에 존재하는 칼럼)와 고객명을 출력 - 별칭 필요
SELECT c.clientNo, c.clientName FROM client c INNER JOIN bookSale b ON c.clientNo = b.clientNo;
-- 한 번이라도 도서를 주문한 이력이 있는 고객의 고객 번호(양쪽 테이블 모두에 존재하는 칼럼)와 고객명을 출력(여러 번 구매한 고객은 한 번만 표현)
SELECT DISTINCT c.clientNo, c.clientName FROM client c INNER JOIN bookSale b ON c.clientNo = b.clientNo;
-- 오라클에서 중복을 제거하는 문장으로 UNIQUE도 제공함
SELECT UNIQUE c.clientNo, c.clientName FROM client c INNER JOIN bookSale b ON c.clientNo = b.clientNo;
-- FROM절과 JOIN절의 테이블 표시 순서는 상관 없음, 조건절의 테이블 순서도 상관 없음
---------------------------------------------------------------------
-- 3개 테이블의 결합
-- 조인 조건은 두 개 테이블로만 구성하기 때문에 3개 테이블을 결합한다면 
-- 조인 조건은 2개가 필요
-- 이 경우에는 외래 키를 갖고 있는 테이블을 FROM절에 표시하는 게 효율적임
-- 테이블1 <-> 테이블2 <-> 테이블3 : FROM절에 테이블2를 표시
-- 주문 이력(bookSale)이 있는 고객의 이름(client)과 고객이 주문한 책 이름(book)을 출력
-- book <-> bookSale <-> client
SELECT c.clientName, b.bookName FROM bookSale bs INNER JOIN client c ON bs.clientNo = c.clientNo INNER JOIN book b ON bs.bookNo = b.bookNo;
-- 조인 조건에 맞는 레코드들의 모든 칼럼이 출력
-- JOIN과 ORDER BY절 사용
-- 도서를 주문한 고객의 이름(client), 모든 주문 정보(bookSale), 주문한 도서의 이름(book)을 조회 출력하되 bookNo를 기준으로 오름차순 정렬 ORDER BY
SELECT c.clientName, b.bookName, bs.bsNo, bs.bsDate, bs.clientNo, bs.bookNo FROM bookSale bs INNER JOIN client c ON bs.clientNo = c.clientNo INNER JOIN book b ON bs.bookNo = b.bookNo ORDER BY bs.bookNo;
-- bookNo가 두 개 테이블에 있으므로 별칭으로 구별. 단, ORDER BY는 SELECT된 결과로 정렬을 진행 ORDER BY절의 기준 열은 SELECT절에 나타난 테이블.칼럼을 사용해야 한다
-- JOIN과 GROUP BY절 사용
-- 고객별로 총 주문 수량을 계산 후 고객명과 총 주문 수량을 출력
-- bookSale 테이블만으로 작업하면 고객명이 없으므로 고객 번호만 이용할 수 있음
SELECT clientNo, SUM(bsQty) AS "총 주문 수량" FROM bookSale GROUP BY clientNo;
-- 고객명을 표현하려면 고객 테이블과 JOIN해야 함
-- SELECT절에 집계 함수와 일반 칼럼이 같이 나타나려면 
-- SELECT c.clientName, SUM(bsQty) AS "총 주문 수량" FROM bookSale bs INNER JOIN client c ON bs.clientNo = c.clientNo GROUP BY bs.clientNo; -- GROUP BY의 기준 열이어야 함, c.clientName은 기준 열로 사용하지 않았으므로 오류
-- SELECT절에 집계 함수와 일반 칼럼이 같이 나타나려면 
SELECT bs.clientNo, c.clientName, SUM(bsQty) AS "총 주문 수량" FROM bookSale bs INNER JOIN client c ON bs.clientNo = c.clientNo GROUP BY bs.clientNo, c.clientName; -- GROUP BY의 기준 열은 1개 이상으로 기준 열 처리가 가능
-- GROUP BY 기준 열 예시
-- 주문일인 bsDate가 중복이 하나도 없으므로 모든 레코드(튜플, 행)는 GROUP BY 없이 그대로 표현됨
-- SELECT절에 집계 함수와 일반 칼럼이 같이 나타나려면
SELECT bs.clientNo, c.clientName, SUM(bsQty) AS "총 주문 수량" FROM bookSale BS INNER JOIN client c ON bs.clientNo = c.clientNo GROUP BY bs.clientNo, c.clientName, bs.bsDate; -- GROUP BY의 기준 열은 1개 이상이므로 기준 열 처리가 가능
-- 칼럼들 간의 연산
-- 주문된 도서의 주문일, 고객명, 도서명, 도서 가격, 주문 수량, 주문액을 계산하여 출력하고 주문일 기준 오름차순 정렬
-- 주문액 계산 : 특정 책의 구매 권 수 * 책의 가격
-- 조인 연산(book, client, bookSale)
SELECT bs.bsDate, c.clientName, b.bookName, b.bookPrice, bs.bsQty FROM bookSale bs INNER JOIN client c ON c.clientNo = bs.clientNo INNER JOIN book b ON b.bookNo = bs.bookNo;
-- 주문된 도서의 주문일, 고객명, 도서명, 도서 가격, 주문 수량, 주문액을 계산하여 출력하고 주문일 기준 오름차순 정렬
-- 반환된 또는 JOIN에 의해 생성된 테이블의 칼럼들 간의 사칙 연산이 가능 : 칼럼명 * 칼럼명 -> 각 레코드별 칼럼끼리의 연산을 진행
SELECT bs.bsDate, c.clientName, b.bookName, b.bookPrice, bs.bsQty, b.bookPrice * bs.bsQty AS "주문액" FROM bookSale bs INNER JOIN client c ON c.clientNo = bs.clientNo INNER JOIN book b ON b.bookNo = bs.bookNo ORDER BY bs.bsDate;
-- 계산되어서 조회된 계산 열도 정렬의 기준 열로 사용
-- 주문된 도서의 주문일, 고객명, 도서명, 도서 가격, 주문 수량, 주문액을 계산하여 출력하고 주문액 기준 내림차순 정렬
SELECT bs.bsDate, c.clientName, b.bookName, b.bookPrice, bs.bsQty, b.bookPrice * bs.bsQty AS "주문액" FROM bookSale bs INNER JOIN client c ON c.clientNo = bs.clientNo INNER JOIN book b ON b.bookNo = bs.bookNo ORDER BY "주문액" DESC;
-- SELECT절에서는 계싼 열이지만 반환 후에는 테이블의 일반 열이기 때문에 당연히 정렬이 가능
------------------------------------------------------------------------------------------------------
-- JOIN 결과 테이블에 WHERE절 추가
-- JOIN절은 테이블을 구성하는 구분이기 때문에 WHERE절 이전에 나타남
-- SELECT ~ FROM ~ INNER JOIN ~ ON ~ WHERE ~ GROUP BY ~ HAVING ~ ORDER BY
-- 2020년 이후부터 현재까지 판매된 도서의 주문일, 고객명, 도서명, 도서 가격, 주문 수량, 주문액 계산해서 주문일 기준 내림차순 정렬하여 조회 출력
SELECT bs.bsDate, c.clientName, b.bookName, b.bookPrice, bs.bsQty, bs.bsQty * b.bookPrice AS "주문액" FROM bookSale bs INNER JOIN CLIENT c ON bs.clientNo = c.clientNo INNER JOIN book b ON bs.bookNo = b.bookNo WHERE bs.bsDate >= '2020-01-01' ORDER BY bs.bsDate DESC;
--------------------------------------------------------------------------------
-- 연습 문제
-- 2시까지, 완성된 쿼리 구문 슬랙에 공유
-- 1. 모든 도서에 대하여 도서의 도서 번호, 도서명, 출판사명 출력
SELECT b.bookNo, b.bookName, p.pubName FROM book b INNER JOIN publisher p ON b.pubNo = p.pubNo;
-- 2. '서울 출판사'에서 출간한 도서의 도서명, 저자명, 출판사명 출력(조건에 출판사명 사용)
SELECT b.bookName, b.bookAuthor, p.pubName FROM publisher p INNER JOIN book b ON b.pubNo = p.pubNo WHERE p.pubName = '서울 출판사';
-- 3. '정보 출판사'에서 출간한 도서 중 판매된 도서의 도서명 출력(중복된 경우 한 번만 출력)(조건에 출판사명 사용)
SELECT DISTINCT b.bookName FROM book b INNER JOIN publisher p ON b.pubNo = p.pubNo INNER JOIN bookSale bs ON b.bookNo = bs.bookNo WHERE p.pubName = '정보출판사';
-- 4. 도서 가격이 30,000원 이상인 도서를 주문한 고객의 고객명, 도서명, 도서 가격, 주문 수량 출력
SELECT c.clientName, b.bookName, b.bookPrice, bs.bsQty FROM bookSale bs INNER JOIN client c ON c.clientNo = bs.clientNo INNER JOIN book b on b.bookNo = bs.bookNo WHERE b.bookPrice >= 30000;
-- 5. '안드로이드 프로그래밍' 도서를 구매한 고객에 대하여 도서명, 고객명, 성별, 주소 출력(고객명으로 오름차순 정렬)
SELECT b.bookName, c.clientName, c.clientGender, c.clientAddress FROM bookSale bs INNER JOIN client c ON c.clientNo = bs.clientNo INNER JOIN book b ON b.bookNo = bs.bookNo WHERE b.bookName = '안드로이드 프로그래밍' ORDER BY c.clientName;
-- 6. '도서 출판 강남'에서 출간된 도서 중 판매된 도서에 대하여 '총 매출액' 출력 : SUM(매출액은 판매 권 수 * 책 단가)
-- 도서 출판 강남에서 출간된 도서의 건별 매출액
SELECT p.pubName, b.bookPrice, bs.bsQty, (b.bookPrice * bs.bsQty) AS "매출액" FROM book b INNER JOIN bookSale bs ON b.bookNo = bs.bookNo INNER JOIN publisher p ON p.pubNo = b.pubNo WHERE p.pubName = '도서출판 강남';
-- '도서 출판 강남'에서 출간된 도서 중 판매된 도서에 대하여 '총 매출액'
SELECT SUM(b.bookPrice * bs.bsQty) AS "도서 출판 강남의 총 매출액" FROM book b INNER JOIN bookSale bs ON b.bookNo = bs.bookNo INNER JOIN publisher p ON p.pubNo = b.pubNo WHERE p.pubName = '도서출판 강남';
-- 도서 출판 강남을 테이블의 칼럼 데이터로 반환
-- 집계 함수와 같이 표현되는 일반 열을 사용하려면 해당 열로 GROUP BY
SELECT p.pubName, SUM(b.bookPrice * bs.bsQty) AS "총 매출액" FROM book b INNER JOIN bookSale bs on b.bookNo = bs.bookNo INNER JOIN publisher p ON p.pubNo = b.pubNo WHERE p.pubName = '도서출판 강남' GROUP BY p.pubNo, p.pubName;
-- 7. '서울 출판사'에서 출간된 도서에 대하여 판매일, 출판사명, 도서명, 도서 가격, 주문 수량, 주문액 출력
SELECT bs.bsDate, p.pubName, b.bookName, bs.bsQty, (b.bookPrice * bs.bsQty) "주문액" FROM book b INNER JOIN bookSale bs ON b.bookNo = bs.bookNo INNER JOIN publisher p ON p.pubNo = b.pubNo WHERE pubName = '서울 출판사';
-- 8. 판매된 도서에 대하여 도서별(GROUP BY)로 도서 번호, 도서명, 총 주문 수량 출력
SELECT b.bookNo, b.bookName, SUM(bs.bsQty) "총 주문 수량" FROM bookSale bs INNER JOIN book b ON b.bookNo = bs.bookNo GROUP BY b.bookNo, b.bookName;
-- 9. 판매된 도서에 대하여 고객별(GROUP BY)로 고객명, 총 구매액(bookPrice * bsQty) 출력(총 구매액이 100,000원 이상인 경우만 해당 HAVING)
-- 건별 구매에 대한 구매액과 구매한 고객명
SELECT c.clientName, (b.bookPrice * bs.bsQty) "구매액" FROM bookSale bs INNER JOIN book b ON b.bookNo = bs.bookNo INNER JOIN client c ON c.clientNo = bs.clientNo;
-- 건별 구매에 대한 구매액과 구매한 고객명 조회, 단 구매액이 100000 이상인 경우만 조회
SELECT c.clientName, (b.bookPrice * bs.bsQty) "구매액" FROM bookSale bs INNER JOIN book b ON b.bookNo = bs.bookNo INNER JOIN client c ON c.clientNo = bs.clientNo WHERE (b.bookPrice * bs.bsQty) >= 100000;
-- 판매된 도서에 대하여 고객별(GROUP BY)로 고객명, 총 구매액(bookPrice * bsQty) 출력(총 구매액이 100,000원 이상인 경우만 해당 HAVING)
SELECT c.clientName, SUM(b.bookPrice * bs.bsQty) "총 구매액" FROM bookSale bs INNER JOIN book b ON b.bookNo = bs.bookNo INNER JOIN client c ON c.clientNo = bs.clientNo GROUP BY c.clientNo, c.clientName HAVING SUM(b.bookPrice * bs.bsQty) >= 100000;
-- WHERE절에서 먼저 건별 구매액이 10만 원 이상인 걸 추출하고 총 구매액을 구하게 됨, 건별 구매액이 10만 원 이하인 건 제외됨
SELECT c.clientName, SUM(b.bookPrice * bs.bsQty) "총 구매액" FROM bookSale bs INNER JOIN book b ON b.bookNo = bs.bookNo INNER JOIN client c ON c.clientNo = bs.clientNo WHERE (b.bookPrice * bs.bsQty) >= 100000 GROUP BY c.clientNo, c.clientName; -- GROUP BY 진행
-- HAVING SUM(b.bookPrice * bs.bsQty) >= 100000;
-- 10. 판매(bookSale)된 도서 중 '도서 출판 강남'에서(publisher) 출간한 도서에 대하여 고객명(CLIENT)
-- , 주문일, 도서명(book), 주문 수량, 출판사명 출력(고객명으로 오름차순 정렬)
-- 4개 테이블 조인 -> 조인 조건 3개
SELECT c.clientName, bs.bsDate, b.bookName, bs.bsQty, p.pubName FROM bookSale bs INNER JOIN client c ON c.clientNo = bs.clientNo INNER JOIN book b ON b.bookNo = bs.bookNo INNER JOIN publisher p ON p.pubNo = b.pubNo WHERE p.pubName = '도서출판 강남' ORDER BY c.clientName;
---------------------------------------------------------------------------------------------------
-- OUTER JOIN은 INNER JOIN이라면 제외되었을 데이터들을 전부 이용하겠다는 의미를 갖는다
-- client 테이블과 bookSale 테이블을 예로 들면 
-- INNER JOIN은 도서를 구매한 구매 고객의 정보
-- OUTER JOIN은 도서 구매 여부와 상관 없이 도서 정보와 구매 정보의 결합
-- 양쪽 연결 칼럼에 속성값이 같은 레코드가 없어도 검색해 조회
-- 조인 시 OUTER 방식으로 
-- 두 테이블의 clientNo가 같은 레코드도 추출하고 한쪽 테이블에는 clientNo가 있지만 다른 테이블에는 clientNo가 없어서 
SELECT * FROM client c FULL OUTER JOIN bookSale bs ON c.clientNo = bs.clientNo ORDER BY c.clientNo;