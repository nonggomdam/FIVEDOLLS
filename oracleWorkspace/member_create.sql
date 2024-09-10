--------------------------------------------------------
-- 파일이 생성됨 - 금요일-8월-02-2024
--------------------------------------------------------
--------------------------------------------------------
-- DDL for Table MEMBER
--------------------------------------------------------
CREATE TABLE member (
    memId VARCHAR2(20 BYTE), 
    memPwd VARCHAR2(20 BYTE),
    memName VARCHAR2(40 BYTE), 
    memEmail VARCHAR2(40 BYTE), 
    memJoinDate VARCHAR2(40 BYTE)
);
INSERT INTO member (memId, memPwd, memName, memEmail, memJoinDate) VALUES ('001','1234','홍길동','a@a.a','2004-01-01');
INSERT INTO member (memId, memPwd, memName, memEmail, memJoinDate) VALUES ('002','1234','김철수','b@b.b','2004-02-02');
INSERT INTO member (memId, memPwd, memName, memEmail, memJoinDate) VALUES ('003','1234','강길동','c@c.c','2004-03-03');