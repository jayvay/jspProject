show tables;

create table board (
	idx int not null auto_increment,	-- 게시글의 고유번호
	mid varchar(30) not null,					-- 게시글 작성자 아이디(정회원)
	nickName varchar(30) not null,		-- 게시글 작성자 닉네임
	email varchar(60),								-- 게시글 작성자 이메일
	homePage varchar(60),							-- 게시글 작성자 홈페이지(개인블로그) 주소
	title varchar(100) not null,			-- 게시글 제목
	content text not null, 						-- 게시글 내용
	readNum int not null default 0,		-- 게시글 조회수
	hostIp varchar(40) not null,			-- 게시글 작성자 IP
	openSw char(2) default 'OK',			-- 게시글 공개여부 (OK:공개 NO:비공개)
	wDate datetime default now(),			-- 게시글 올린 날짜(시간)
	good int default 0,								-- 게시글 좋아요 수 누적
	
	primary key(idx),
);

desc board;
select * from board;

insert into board values (default, 'admin', '고나리', 'admin@naver.com', 'http://', '축 게시판 시작', '게시판 서비스를 시작합니다', default, '192.168.50.52', default, default, default);