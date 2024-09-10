--------------------------------------------------------
-- 파일이 생성됨 - 목요일-8월-29-2024   
--------------------------------------------------------
--------------------------------------------------------
-- DDL for TABLE member
--------------------------------------------------------
CREATE TABLE member (
    memId VARCHAR2(10), 
    memPwd VARCHAR2(20), 
    memName VARCHAR2(30), 
    memEmail VARCHAR2(30), 
    memJoinDate DATE DEFAULT SYSDATE, 
    memHp VARCHAR2(13), 
    memZipCode VARCHAR2(13), 
    memAddress1 VARCHAR2(30), 
    memAddress2 VARCHAR2(30)
);
INSERT INTO member (memId, memPwd, memName, memEmail, memJoinDate, memHp, memZipCode, memAddress1, memAddress2) VALUES ('hong', '1234', '홍길동', 'hkd@naver.com', TO_DATE('2024-08-29', 'YYYY-MM-DD'), '010-1234-1234', '12345', '서울 강남구', '11번지');
INSERT INTO member (memId, memPwd, memName, memEmail, memJoinDate, memHp, memZipCode, memAddress1, memAddress2) VALUES ('lee', '1234', '이몽룡', 'lee@naver.com', TO_DATE('2024-08-29', 'YYYY-MM-DD'), '010-1111-1111', '12345', '경기 안양시', '100번지');
INSERT INTO member (memId, memPwd, memName, memEmail, memJoinDate, memHp, memZipCode, memAddress1, memAddress2) VALUES ('sch', '1234', '성춘향', 'sch@naver.com', TO_DATE('2024-08-29', 'YYYY-MM-DD'), '010-2222-2222', '12345', '제주 제주시', '1번지');
INSERT INTO member (memId, memPwd, memName, memEmail, memJoinDate, memHp, memZipCode, memAddress1, memAddress2) VALUES ('cha', '1234', '차철수', 'cha@naver.com', TO_DATE('2024-08-29', 'YYYY-MM-DD'), '010-3333-3333', '12345', '인천 강화군', '50번지');
---------------------------------------------------------
--  CONSTRAINTS for TABLE member
--------------------------------------------------------
ALTER TABLE member MODIFY (memId NOT NULL ENABLE);
ALTER TABLE member ADD CONSTRAINT member_PK PRIMARY KEY (memId);