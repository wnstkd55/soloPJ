create table user01(
    userID varchar2(20) primary key,
    userPassword varchar2(20) not null,
    userName varchar2(20) not null,
    userEmail varchar2(30) not null,
    userAddress varchar2(50),
    userRole varchar2(10) not null
);

select * from user01;

create table bbs(
	bbsID number primary key,
	bbsTitle varchar2(50),
	userID varchar2(20),
	bbsDate date default sysdate,
	bbsContent varchar2(2048),
	bbsAvailable number
);

select * from bbs;
/*
카테고리 설정
	A : 악세서리
	B : 술
	C : 도자기
	D : 공예품
	E : 생활용품
	F : 디저트
	G : 음식
	H : 옷
	I : 향수,디퓨
*/