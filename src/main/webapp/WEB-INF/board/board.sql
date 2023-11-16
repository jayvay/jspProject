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
	
	primary key(idx)
);

desc board;
select * from board;

insert into board values (default, 'admin', '고나리', 'admin@naver.com', 'http://', '축 게시판 시작', '게시판 서비스를 시작합니다', default, '192.168.50.52', default, default, default);

/*게시판에 댓글 달기*/
create table boardReply (
	idx int not null auto_increment, -- 댓글의 고유번호
	boardIdx int not null,					 -- 원본글(부모글)의 고유번호(외래키로 설정)
	mid varchar(30) not null,				 -- 댓글 올린이의 아이디
	nickName varchar(30) not null, 	 -- 댓글 올린이의 닉네임
	wDate datetime default now(),		 -- 댓글 올린 날짜
	hostIp varchar(50) not null, 	   -- 댓글 올린 PC의 고유 IP
	content text not null,					 -- 댓글 내용
	
	primary key(idx),
	foreign key(boardIdx) references board(idx)
	on update cascade		-- 부모필드를 수정하면 함께 영향을 받는다
	on delete restrict 	-- 부모필드를 함부로 삭제할 수 없다
);
desc boardReply;
insert into boardReply values (default, 5, 'admin', '고나리', default, '192.168.50.199', '댓글이랍니당');
insert into boardReply values (default, 5, 'go123', '희수', default, '210.168.50.199', '이제 댓글도 쓸 수 있다고요!?');
insert into boardReply values (default, 4, 'guryongpo', '구룡포', default, '210.233.50.199', '안녕하세요');
delete from boardReply where idx = 4;
select * from boardReply;
select b.*,br.nickName from board b, boardReply br where b.idx = br.boardIdx;

select b.*,br.nickName,br.boardIdx from board b, boardReply br where b.idx=(select boardIdx from boardReply where boardIdx=5 limit 1);
select b.*,br.nickName,br.boardIdx from board b, (select * from boardReply where boardIdx=18) br where b.idx=5;


select * from board order by idx desc limit 0, 10;

select *,datediff(wDate, now()) from board order by idx desc limit 0, 10;


/*댓글 수 출력*/
-- 게시판(board) 리스트 화면에서 글 제목 옆에 해당 글의 댓글(boardReply) 수를 출력해보자
-- 전체 board 테이블의 내용을 최신순으로 출력
select * from board order by idx desc;

-- board 테이블 고유번호 5번에 해당하는 댓글(boardReply) 테이블의 댓글 수
select count(*) from boardReply where boardIdx = 5;
select count(*) from boardReply where boardIdx = 4;

-- 앞의 예에서 원본글의 고유번호와 총 댓글의 개수를 replyCnt라는 변수로 출력
select boardIdx,count(*) as replyCnt from boardReply where boardIdx = 5;

-- 앞의 예제 + 원본글을 쓴 닉네임도 함께 출력(닉네임은 부모테이블에서 가져오기)
select boardIdx,count(*) as replyCnt , (select nickName from board where idx = 5) as nickName from boardReply where boardIdx = 5;

-- 부모관점(board)에서 5번 게시글의 mid와 닉네임을 출력
select mid,nickName from board where idx = 5;

-- 닉네임을 자식테이블에서 가져오기
select mid,(select nickName from boardReply where boardIdx = 5 limit 1) as nickName from board where idx = 5;

-- 원본글에 해당하는 댓글의 개수를 원본글과 함께 출력
select *,(select count(*) from boardReply where boardIdx=5) as replyCnt from board where idx=5;


/*new.gif 24시간만 보여주기*/
select *,timestampdiff(hour, wDate, now()) from board order by idx desc limit 0, 10;

/*이전글,다음글 꺼내오기*/
select * from board where idx = 3;	-- 현재글
select * from board where idx < 3 order by idx desc limit 1; -- 이전글
select * from board where idx > 3 order by idx limit 1; -- 다음글

/*날짜 함수 연습*/
select now();
-- date_add() 함수 - datetime 형식 비교
select now() as 오늘날짜, date_add(now(), interval 1 day);
select now() as 오늘날짜, date_add(now(), interval -1 day);
select now() as 오늘날짜, date_add(now(), interval 10 hour);
select now() as 오늘날짜, date_add(now(), interval -10 hour) as preHour;
-- date_sub() 함수 
select now() as 오늘날짜, date_sub(now(), interval 1 day);
select now() as 오늘날짜, date_sub(now(), interval -1 day);
-- board 테이블에 적용
-- 게시글 중에서 하루 전에 올라온 글만 보여주세요
select wDate, date_add(now(), interval 1 day) from board;
select substring(wDate, 1, 10), substring(date_add(now(), interval 1 day), 1, 10) from board;
select idx, nickName, wDate from board;
select idx, nickName, wDate from board where substring(wDate, 1, 10) = substring(date_add(now(), interval -1 day), 1, 10);

/* 날짜 차이 계산 : DATEDIFF(시작날짜, 마지막날짜) - int 형식 비교 */
select datediff('2023-11-14', now());
select datediff(now(), wDate) from board;
select idx,nickName,wDate from board where wDate >= date_add(now(), interval -2 day);
select idx,nickName,wDate from board where wDate between date_add(now(), interval -2 day) and now();
select idx,nickName,wDate from board where wDate between date(now() - interval 1 day) and date(now());

select timestampdiff(hour, now(), wDate) from board;
select timestampdiff(day, now(), wDate) from board;
select timestampdiff(day, wDate, now()) from board;

/* 날짜 형식 (date_format(날짜형식자료, 포맷)) : 년도 4자리(%Y), 월(%m), 일(%d) , 시간(%H), 분(%i)*/
select wDate, date_format(wDate, '%Y-%m-%d') from board;
select wDate, date_format(wDate, '%Y-%m-%d %H:%i') from board;

