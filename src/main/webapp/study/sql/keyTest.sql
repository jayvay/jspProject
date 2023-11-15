show tables;

/* 기본 키(Primary key) 
	테이블을 대표하는 키로서, 중복을 허용하지 않는다.
	기본 키는 여러 개를 사용할 수 있다. 
*/

create table test1 (
	idx int not null auto_increment primary key,
	name varchar(20) not null,
	age int default 20,
	address varchar(50)
);
desc test1;

/* 테이블의 구조 변경(추가/변경/삭제/테이블명변경) : alter table ~~~ 명령어 ~~~ */
alter table test1 add column job varchar(10);
alter table test1 modify column job varchar(15);
alter table test1 change column job jikup varchar(20);
alter table test1 drop column jikup;
alter table test1 rename tt1;
desc tt1;

create table test2 (
	idx int not null auto_increment primary key,
	name varchar(20) not null,
	age int default 20,
	test2Code varchar(10),
	/* primary key(idx) */
	/* primary key(idx, test2Code) */
	unique key (test2Code)
);
desc test2;
drop table test2;

insert into test2 values (default, '하이찬', 20, 'aaa');
insert into test2 values (default, '하은결', 20, 'bbb');
select * from test2;

-- test2 테이블에 기본키를 추가로 정의 (안 됨)
alter table test2 add primary key (test2Code);

/* unique key : 중복 불허 설정 키
		기본 키를 대신 중복 불허시킬 때 사용
*/
create table test3 (
	idx int not null auto_increment primary key,
	name varchar(20) not null,
	age int default 20,
	test3Code varchar(10) not null,
	unique key (test3Code)
);
desc test3;
drop table test3;

insert into test3 values (default, '가가가', 25, 'bbb');
insert into test3 values (default, '나나나', 26, 'ccc');
insert into test3 values (default, '다다다', 27, 'ddd');
select * from test3;

/* 외래 키(Foreign key)
 		하나의 테이블에서 다른 테이블의 정보를 찾기 위해 연결해주는 역할로 지정하는 키
 		조건, 현재 테이블의 필드를 외래키로 설정하려면? 상대쪽 테이블의 해당필드는 Primary key이거나 Unique key로 설정되어 있어야 하고,
    해당 필드는 상대편 테이블의 필드의 속성과 같아야 한다.
	*/

/*
create table test4 (
	idx int not null auto_increment primary key,
	name varchar(20) not null,
	age int default 20,
	test2Code varchar(10),
	test3Code varchar(10),
	foreign key (idx, test2Code) references test2 (idx, test2Code)
);
 */
create table test4 (
	idx int not null auto_increment primary key,
	name varchar(20) not null,
	age int default 20,
	test2Code varchar(10),
	test3Code varchar(10),
	test4Code varchar(10),
	unique key (test4Code),
	foreign key (test2Code) references test2 (test2Code),
	foreign key (test3Code) references test3 (test3Code)
);
desc test4;
drop table test4;

-- insert into test4 values (default, '봉미선', 29, 'mbc' , 'aaa', '서울'); 외래키 test2Code,test3Code 필드 내용과 다르면 등록 불가
insert into test4 values (default, '봉미선', 29, 'aaa', 'bbb', '서울');
insert into test4 values (default, '신형만', 35, 'bbb', 'ccc', '떡잎마을');
select * from test4;

create table test5 (
	idx int not null auto_increment primary key,
	name varchar(20),
	age int default 20,
	test2Code varchar(10),
	test3Code varchar(10),
	test4Code varchar(10),
	unique key (test2Code, test3Code),
	unique key (test4Code),
	foreign key (test2Code) references test2 (test2Code),
	foreign key (test3Code) references test3 (test3Code),
	foreign key (test4Code) references test4 (test4Code)
);
desc test5;
drop table test5;

insert into test5 (idx,test2Code,test3Code,test4Code) values (default,'aaa','bbb','ccc');