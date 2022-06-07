create table USER(
	userID varchar(20),
	userPassword varchar(20),
	userName varchar(20),
	userGender varchar(20),
	userEmail varchar(50),
	primary key(userID)
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