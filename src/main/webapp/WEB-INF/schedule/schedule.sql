show tables;

create table schedule (
	idx int not null auto_increment primary key, /* 스케줄 관리 고유번호 */
	mid varchar(30) not null, /* 회원의 아이디(일정 검색시 필요) */
	sDate datetime not null, /* 일정 등록 날짜 */
	part varchar(10) not null, /* 일정 분류(1.모임, 2.업무, 3.학습, 4.여행, 5.기타) */
	content text not null, /* 일정 상세 내역 */
	
	foreign key(mid) references member(mid)
);

desc schedule;

drop table schedule;

insert into schedule values (default, 'go123', '2023-11-01', '학습', 'JSP 프로젝트 기획');
insert into schedule values (default, 'go123', '2023-11-01', '모임', '동기들과 식사 19시');
insert into schedule values (default, 'go123', '2023-11-05', '업무', '기획 회의 12시 30분');
insert into schedule values (default, 'go123', '2023-11-11', '모임', '가족모임 18시');
insert into schedule values (default, 'go123', '2023-11-15', '학습', 'JSP 프로젝트 시작');
insert into schedule values (default, 'go123', '2023-11-22', '학습', '프로젝트 정기점검');
insert into schedule values (default, 'guryongpo', '2023-11-11', '모임', '딸래미와 식사 18시');
insert into schedule values (default, 'guryongpo', '2023-11-15', '업무', '치킨 튀김기 정기 점검');
insert into schedule values (default, 'guryongpo', '2023-11-20', '여행', '신선한치킨 1주년 기념 여행');

select * from schedule where mid = 'go123' and date_format(sDate, '%Y-%m') = '2023-11' order by sDate, part;

select * from schedule where mid = 'go123' and date_format(sDate, '%Y-%m-%d') = '2023-11-22' order by sDate, part;
select * from schedule where mid = 'go123' and date_format(sDate, '%Y-%m') = '2023-11' order by sDate, part;

select distinct sDate as cnt from schedule where mid='go123' and date_format(sDate, '%Y-%m')='2023-11' order by sDate, part;
select distinct sDate,count(*) as cnt from schedule where mid='go123' and date_format(sDate, '%Y-%m')='2023-11' order by sDate, part;

select * from schedule group by date_format(sDate, '%Y-%m')='2023-11' order by sDate, part;
select *,count(*) from schedule group by date_format(sDate, '%Y-%m')='2023-11' order by sDate, part;

select * from schedule where mid='go123' and date_format(sDate, '%Y-%m')='2023-11' group by sDate order by sDate, part;
select *,count(*) from schedule where mid='go123' and date_format(sDate, '%Y-%m')='2023-11' group by sDate order by sDate, part;
select *,count(*) as partCnt from schedule where mid='go123' and date_format(sDate, '%Y-%m')='2023-11' group by sDate,part order by sDate, part;

select *,count(*) from schedule where mid='go123' and date_format(sDate, '%Y-%m')='2023-11' group by part order by sDate, part;
