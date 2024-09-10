-- 다중 행 쿼리
-- 쿼리 결과로 반환되는 반환 값이 여러 개인 경우
SELECT clinetNo FROM client;
-- 단일 행 쿼리
-- 쿼리 결과로 반환되는 반환 값이 한 개인 경우
SELECT clientNo FROM client WHERE clientName = '메시';
-- 서브 쿼리
-- 하위 쿼리(질의) 또는 부속 쿼리(질의)라고도 함
-- 하나의 sql문 안에 다른 sql문이 중첩되어있음
-- 서브 쿼리를 1차 수행한 다음에 반환 값을 받아 다음 쿼리를 수행
-- 단일 행 서브 쿼리 예제 : 비교 연산자 사용 가능
-- 고객 호날두의 주문 수량 조회(join 연산으로도 가능함)
-- client 테이블과 bookSale 테이블이 필요
-- 1. client 테이블에서 clientName이 호날두인 레코드의 clientNo를 찾아서 
-- 2. bookSale 테이블에서 1번에서 찾은 clientNo에 해당하는 주문에 대해 
-- 주문일, 주문 수량 출력
-- sub query는 () 안에 작성해야 함
SELECT bsDate, bsQty, clientNo FROM bookSale WHERE clientNo = 
    (SELECT clientNo FROM client WHERE clientName = '호날두'); -- 반환 값은 단일 행이어야 에러가 없음
-- 고객 호날두가 주문한 총 주문 수량 확인
-- 1. client 테이블에서 clientName이 호날두인 레코드의 clientNo를 찾아서 
-- 2. bookSale 테이블에서 1번에서 찾은 clientNo에 해당되는 주문 수량의 총합(sum) 계산
SELECT SUM(bsQty) AS "총 주문 수량" FROM bookSale WHERE clientNo = 
    (SELECT clientNo FROM client WHERE clientName = '호날두');
-- 가장 비싼 도서의 도서명과 가격 출력
-- 1. book 테이블에서 가장 비싼 도서의 정보(도서 가격 중 가장 비싼 가격) 확인
-- 2. book 테이블에서 1번에서 확인한 정보에 해당되는 도서의 도서명과 가격을 출력
SELECT bookName, bookPrice FROM book WHERE bookPrice = 
    (SELECT MAX(bookPrice) FROM book); -- 함수 사용했으므로 단일 행 반환
-- 서점 도서의 평균 가격보다 비싼 도서의 도서명, 가격 출력
-- 1. 도서의 평균 가격을 구해서(subquery) 
-- 2. 1번에서 구한 평균 가격보다 비싼(>) 가격의 도서의 도서명, 가격 출력
-- subquery에서 함수 사용하면 무조건 단일 행이 반환 : 비교 연산자 사용 가능
-- 현재 저장된 도서의 평균 가격 : 26400
SELECT bookName, bookPrice FROM book WHERE bookPrice > 
    (SELECT AVG(bookPrice) FROM book);
------------------------------------------------------------------------------------------
-- 다중 행 서브 쿼리 : 비교 연산자 사용 불가, IN, NOT IN
-- 도서를 구매한 적이 있는 고객의 고객명 출력
-- 구매 정보 : bookSale
-- 고객명 : client
-- 구매 정보에 나타나는 고객(client)은 모두 도서를 구매한 이력이 있는 고객
-- 구매 이력이 있는 고객의 고객 번호 출력
SELECT clientNo FROM bookSale;
-- 1. bookSale 테이블에서 clientNo를 찾아서
    -- bookSale 테이블에 있는 clientNo는 모두 구매 이력이 있는 고객(1명 이상 ~ 여러 명) : 다중 행 반환
-- 2. client 테이블에서 1번에서 추출한 clientNo에 해당되는 고객의 이름을 출력
    -- 메인 쿼리에서 비교 연산자 사용 대신 IN, NOT IN 사용
    -- IN은 = OR를 대신하는 연산자
    -- clientNo = '3' OR clientNo = '7' OR..... 
    -- clientNo IN ('3', '7', ....)
SELECT clientNo, clientName FROM client WHERE clientNo IN 
    (SELECT clientNo FROM bookSale);

SELECT clientNo, clientName FROM client WHERE clientNo IN 
    (SELECT clientNo FROM bookSale);
-- 주의! 
-- 여러 행을 반환하는데 =(비교 연산자)로 받으면 오류
SELECT clientNo, clientName FROM client WHERE clientNo = 
    (SELECT clientNo FROM bookSale);
-- 비교 연산자를 사용해서 하위 질의(서브 쿼리)와 연결하면 구문 분석기는 단일 행 하위 질의가 나온다고 분석함
-- ORA-01427 : 단일 행 하위 질의에 2개 이상의 행이 리턴되었습니다. 
-- 01427. 00000 - "single-row subquery returns more than onew row"
-- 다중 행으로 반환될 것이 예상되면 IN 사용
-- 결론 : 애매할 때는 무조건 IN 사용(단 = 연산일 경우 해당, > < >= <=는 하위 질의에서 무조건 단일 행이 나와야 함)
-- 한 번도 주문한 적이 없는 고객의 고객 번호, 고객명 출력
-- 한 번이라도 주문한 고객을 먼저 추출하고 NOT으로 부정하면 한 번도 주문한 적이 없는의 의미
SELECT clientNo, clientName FROM client WHERE clientNo NOT IN 
    (SELECT clientNo FROM bookSale);
------------------------------------------------------------------------
-- 중첩 서브 쿼리
-- 도서명이 '안드로이드 프로그래밍'인 도서를 구매한 고객의 고객명을 출력
-- 1. 도서명이 '안드로이드 프로그래밍'인 도서의 도서 번호를 book table에서 찾아서 (2차 서브 쿼리)
-- 2. 1번에서 찾은 도서 번호를 구매한 고객의 고객 번호를 bookSale에서 찾아서 (1차 서브 쿼리)
-- 3. 2번에서 찾은 고객 번호를 client 테이블에서 찾아 고객명을 출력(메인 쿼리)
SELECT clientName FROM client WHERE clientNo IN 
    (SELECT clientNo FROM bookSale WHERE bookNo IN 
        (SELECT bookNo FROM book WHERE bookName = '안드로이드 프로그래밍'));
-- '안드로이드 프로그래밍'이라는 도서명의 도서 번호는 1개임(단일 행 반환) : = 연산자로 받아도 되지만 
-- '안드로이드 프로그래밍' 도서를 구매한 client는 2명(clientNo 7, 8)이므로 =으로 받으면 안 되고 IN으로 받아야 됨
SELECT clientName FROM client WHERE clientNo IN 
    (SELECT clientNo FROM bookSale WHERE bookNo = 
        (SELECT bookNo FROM book WHERE bookName = '안드로이드 프로그래밍')); -- 단일 행 반환이므로 = 사용해도 됨
SELECT clientName FROM client WHERE clientNo = 
    -- 다중 행 반환하므로 = 사용하면 오류 발생
    (SELECT clientNo FROM bookSale WHERE bookNo = 
        (SELECT bookNo FROM book WHERE bookName = '안드로이드 프로그래밍')); -- 단일 행 반환이므로 = 사용해도 됨
-------------------------------------------------------------------------------------
-- 다중 행 서브 쿼리에서 사용하는 EXISTS 연산자(단일 행도 사용 가능)
-- 서브 쿼리의 결과가 행을 반환하면(1개 이상) 상위 쿼리의 WHERE절이 참이 되는 연산자
-- 도서를 구매한 적이 있는 고객 : EXISTS 연산자 사용해서 질의 구성
-- 1. bookSale 테이블에서 조건에 해당되는 행이 존재하면 참 반환하게 됨
    -- 반환되는 결과에 칼럼명까지 포함되어서 clientNo라는 칼럼명과 실제 데이터가 반환됨
    -- EXISTS 연산자 사용 시 칼럼명을 명시하지 않는다
    -- 하위 쿼리에서 상위 쿼리 테이블의 칼럼을 사용한다
-- 2. client 테이블에서 하위 쿼리에서 반환된 행을 이용 고객 번호, 고객명 출력
-- bookSale에 나타나는 고객 번호는 도서를 구매한 이력이 있는 고객이기 때문에 IN 연산자를 이용하는 것이 일반적이지만 
-- 연습이므로 EXISTS를 이용해서 질의 구성
SELECT clientNo From bookSale WHERE client.clientNo = bookSale.clientNo; -- 서브 쿼리로 구성할 때만 진행됨, 상위 쿼리에서 client 테이블을 사용하고 있어야 하고, EXISTS 연산자로 연결되어야 함
SELECT clientNo, clientName FROM client WHERE EXISTS 
    (SELECT clientNo From bookSale WHERE client.clientNo = bookSale.clientNo); -- 하위 쿼리 WHERE절의 조건에 맞는 결과가 테이블 형태로 반환됨
-- IN 연산자 사용한 결과와 동일
SELECT clientNo, clientName FROM client WHERE clientNo IN 
    (SELECT clientNo FROM bookSale);
-- 한 번도 주문한 적이 없는 고객의 고객 번호, 고객명 출력 : NOT EXISTS
SELECT clientNo, clientName FROM client WHERE NOT EXISTS 
    (SELECT clientNo From bookSale WHERE client.clientNo = bookSale.clientNo); -- NOT IN을 사용한 것과 같은 결과가 나옴
-- IN과 EXISTS는 매우 유사한 연산자임
-- 단, NULL값을 추출하느냐 아니면 제외시키느냐에서 차이가 있음
-- 전체 고객의 취미 출력(IN과 EXISTS의 차이 확인하기 위한 예제 : 실제 개발에서는 이렇게 구성하면 안 됨)
SELECT clientHobby FROM client;
-- EXISTS 연산자와 subquery 이용해서 구성
-- 서브 쿼리 반환 결과에 null을 포함시키기 때문에 메인 쿼리에서 비교 시 null인 데이터도 포함되게 됨
SELECT clientHobby FROM client WHERE EXISTS 
    (SELECT clientHobby FROM client);
-- IN 연산자와 subquery 이용해서 구성 : 서브 쿼리 결과에 null값 포함되지 않음(공백 문자 데이터는 포함됨)
SELECT clientHobby FROM client WHERE clientHobby IN 
    (SELECT clientHobby FROM client);
------------------------------------------------------------- 
-- ALL
-- 검색 조건이 서브 쿼리 결과의 모든 값에 만족하면 참이 되는 연산자
-- 2번 고객이 주문한 도서의 최고 주문 수량보다 더 많은 도서를 구입한 고객의 
-- 고객 번호, 주문 번호, 주문 수량 출력
-- (2번 고객이 주문한 모든 주문에서 발생한 주문 수량보다 더 많이 주문한 고객)
-- 1. 2번 고객이 주문한 도서의 주문 수량
SELECT bsQty FROM bookSale WHERE clientNo = '2';
-- 2. 1번에서 추출한 주문 수량의 최대값보다 큰 주문 수량의 정보
SELECT clientNo, bsNo, bsQty FROM bookSale WHERE bsQty > -- bsQty > 5
    (SELECT MAX(bsQty) FROM bookSale WHERE clientNo = '2'); -- 2번 고객이 주문한 주문 수량 중 최대값을 구해서 하나의 값과 비교, 서브 쿼리에서 단일 행 반환
-- 3. 위 1, 2번 쿼리를 ALL 함수를 이용해서 구성
SELECT clientNo, bsNo, bsQty FROM bookSale WHERE bsQty > ALL -- bsQty > 2 AND bsQty > 5
    (SELECT bsQty FROM bookSale WHERE clientNo = '2'); -- 2번 고객이 주문한 주문 수량의 값 각각이 모두 비교, 서브 쿼리에서 다중 행 반환 ALL 연산자가 AND 연결된 수식을 연산하게 됨
-- ANY 연산자
-- 2번 고객보다 한 번이라도 더 많은 주문을 한 적이 있는 고객의 
-- 고객 번호, 주문 번호, 주문 수량 출력
SELECT clientNo, bsNo, bsQty FROM bookSale WHERE bsQty > 
    (SELECT MIN(bsQty) FROM bookSale WHERE clientNo = '2');
-- ANY 연산자 사용 : OR로 연결하는 것과 같음
-- 2번 고객 자신도 포함된 결과가 반환
SELECT clientNo, bsNo, bsQty FROM bookSale WHERE bsQty > ANY -- bsQty > 2 OR bsQty > 5
    (SELECT bsQty FROM bookSale WHERE clientNo = '2');
-- 2번 고객 정보 제외 후 출력 : 메인 쿼리에서 제외
SELECT clientNo, bsNo, bsQty FROM bookSale WHERE (bsQty > ANY -- bsQty > 2 OR bsQty > 5
    (SELECT bsQty FROM bookSale WHERE clientNo = '2') 
AND clientNo != '2');
-- ALL, ANY 연산자는 다중 행을 반환하는 서브 쿼리 결과에 비교 연산자를 사용할 수 있게 해줌
------------------------------------------------------------------------------------------------
/*
    서브 쿼리 연습 문제
    1. 호날두(고객명)가 주문한 도서의 총 구매량 출력
    2. '정보 출판사'에서 출간한 도서를 구매한 적이 있는 고개명 출력
    3. 베컴이 주문한 도서의 최고 주문 수량보다 더 많은 도서를 구매한 고객명 출력
    4. 서울에 거주하는 고객에게 판매한 도서의 총 판매량 출력
 */
 -- 1. 호날두(고객명)가 주문한 도서의 총 구매량 출력
 -- (1) client에서 고객명 '호날두'의 clientNo를 찾아서 
 -- (2) bookSale에서 (1)에서 찾은 clientNo의 총 구매 수량 출력
 SELECT SUM(bsQty) AS "호날두 고객 총 구매 수량" FROM bookSale WHERE clientNo = 
    (SELECT clientNo FROM client WHERE clientName = '호날두'); -- 고객 이름이 호날두인 고객은 1명이어서 = 연산자 사용
 -- = 대신 IN 연산자 사용 가능
 SELECT SUM(bsQty) AS "호날두 고객 총 구매 수량" FROM bookSale WHERE clientNo IN 
    (SELECT clientNo FROM client WHERE clientName = '호날두');
-- 2. '정보 출판사'에서 출간한 도서를 구매한 적이 있는 고개명 출력
-- (1) publisher에서 '정보 출판사'의 pubNo 찾아서 
-- (2) book에서 pubNo에 해당하는 bookNo 찾고 
-- (3) bookSale에서 이 bookNo를 주문한 clientNo 찾아서 
-- (4) client에서 이 clientNo의 고객명 출력
SELECT clientName FROM client WHERE clientNo IN 
    (SELECT clientNo FROM bookSale WHERE bookNo IN 
        (SELECT bookNo FROM book WHERE pubNo IN 
            (SELECT pubNo FROM publisher WHERE pubName = '정보 출판사')));
-- 현재 데이터에서는 '정보 출판사'가 1개이므로 IN 대신 = 연산자 사용 가능
SELECT clientName FROM client WHERE clientNo IN 
    (SELECT clientNo FROM bookSale WHERE bookNo IN 
        (SELECT bookNo FROM book WHERE pubNo = 
            (SELECT pubNo FROM publisher WHERE pubName = '정보 출판사')));
-- 3. 베컴이 주문한 도서의 최고 주문 수량보다 더 많은 도서를 구매한 고객명 출력
-- (1) client에서 '베컴'의 clientNo를 찾아서 
-- (2) bookSale이 clientNo가 주문한 주문 수량(여러 번 주문했다면 여러 겆 모두 찾기) 찾고 
-- (3) 이 주문 수량 중 최고 주문 수량보다 큰 주문 수량을 주문한 고객의 clientNo 찾아서(ALL 연산자 사용) 
-- (4) client에서 고객명 출력
-- 베컴은 한 번 2권의 도서를 주문함, 결국 2권 초과하는 도서를 주문한 고객의 이름을 출력
SELECT clientName FROM client WHERE clientNo IN 
    (SELECT clientNo FROM bookSale WHERE bsQty > ALL 
        (SELECT bsQty FROM bookSale WHERE clientNo = 
            (SELECT clientNo FROM client WHERE clientName = '베컴'))); -- 베컴 고객은 1명이므로 = 연산자 사용 가능, IN 연산자를 써도 무방함
-- 4. 서울에 거주하는 고객에게 판매한 도서의 총 판매량 출력
-- (1) client에서 '서울'에 거주하는 고객의 clientNo를 찾아서 
-- (2) bookSale에서 이 clientNo가 주문한 총 주문 수량(총 판매량) 계산
SELECT SUM(bsQty) AS "총 판매량" FROM bookSale WHERE clientNo IN 
    (SELECT clientNo FROM client WHERE clientAddress = '서울');
-- 서울에 거주하는을 표현하기 위해 LIKE 사용 : 원 주소는 XX시 XX구 XX동이거나 XX도 XX시 XX구
SELECT SUM(bsQty) AS "총 판매량" FROM bookSale WHERE clientNo IN 
    (SELECT clientNo FROM client WHERE clientAddress LIKE '%서울%');
-- EXISTS 사용(주의! : 외래 키 제약 조건 비교 구문 반드시 필요 = WHERE절에)
SELECT SUM(bsQty) AS "총 판매량" FROM bookSale WHERE EXISTS 
    (SELECT clientNo FROM client WHERE client.clientNo = bookSale.clientNo AND clientAddress LIKE '서울');
-- EXISTS 연산자 사용 시 외래 키 조건을 제외한 다른 명시적 조건이 있다면 외래 키 제약 조건과는 AND로 연결되어야 함
----------------------------------------------------------- 
-- 스칼라 서브 쿼리
    -- SELECT절에서 사용
    -- 결과 값을 단일 열의 스칼라 값으로 반환(개발자가 스칼라값으로 반환되도록 구성해야 함)
-- 고객별로 고객 번호(bookSale, client), 고객 이름(client), 총 주문 수량(bookSale) 출력
-- 고객 이름 제외하고 출력한다면 
SELECT clientNo, SUM(bsQty) AS "총 주문 수량" FROM bookSale GROUP BY clientNo;
-- 스칼라 서브 쿼리 활용 고객 이름까지 출력
-- 참조되는 테이블이 두 개 이상이면 반드시 외래 키 제약의 비교 조건을 WHERE절에 표현해야 함
SELECT clientNo, 
    (SELECT clientName FROM client WHERE client.clientNo = bookSale.clientNo) 
AS "고객명" ,SUM(bsQty) AS "총 주문 수량" FROM bookSale GROUP BY clientNo;
-- 인라인 뷰 서브 쿼리
    -- FROM절에서 사용
    -- 전체 테이블 대신 인라인 뷰 서브 쿼리 결과(가상 테이블) 사용
    -- JOIN 진행 시 JOIN되는 테이블들에서 특정 조건에 맞는 데이터들만 조인하고자 한다면 인라인 뷰 사용
-- 도서 가격이 25,000원 이상인 도서에 대하여 
-- 도서별(GROUP BY)로 도서명(book), 총 판매 수량(bookSale), 총 판매액(bookSale, book) 출력
-- book 테이블과 bookSale 테이블을 JOIN할 때 도서 가격이 25000 이상인 도서 데이터에 대해서만 JOIN을 진행
-- 일반 테이블 이용한 조인
-- 모든 정보를 이용 JOIN하고 
-- JOIN된 데이터에서 가격이 25000 이상인 도서를 필터링
SELECT bookName, bookPrice, SUM(bsQty) AS "총 판매 수량", SUM(bookPrice * bsQty) AS "총 판매액" FROM book, bookSale WHERE book.bookNo = bookSale.bookNo AND bookPrice >= 25000 GROUP BY book.bookNo, book, bookName, book.bookPrice;
-- 인라인 뷰를 사용한 조인
SELECT bookName, bookPrice, SUM(bsQty) AS "총 판매 수량", SUM(bookPrice * bsQty) AS "총 판매액" FROM 
    (SELECT bookNo, bookName, bookPrice FROM book WHERE bookPrice >= 25000) -- 전체 데이터가 아닌 가격이 25000 이상인 데이터만 조인을 진행하게 됨, 조인에 참여하는 데이터가 줄어들어 성능이 좋아짐
AS book, bookSale WHERE book.bookNo = bookSale.bookNo AND bookPrice >= 25000 GROUP BY book.bookNo, book, bookName, book.bookPrice ORDER BY "총 판매액" DESC; -- JOIN된 데이터에서 가격이 25000 이상인 도서를 필터링
