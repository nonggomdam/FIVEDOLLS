-- 상품 분류 테이블
CREATE TABLE category (
    ctgId VARCHAR2(2) NOT NULL PRIMARY KEY,
    ctgName VARCHAR2(30)
);
INSERT INTO category VALUES('1', '노트북');
INSERT INTO category VALUES('2', '프린터');
INSERT INTO category VALUES('3', '마우스');
INSERT INTO category VALUES('4', '키보드');
SELECT * FROM category;
-- 상품 테이블
CREATE TABLE product (
    prdNo VARCHAR(10) NOT NULL PRIMARY KEY, 
    prdName VARCHAR(100) NOT NULL, 
    prdPrice INT, 
    prdCompany VARCHAR(50), 
    prdStock INT, 
    prdDescript VARCHAR2(500), 
    prdImg VARCHAR2(30), 
    ctgId VARCHAR2(2), 
    
    CONSTRAINT FK_porduct_category FOREIGN KEY (ctgId) REFERENCES category(ctgId)
);
INSERT INTO product VALUES('1001', 'LG 울트라 기어', 1599000, 'LG 전자', 10, '대화면으로 즐기는 강력한 퍼포먼스, 듀얼 스토리지로 확장 자유롭게! ', '1001.jpg', '1');
INSERT INTO product VALUES('1002', 'LG 그램', 1929000, 'LG 전자', 5, 'LG 그램 17인치 2019 고사양 i7 풀 옵션 노트북', '1002.jpg', '1');
INSERT INTO product VALUES('1003', '삼성 노트북9', 1139000, '삼성 전자', 7, '삼성 노트북9 NT930XBV-A58A+WIN10 정품 설치_ICT', '1003.jpg', '1');
INSERT INTO product VALUES('1004', '삼성 노트북5', 939020, '삼성 전자', 7, '삼성 노트북5 METAL NT560XBE-K54A 위스키 레이크 NS', '1004.jpg', '1');
INSERT INTO product VALUES('1005', '맥북 프로', 2496600, '애플', 5,'맥북 프로 13형 512GB Silver MV9ZKH/A 터치 바', '1005.jpg', '1');
INSERT INTO product VALUES('1006', '애플 노트북', 1809000, '애플', 2, '애플 노트북 맥북 프로 13형', '1006.jpg', '1');
INSERT INTO product VALUES('1007', '삼성 SL-J1660', 71900, '삼성 전자', 12, '삼성 SL=J1660 잉크젯 복합기 + 무한 잉크 공급기', '1007.jpg', '2');
INSERT INTO product VALUES('1008', '제록스 P265DW', 149000, '제록스', 7, '제록스 P2565DW 와이파이 레이저 프린터 가정용 프린트', '1008.jpg', '2');
INSERT INTO product VALUES('1009', '엡손 L6160', 299000, '엡손', 4, '엡손 L6160 무한 잉크 복합기 인쇄 + 복사 + 스캔 + 네트워크', '1009.jpg', '2');
INSERT INTO product VALUES('1010', 'HP M254dw', 99500, 'HP', 5, 'HP M254dw 컬러 프린터 자동 양면 인쇄 기본 토너 포함 /KH', '1010.jpg', '2');
INSERT INTO product VALUES('1011', 'M331 무소음 무선 마우스', 24900, '로지텍 코리아', 5, '무소음, 긴 배터리 수명, 플러그 앤 플레이 연결방식, 자유로운 무선 연결', '1011.jpg', '3');
INSERT INTO product VALUES('1012', 'MS 모던 모바일 마우스', 39900, '마이크로소프트', 20, '마이크로소프트 정품 인증, 가볍고 휴대가 편한 모던한 디자인의 모바일 마우스. 어느 표면에서도 작동하는 블루 트랙 기술 적용', '1012.jpg', '3');
INSERT INTO product VALUES('1013', '맥스틸 TRONG G10 PRO', 22900, '맥스틸', 10, '맥스틸 TRON G10 PRO Rebom 화이트 게이밍 마우스', '1013.jpg', '3');
INSERT INTO product VALUES('1014', '아이리버 EQwear-V10', 10890, '아이리버', 10, '아이리버 EQwear-V10 무소음 마우스', '1014.jpg', '3');
INSERT INTO product VALUES('1016', '컴썸 VENOM-9', 49000, '컴썸', 7, '컴썸 VENOM-9 레인보우 LED 게이밍 기계식 키보드 청축', '1016.jpg', '4');
INSERT INTO product VALUES('1015', '아이리버 IR-WMK5000', 26900, '아이리버', 15, '아이리버 IR-WMK5000 무선 키보드 마우스 set 키 스킨 증정', '1015.jpg', '4');
INSERT INTO product VALUES('1017', '무선 키보드 MXKEYS', 139000, '로지텍 코리아', 7, '로지텍 코리아 정품 무선 키보드 MX KEYS', '1017.jpg', '4');
INSERT INTO product VALUES('1018', 'SKP-900B 유선 키보드 마우스 세트', 19200, '삼성 전자', 3, '삼성 전자 정품 신제품 SKP-900B 유선 키보드 마우스 세트', '1018.jpg', '4');
-- 장 바구니 테이블
CREATE TABLE cart (
    cartNo NUMBER GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1 NOT NULL PRIMARY KEY,
    memId VARCHAR(10),
    prdNo VARCHAR(10),
    cartQty INT,
    
    CONSTRAINT FK_cart_member FOREIGN KEY (memId) REFERENCES member(memId),
    CONSTRAINT FK_cart_product FOREIGN KEY(prdNo) REFERENCES product(prdNo)                    
);
-- 주문 테이블
CREATE TABLE order_info (
    ordNo VARCHAR(20) NOT NULL PRIMARY KEY, 
    ordDate TIMESTAMP DEFAULT SYSDATE, 
    memId VARCHAR(10), 
    ordReceiver VARCHAR(30), 
    ordRcvZipcode VARCHAR(6), 
    ordRcvAddress1 VARCHAR(50), 
    ordRcvAddress2 VARCHAR(50), 
    ordRcvPhone VARCHAR(14), 
    ordRcvMsg VARCHAR(30), 
    ordPay VARCHAR(30), 
    
    CONSTRAINT FK_order_member FOREIGN KEY (memId) REFERENCES member(memId)
);
-- 주문 상품 및 수량
CREATE TABLE order_product (
    ordNo VARCHAR2(20), 
    prdNo VARCHAR2(10), 
    ordQty INT, 
    
    CONSTRAINT FK_order_product FOREIGN KEY (prdNo) REFERENCES product(prdNo),
    CONSTRAINT FK_order_prd_info FOREIGN KEY (ordNo) REFERENCES order_info(ordNo)
);