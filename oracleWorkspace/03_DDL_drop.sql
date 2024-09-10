-- DROP
-- 테이블 삭제 : 스키마 도메인 테이블 뷰 인덱스 등을 삭제하는 명령문
-- DROP TABLE 테이블명; -- 무조건 삭제 BUT, 제약 조건이 있는 테이블이면 확인해서 삭제 여부를 결정 - 안 되면 오류
-- publisher 테이블을 삭제 : book 테이블의 참조되는 테이블
DROP TABLE publisher;
-- ORA-02449 : 외래 키에 의해 참조되는 고유/기본 키가 테이블에 있습니다
-- 원칙적으로는 참조하는 테이블에 대해서 제약 조건을 없애던가 참조하는 테이블 삭제하고 참조되는 테이블을 삭제하는 게 원칙
-- 제약 조건(외래 키) 무시하고 참조되는 테이블을 강제 삭제 : CASCADE CONSTRAINTS
-- 위험해서 권장하지 않지만 연습용으로 실행
DROP TABLE publisher CASCADE CONSTRAINTS;
-- Table PUBLISHER이(가) 삭제되었습니다. 