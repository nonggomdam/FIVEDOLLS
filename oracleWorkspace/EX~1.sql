create table customer (
    custNo varchar2(10) not null primary key,
    custName varchar2(30) not null,
    custTel varchar2(30)
);

alter table customer modify custTel varchar2(30) not null;

alter table customer add (custGender varchar2(30), custAge number);

insert all into customer values ('1', '홍길동', '000-111-2222', '남', 20)
            into customer values ('2', '성춘향', '010-1234-5678', '여', 23)
            into customer values ('3', '이몽룡', '011-555-5555', '남', 17)
select * from dual;

update customer set custTel = '010-8765-4321' where custName = '홍길동';

delete from customer where custAge < 20;

select * from customer;