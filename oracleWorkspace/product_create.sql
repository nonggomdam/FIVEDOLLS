--------------------------------------------------------
-- 파일이 생성됨 - 금요일-8월-02-2024   
--------------------------------------------------------
--------------------------------------------------------
-- DDL for TABLE product
--------------------------------------------------------
CREATE TABLE product (
    prdNo VARCHAR2(4 BYTE), 
    prdName VARCHAR2(40 BYTE), 
    prdPrice NUMBER(8, 0), 
    prdMaker VARCHAR2(30 BYTE), 
    prdColor VARCHAR2(20 BYTE), 
    ctgNo NUMBER(3, 0)
);
--------------------------------------------------------
-- DDL for INDEX P_K_product_prdNo
--------------------------------------------------------
CREATE UNIQUE INDEX P_K_product_prdNo ON product (prdNo) PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS STORAGE (INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) TABLESPACE users;
--------------------------------------------------------
-- CONSTRAINTS for TABLE product
--------------------------------------------------------
ALTER TABLE product ADD CONSTRAINT P_K_product_prdNo PRIMARY KEY (prdNo) USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS STORAGE (INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) TABLESPACE users ENABLE;
---------------------------------------------------------------------------
INSERT INTO product (prdNo, prdName, prdPrice, prdMaker, prdColor, ctgNo) VALUES ('1','삼성 냉장고 비스포크',1620000,'삼성 전자','새틴 코럴',1);
INSERT INTO product (prdNo, prdName, prdPrice, prdMaker, prdColor, ctgNo) VALUES ('2','LG 디오스 와인 셀러',1367000,'LG 전자','검정',1);
INSERT INTO product (prdNo, prdName, prdPrice, prdMaker, prdColor, ctgNo) VALUES ('3','QLED 8K TV',2175000,'삼성 전자','블랙',1);
INSERT INTO product (prdNo, prdName, prdPrice, prdMaker, prdColor, ctgNo) VALUES ('4','올레드 TV 55',799000,'LG 전자','검정',1);
INSERT INTO product (prdNo, prdName, prdPrice, prdMaker, prdColor, ctgNo) VALUES ('5','UHD TV',2250000,'삼성 전자','은색',1);
INSERT INTO product (prdNo, prdName, prdPrice, prdMaker, prdColor, ctgNo) VALUES ('6','유아용 세 발 자전거',76000,'삼천리 자전거','빨강',3);
INSERT INTO product (prdNo, prdName, prdPrice, prdMaker, prdColor, ctgNo) VALUES ('7','로드 사이클 자전거',150000,'알톤','검정',3);
INSERT INTO product (prdNo, prdName, prdPrice, prdMaker, prdColor, ctgNo) VALUES ('8','여성용 클래식 자전거',100000,'알톤','핑크',3);
INSERT INTO product (prdNo, prdName, prdPrice, prdMaker, prdColor, ctgNo) VALUES ('9','노트북9 metal',1390000,'도시바','은색',2);
INSERT INTO product (prdNo, prdName, prdPrice, prdMaker, prdColor, ctgNo) VALUES ('10','HP 게이밍 노트북',1200000,'HP','흰색',2);
INSERT INTO product (prdNo, prdName, prdPrice, prdMaker, prdColor, ctgNo) VALUES ('11','32인치 LED 모니터',299000,'LG 전자','검정',2);
INSERT INTO product (prdNo, prdName, prdPrice, prdMaker, prdColor, ctgNo) VALUES ('12','광시야각 LED 모니터',195000,'삼성 전자','흰색',2);
INSERT INTO product (prdNo, prdName, prdPrice, prdMaker, prdColor, ctgNo) VALUES ('13','등산 배낭 옵티마',68000,'밀레','자주',4);
INSERT INTO product (prdNo, prdName, prdPrice, prdMaker, prdColor, ctgNo) VALUES ('14','35L 등산 배낭',49000,'(주)셀파','노랑',4);
INSERT INTO product (prdNo, prdName, prdPrice, prdMaker, prdColor, ctgNo) VALUES ('15','원 터치 자동 텐트',58000,'이지 트래블러','그린',4);