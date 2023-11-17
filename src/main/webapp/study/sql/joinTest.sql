show tables;

/* 학과(hakkwa) 테이블 */
create table hakkwa (
	code int not null primary key,	 -- 학과 코드
	name varchar(20)	 							 -- 학과명
);
desc hakkwa;
drop table hakkwa;

-- unique key로 name을 추가하세요
alter table hakkwa add unique key (name);

insert into hakkwa values (101, '컴퓨터공학과');
insert into hakkwa values (102, '멀티미디어과');
insert into hakkwa values (103, '경영학과');
insert into hakkwa values (104, '생물학과');
insert into hakkwa values (105, '기계공학과');
insert into hakkwa values (106, '영어영문학과');
insert into hakkwa values (107, '국어국문학과');
select * from hakkwa;

/* 학생 정보 테이블 */
create table student (
	st_code int not null auto_increment primary key, -- 학생 고유번호
	name varchar(20) not null, 	-- 학생 성명
	hakkwa_code int,						-- 학과 코드 
	age int default 20,					-- 학생 나이
	foreign key (hakkwa_code) references hakkwa(code)
	on update cascade
	on delete set null
);
desc student;
drop table student;

insert into student values (default, '하이찬', 101, default);
insert into student values (default, '하은결', 101, default);
insert into student values (default, '최세경', 103, default);
insert into student values (default, '윤청아', 104, default);
insert into student values (default, '이시국', 105, default);
insert into student values (default, '강현율', 106, default);
insert into student values (default, '노세범', 106, default);
insert into student values (default, '오마주', 101, default);
insert into student values (default, '연습이', 107, default);
select * from student;

-- 현재 시스템(존재하는 모든 데이터베이스)의 모든 제약 조건을 확인할 때
select * from information_schema.table_constraints;
select * from information_schema.table_constraints where constraint_schema = 'javaProject' and table_name = 'student';

update hakkwa set code = 107 where code = 105;
update hakkwa set code = 108 where code = 101;
update hakkwa set code = 108 where code = 103;
delete from hakkwa where code = 101;


/* Join (관련된 테이블 간의 정보를 검색 처리할 때 사용) */
-- 일반 조인(Inner Join) : 각 테이블에는 서로 매칭이 되는 필드가 포함되어 있어야 한다.
select * from hakkwa;
select * from student;

select * from hakkwa inner Join student;

select * from hakkwa Inner Join student on hakkwa.code = student.hakkwa_code;
select * from hakkwa Join student on hakkwa.code = student.hakkwa_code;
select * from hakkwa as h Inner Join student as s on h.code = s.hakkwa_code;
select * from hakkwa as h, student as s where h.code = s.hakkwa_code;

/* 내부 조인 : LEFT JOIN, RIGHT JOIN */
-- LEFT JOIN(왼쪽 기준) : 왼쪽 자료를 모두 가져오고, 오른쪽은 만족하는 것만 가져온다. 없으면 NULL로 채운다.
select * from hakkwa h left outer join student s on h.code = s.hakkwa_code;
-- RIGHT JOIN(오른쪽 기준) : 오른쪽 자료를 모두 가져오고, 왼쪽은 만족하는 것만 가져온다. 없으면 NULL로 채운다.
select * from hakkwa h right outer join student s on h.code = s.hakkwa_code;

/* Cross Join (곱집합) : 모든 행의 자료들을 다 가져온다. */
select * from hakkwa, student;

/* Full outer Join (합집합) MySQL에는 없음, MySQL에서는 UNION 명령을 사용한다. */
select * from hakkwa h left outer join student s on h.code = s.hakkwa_code
union
select * from hakkwa h right outer join student s on h.code = s.hakkwa_code;

/* 연습 자료 */
/* 학생 정보 테이블 */
create table student2 (
	st_code int not null auto_increment primary key, -- 학생 고유번호
	name varchar(20) not null, 	-- 학생 성명
	hakkwa_code int							-- 학과 코드 
);

insert into student2 values (default, '가가가', 100);
insert into student2 values (default, '나나나', 200);
insert into student2 values (default, '다다다', 300);
insert into student2 values (default, '라라라', 400);
insert into student2 values (default, '하이찬', 101);
select * from student2;

select name,code from student union select name, hakkwa_code from student2;

select * from student2 s2, student s1;
select * from student2 s2, student s1 where s2.name = s1.name;
select s1.hakkwa_code, s2.name from student2 s2, student s1 where s2.name = s1.name;
select s1.hakkwa_code, h.name, s2.name from student2 s2, student s1, hakkwa h where s2.name = s1.name and s1.hakkwa_code = h.code;