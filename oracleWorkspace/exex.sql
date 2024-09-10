-- ‘안드로이드 프로그래밍’ 도서를 구매한 고객에 대하여 도서명, 고객명, 성별, 주소 출력 (고객명으로 오름차순 정렬)
SELECT b.bookName, c.clientName, c.clientGender, c.clientAddress
    FROM bookSale bs 
    INNER JOIN book b ON bs.bookNo = b.bookNo 
    INNER JOIN client c ON bs.clientNo = c.clientNo
        WHERE b.bookName = '안드로이드 프로그래밍'
        ORDER BY c.clientName;

-- bookprice, pubname, bsqty
-- ‘도서출판 강남’에서 출간된 도서 중 판매된 도서에 대하여 ‘총 매출액’ 출력
SELECT SUM(b.bookPrice * bs.bsQty) AS "도서 출판 강남의 총 매출액" FROM book b INNER JOIN bookSale bs ON b.bookNo = bs.bookNo INNER JOIN publisher p ON b.pubNo = p.pubNo WHERE p.pubName = '도서출판 강남';

-- pubName bsDate bookName bookPrice, bsQty, 
-- ‘서울 출판사’에서 출간된 도서에 대하여 판매일, 출판사명, 도서명, 도서가격, 주문수량, 주문액 출력
SELECT bs.bsDate, p.pubName, b.bookName, b.bookPrice, bs.bsQty, bs.bsQty * b.bookPrice FROM book b
    INNER JOIN bookSale bs ON b.bookNo = bs.bookNo
    INNER JOIN publisher p ON b.pubNo = p.pubNo
        WHERE p.pubName = '서울 출판사';


-- book booksale
-- 판매된 도서에 대하여 도서별로 도서번호, 도서명, 총 주문 수량 출력

SELECT b.bookNo, b.bookName, SUM(bs.bsQty) "총 주문 수량" FROM book b 
    INNER JOIN bookSale bs ON b.bookNo = bs.bookNo
    GROUP BY b.bookNo, b.bookName;

-- client, book, booksale
-- 판매된 도서에 대하여 고객별로 고객명, 총구매액 출력 ( 총구매액이 100,000원 이상인 경우만 해당) (총구매액=총판매액=총주문액)

SELECT c.clientName, bs.bsQty * b.bookPrice AS "총 구매액" FROM bookSale bs
    INNER JOIN book b ON bs.bookNo = b.bookNo
    INNER JOIN client c ON bs.clientNo = c.clientNo
        GROUP BY c.clientName, bs.bsQty * b.bookPrice HAVING bs.bsQty * b.bookPrice >= 100000;


-- client, booksale, book, pub
-- 판매된 도서 중 ‘도서출판 강남’에서 출간한 도서에 대하여 고객명, 주문일, 도서명, 주문수량, 출판사명 출력 (고객명으로 오름차순 정렬)

SELECT c.clientName, bs.bsDate, b.bookName, bs.bsQty, p.pubName FROM book b
    INNER JOIN bookSale bs ON b.bookNo = bs.bookNo
    INNER JOIN publisher p ON b.pubNo = p.pubNo 
    INNER JOIN client c ON bs.clientNo = c.clientNo
        WHERE p.pubNAme = '도서출판 강남' AND bs.bsQty > 0
        ORDER BY c.clientName;
