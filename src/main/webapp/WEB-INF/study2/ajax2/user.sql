show tables;

create table user (
	idx int not null auto_increment primary key , /*user 고유번호*/
	mid varchar(20) not null,
	name varchar(20) not null,
	age int default 20,
	address varchar(10)
);

desc user;

insert into user values (default, 'admin', '관리자', 40, '서울');
insert into user values (default, 'hkd1234', '홍길동', 20, '한양');
insert into user values (default, 'go123', '고윤정', 28, '서울');

select * from user;