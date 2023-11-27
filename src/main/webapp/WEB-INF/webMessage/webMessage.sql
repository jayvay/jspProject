show tables;

create table webMessage (
	idx int not null auto_increment primary key, /* 메세지 고유번호 */
	title varchar(100) not null, /* 메세지 제목 */
	content text not null,			 /* 메세지 내용 */
	sendId varchar(30) not null, /* 보내는 사람 아이디 */
	sendSw char(1) not null,		 /* 보낸 메세지(s), 휴지통(g), 휴지통삭제(x) */
	sendDate datetime default now(),	/* 메세지 보낸 날짜 */
	receiveId varchar(30) not null, /* 받는 사람 아이디 */
	receiveSw char(1) not null,		 /* 받은 메세지(n), 읽은 메세지(r), 휴지통(g), 휴지통삭제(x) */
	receiveDate datetime default now()	/* 메세지 받은 날짜 */
);

desc webMessage;

insert into webMessage values (default, '안녕 봉석아', '잘 지내니', 'go123', 's', default, 'bongbong', 'n', default);
insert into webMessage values (default, '희수야...', '나를 잊지 않았구나 나 아직 너 좋아해', 'bongbong', 's', default, 'go123', 'n', default);
insert into webMessage values (default, '너 바쁘잖아', '히어로 해야 하잖아...', 'go123', 's', default, 'bongbong', 'n', default);
insert into webMessage values (default, '미안해..', '하지만 진심이야ㅠ', 'bongbong', 's', default, 'go123', 'n', default);


