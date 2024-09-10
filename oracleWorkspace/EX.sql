select * from book;
alter table book drop column pubNo;

alter table book add (pubName VARCHAR(20));

insert all into book values ('9', 'JAVA 프로그래밍', '김떙떙', 30000, '2022-03-10', '서울 출판사')
            into book values ('10', '파이썬 데이터 과학', '떙떙', 24000, '2021-02-05', '강남 출판사')
select * from dual;


update book set bookPrice = 22000 where bookName = '자바';
delete from book where bookDate >= '2021-01-01' and bookDate <= '2021-12-31';