show tables;

/*신고 테이블(complaint)*/
create table complaint (
	idx int not null auto_increment,	-- 신고 고유번호
	part varchar(15) not null,				-- 신고 메뉴(방명록:guest, 게시판:board, 자료실:pds)
	partIdx int not null,							-- 해당 글의 고유번호
	cpMid varchar(30) not null, 			-- 신고자 아이디
	cpContent text not null,					-- 신고 사유
	cpDate datetime default now(), 		-- 신고 날짜
	
	primary key (idx)
);
desc complaint;

drop table complaint;
