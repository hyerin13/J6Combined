--날짜테이블 생성
drop table date_t;
create table date_t (ds varchar2(10) NOT NULL PRIMARY KEY);
--데이터 입력
insert into date_t
SELECT TO_CHAR( TO_DATE('20180101', 'YYYYMMDD') + ROWNUM-1, 'YYYYMMDD') AS DAY
FROM DUAL
CONNECT BY level <= ROUND( TO_DATE('20241231', 'YYYYMMDD') - TO_DATE('20180101', 'YYYYMMDD') );
commit;
drop table hotelchain;
--호텔체인 생성
create table hotelchain(krchainname varchar2(100) NOT NULL PRIMARY KEY, engchainname varchar2(100));
--데이터 입력
insert into hotelchain values('jw메리어트','jwmarriotthotel');
insert into hotelchain values('노보텔','novotelhotel');
insert into hotelchain values('라마다','ramadahotel');
insert into hotelchain values('라한','lahanhotel');
insert into hotelchain values('르메르디앙','lemeridienhotel');
insert into hotelchain values('리츠칼튼','ritzcarltonhotel');
insert into hotelchain values('만다린오리엔탈','mandarinorientalhotel');
insert into hotelchain values('메리어트인터내셔널','marriottinternationalhotel');
insert into hotelchain values('베스트웨스턴','bestwesternhotel');
insert into hotelchain values('아코르','accorhotel');
insert into hotelchain values('월도프애스토리아','waldorfastoriahotel');
insert into hotelchain values('인터콘티넨털','intercontinentalhotel');
insert into hotelchain values('코업','co-ophotel');
insert into hotelchain values('콘래드','conradhotel');
insert into hotelchain values('포시즌스','fourseasonshotel');
insert into hotelchain values('힐튼','hiltonhotel');
insert into hotelchain values('롯데','lottehotel');
insert into hotelchain values('베니키아','benikeahotel');
insert into hotelchain values('신라호텔','shillahotel');
insert into hotelchain values('파크하얏트','parkhyatthotel');

--(국내)항공사 입력
drop table airline;
create table airline(airname varchar2(100) NOT NULL PRIMARY KEY);
--데이터 입력
insert into airline values('대한항공');
insert into airline values('아시아나항공');
insert into airline values('티웨이항공');
insert into airline values('진에어');
insert into airline values('에어서울');
insert into airline values('에어부산');
insert into airline values('제주항공');
insert into airline values('이스타항공');
insert into airline values('플라이강원');
insert into airline values('에어로케이항공');

--(국내)공항 입력
drop table airport;
create table airport(portname varchar2(100) NOT NULL PRIMARY KEY);
--데이터 입력
insert into airport values('김포국제공항');
insert into airport values('김해국제공항');
insert into airport values('제주국제공항');
insert into airport values('대구국제공항');
insert into airport values('청주국제공항');
insert into airport values('무안국제공항');
insert into airport values('인천국제공항');

--숙소등록요청할때사용할 임시테이블들
DROP TABLE PERIOD_TEMP CASCADE CONSTRAINTS;
DROP TABLE ADDITIONAL_FEE_TEMP CASCADE CONSTRAINTS;
DROP TABLE ACCOMMODATIONS_TEMP CASCADE CONSTRAINTS;
DROP TABLE ROOM_INFO_TEMP CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_ACCOMMODATIONS;
DROP SEQUENCE SEQ_ADDITIONAL_FEE;
DROP SEQUENCE SEQ_PERIOD;
DROP SEQUENCE SEQ_ROOM_INFO;
CREATE SEQUENCE SEQ_ACCOMMODATIONS;
CREATE SEQUENCE SEQ_ADDITIONAL_FEE;
CREATE SEQUENCE SEQ_PERIOD;
CREATE SEQUENCE SEQ_ROOM_INFO;
-- 숙소
CREATE TABLE ACCOMMODATIONS_TEMP
(
	-- 숙소아이디
	AID NUMBER(4) NOT NULL,
	-- 카테고리
	ACATE VARCHAR2(100),
	-- 숙박업소명
	ANAME VARCHAR2(200),
	-- 주소
	AADDRESS VARCHAR2(200),
	-- 전화번호
	APHONE VARCHAR2(30),
	-- x좌표
	AXCOORDI VARCHAR2(30),
	-- y좌표
	AYCOORDI VARCHAR2(30),
	-- 총객실수
	ATOTALROOM NUMBER(5),
	-- 숙소성급
	AGRADE VARCHAR2(20),
	-- 대표소개
	ADETAIL VARCHAR2(2000),
	-- 대표이미지
	AMAINIMG VARCHAR2(3000),
	-- 등록일
	AREGDATE DATE,
	-- 삭제여부 : 삭제된 경우 = Y 로 표시
	-- 
	AISDEL VARCHAR2(1),
	PRIMARY KEY (AID)
);


-- 추가요금
CREATE TABLE ADDITIONAL_FEE_TEMP
(
	-- 추가비용아이디
	AFID NUMBER(4) NOT NULL,
	-- 인원추가비용
	AFPERSONNEL NUMBER(10),
	-- 조식추가비용
	AFBREAKFAST NUMBER(10),
	-- 침대추가비용
	AFBED NUMBER(10),
	-- 객실아이디
	RIID NUMBER(4) NOT NULL,
	PRIMARY KEY (AFID)
);
-- 기간
CREATE TABLE PERIOD_TEMP
(
	-- 기간아이디
	PEID NUMBER(4) NOT NULL,
	-- 시즌 : 비수기/성수기/준성수기
	PESEASON VARCHAR2(20),
	-- 시작날짜
	PESTART DATE,
	-- 끝날짜
	PEEND DATE,
	-- 숙소아이디
	AID NUMBER(4) NOT NULL,
	PRIMARY KEY (PEID)
);
-- 객실세부정보
CREATE TABLE ROOM_INFO_TEMP
(
	-- 객실아이디
	RIID NUMBER(4) NOT NULL,
	-- 객실종류 : (호텔-~룸,펜션-00호)
	RIROOMTYPE VARCHAR2(100),
	-- 총 객실수
	RIROOM NUMBER(4),
	-- 부가서비스 : 인터넷,조식,욕조,흡연
	RISERVICE VARCHAR2(3000),
	-- 객실크기 : 7평
	RISIZE VARCHAR2(50),
	-- 숙박가능인원
	RIMINPER NUMBER(3),
	-- 숙박최대인원
	RIMAXPER NUMBER(3),
	-- 성수기 1박 기본요금
	RIPEAK NUMBER(10),
	-- 준성수기 1박 기본요금
	RISEMIPEAK NUMBER(10),
	-- 비수기 1박 기본요금
	RIOFF NUMBER(10),
	-- 대표이미지
	RIMAINIMG VARCHAR2(3000),
	-- 추가이미지1
	RIEXTRAIMG1 VARCHAR2(3000),
	-- 추가이미지2
	RIEXTRAIMG2 VARCHAR2(3000),
	-- 숙소아이디
	AID NUMBER(4) NOT NULL,
	PRIMARY KEY (RIID)
);


/* Drop Tables */

DROP TABLE PERIOD CASCADE CONSTRAINTS;
DROP TABLE ADDITIONAL_FEE CASCADE CONSTRAINTS;
DROP TABLE PAYMENT CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE RESERVATION CASCADE CONSTRAINTS;
DROP TABLE ROOM_INFO CASCADE CONSTRAINTS;
DROP TABLE ACCOMMODATIONS CASCADE CONSTRAINTS;
DROP TABLE COMMENTS CASCADE CONSTRAINTS;
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE FAQ CASCADE CONSTRAINTS;
DROP TABLE FAVORITE CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE HEAD_ADMIN CASCADE CONSTRAINTS;
DROP TABLE USERQNA CASCADE CONSTRAINTS;
DROP TABLE MEMBERS CASCADE CONSTRAINTS;
DROP TABLE CHAT_ADD CASCADE CONSTRAINTS;
DROP TABLE CHAT_BUDDY CASCADE CONSTRAINTS;
DROP TABLE CHAT_MESSAGE CASCADE CONSTRAINTS;
DROP TABLE CHAT_ROOMJOIN CASCADE CONSTRAINTS;
DROP TABLE CHAT_MEMBERS CASCADE CONSTRAINTS;
DROP TABLE CHAT_ROOM CASCADE CONSTRAINTS;

/* drop sequence */
DROP SEQUENCE SEQ_ACCOMMODATIONS;
DROP SEQUENCE SEQ_ADDITIONAL_FEE;
DROP SEQUENCE SEQ_BOARD;
DROP SEQUENCE SEQ_COMMENTS;
DROP SEQUENCE SEQ_FAQ;
DROP SEQUENCE SEQ_FAVORITE;
DROP SEQUENCE SEQ_HEAD_ADMIN;
DROP SEQUENCE SEQ_NOTICE;
DROP SEQUENCE SEQ_PAYMENT;
DROP SEQUENCE SEQ_PERIOD;
DROP SEQUENCE SEQ_RESERVATION;
DROP SEQUENCE SEQ_REVIEW;
DROP SEQUENCE SEQ_ROOM_INFO;
DROP SEQUENCE SEQ_USERQNA;
DROP SEQUENCE SEQ_CHAT_ADD ;
DROP SEQUENCE SEQ_CHAT_BUDDY ;
DROP SEQUENCE SEQ_CHAT_MESSAGE ;
DROP SEQUENCE SEQ_CHAT_ROOMJOIN ;
DROP SEQUENCE SEQ_CHAT_ROOM ;

/* Create sequence. */
CREATE SEQUENCE SEQ_ACCOMMODATIONS;
CREATE SEQUENCE SEQ_ADDITIONAL_FEE;
CREATE SEQUENCE SEQ_BOARD;
CREATE SEQUENCE SEQ_COMMENTS;
CREATE SEQUENCE SEQ_FAQ;
CREATE SEQUENCE SEQ_FAVORITE;
CREATE SEQUENCE SEQ_HEAD_ADMIN;
CREATE SEQUENCE SEQ_NOTICE;
CREATE SEQUENCE SEQ_PAYMENT;
CREATE SEQUENCE SEQ_PERIOD;
CREATE SEQUENCE SEQ_RESERVATION;
CREATE SEQUENCE SEQ_REVIEW;
CREATE SEQUENCE SEQ_ROOM_INFO;
CREATE SEQUENCE SEQ_USERQNA;
CREATE SEQUENCE SEQ_CHAT_ADD ;
CREATE SEQUENCE SEQ_CHAT_BUDDY ;
CREATE SEQUENCE SEQ_CHAT_MESSAGE ;
CREATE SEQUENCE SEQ_CHAT_ROOMJOIN ;
CREATE SEQUENCE SEQ_CHAT_ROOM ;



/* Create Tables */
-- 친구추가목록
CREATE TABLE CHAT_ADD
(
	-- 추가목록아이디
	CAID NUMBER(4) NOT NULL,
	-- 수락대기중인아이디
	CAADDID VARCHAR2(100),
	-- 아이디
	CMID VARCHAR2(100) NOT NULL,
	PRIMARY KEY (CAID)
);


-- 채팅친구목록
CREATE TABLE CHAT_BUDDY
(
	-- 친구목록아이디
	CBID NUMBER(4) NOT NULL,
	-- 친구아이디
	CBBUID VARCHAR2(100),
	-- 아이디
	CMID VARCHAR2(100) NOT NULL,
	PRIMARY KEY (CBID)
);


-- 채팅회원
CREATE TABLE CHAT_MEMBERS
(
	-- 아이디
	CMID VARCHAR2(100) NOT NULL,
	-- 이름
	CMNAME VARCHAR2(100),
	-- 생년월일
	CMBIRTH DATE,
	-- 프로필사진
	CMPROFILE VARCHAR2(3000),
	-- 대화명
	CMSCNAME VARCHAR2(100),
	-- 탈퇴여부
	CMDROP VARCHAR2(1),
	PRIMARY KEY (CMID)
);

insert into chat_members values('unknown','알수없음',null,'noimage2.jpg',null,null);
commit;


-- 채팅메세지
CREATE TABLE CHAT_MESSAGE
(
	-- 메세지아이디
	MSGID NUMBER(4) NOT NULL,
	-- 메세지내용
	MSGMESSAGE VARCHAR2(1000),
	-- 메세지시간
	MSGTIME DATE,
    -- 시스템메세지
    MSGSYSMSG VARCHAR2(1000),
	-- 아이디
	CMID VARCHAR2(100) NOT NULL,
	-- 채팅방아이디
	CRID NUMBER(4) NOT NULL,
	PRIMARY KEY (MSGID)
);


-- 채팅방
CREATE TABLE CHAT_ROOM
(
	-- 채팅방아이디
	CRID NUMBER(4) NOT NULL,
	PRIMARY KEY (CRID)
);


-- 채팅방연결
CREATE TABLE CHAT_ROOMJOIN
(
	-- 연결아이디
	JOINID NUMBER(4) NOT NULL,
	-- 마지막접속시간
	JOINCONTIME DATE,
	-- 아이디
	CMID VARCHAR2(100) NOT NULL,
	-- 채팅방아이디
	CRID NUMBER(4) NOT NULL,
	PRIMARY KEY (JOINID)
);
-- 숙소
CREATE TABLE ACCOMMODATIONS
(
	-- 숙소아이디
	AID NUMBER(4) NOT NULL,
	-- 카테고리
	ACATE VARCHAR2(100),
	-- 숙박업소명
	ANAME VARCHAR2(200),
	-- 주소
	AADDRESS VARCHAR2(200),
	-- 전화번호
	APHONE VARCHAR2(30),
	-- x좌표
	AXCOORDI VARCHAR2(30),
	-- y좌표
	AYCOORDI VARCHAR2(30),
	-- 총객실수
	ATOTALROOM NUMBER(5),
	-- 숙소성급
	AGRADE VARCHAR2(20),
	-- 대표소개
	ADETAIL VARCHAR2(2000),
	-- 대표이미지
	AMAINIMG VARCHAR2(3000),
	-- 등록일
	AREGDATE DATE,
	-- 삭제여부 : 삭제된 경우 = Y 로 표시
	-- 
	AISDEL VARCHAR2(1),
	PRIMARY KEY (AID)
);


-- 추가요금
CREATE TABLE ADDITIONAL_FEE
(
	-- 추가비용아이디
	AFID NUMBER(4) NOT NULL,
	-- 인원추가비용
	AFPERSONNEL NUMBER(10),
	-- 조식추가비용
	AFBREAKFAST NUMBER(10),
	-- 침대추가비용
	AFBED NUMBER(10),
	-- 객실아이디
	RIID NUMBER(4) NOT NULL,
	PRIMARY KEY (AFID)
);


-- 게시판
CREATE TABLE BOARD
(
	-- 게시판아이디
	BID NUMBER(4) NOT NULL,
	-- 카테고리
	BCATE VARCHAR2(50),
	-- 제목
	BTITLE VARCHAR2(100),
	-- 내용
	BCONTENT VARCHAR2(3000),
	-- 작성일
	BRDATE DATE,
	-- 첨부파일1
	BFILE1 VARCHAR2(4000),
	-- 첨부파일2
	BFILE2 VARCHAR2(4000),
	-- 첨부파일3
	BFILE3 VARCHAR2(4000),
	-- 아이디
	MID VARCHAR2(100) NOT NULL,
	PRIMARY KEY (BID)
);


-- 댓글
CREATE TABLE COMMENTS
(
	-- 댓글아이디
	CID NUMBER(4) NOT NULL,
	-- 내용
	CCONTENT NVARCHAR2(1000),
	-- 작성일
	CRDATE DATE,
	-- 그룹번호
	CREF NUMBER(3),
	-- 출력순서
	CSTEP NUMBER(3),
	-- 댓글번호 : (댓글의댓글)몇번째댓글인지
	-- 
	CLEV NUMBER(1),
	-- 삭제여부 : 삭제 ->Y
	CISDEL VARCHAR2(1),
	-- 게시판아이디
	BID NUMBER(4) NOT NULL,
	-- 아이디
	MID VARCHAR2(100) NOT NULL,
	PRIMARY KEY (CID)
);


-- 자주 묻는 질문
CREATE TABLE FAQ
(
	-- 자주묻는질문아이디
	FID NUMBER(4) NOT NULL,
	-- 제목
	FTITLE VARCHAR2(100),
	-- 내용
	FCONTENT VARCHAR2(4000),
	-- 첨부파일
	FFILE VARCHAR2(4000),
	-- 등록일
	FRDATE DATE,
	-- 공개여부 : 공개 ->Y
	-- 비공개->N
	-- 
	FPUBLIC VARCHAR2(1),
	-- 어드민아이디
	AID VARCHAR2(10) NOT NULL,
	PRIMARY KEY (FID)
);


-- 즐겨찾기
CREATE TABLE FAVORITE
(
	-- 즐겨찾기아이디
	FAVID NUMBER(4) NOT NULL,
	-- 선호하는 공항
	FAVAIRPORT VARCHAR2(100),
	-- 선호하는항공사
	FAVAIRLINE VARCHAR2(100),
	-- 선호호텔체인
	FAVHOTEL VARCHAR2(100),
	-- 아이디
	MID VARCHAR2(100) NOT NULL,
	PRIMARY KEY (FAVID)
);


-- 관리자
CREATE TABLE HEAD_ADMIN
(
	-- 어드민아이디
	AID VARCHAR2(10) NOT NULL,
	-- 비밀번호
	APW VARCHAR2(100),
	-- 이름
	ANAME VARCHAR2(100),
	-- 등록일
	ARDATE DATE,
	PRIMARY KEY (AID)
);


-- 회원
CREATE TABLE MEMBERS
(
	-- 아이디
	MID VARCHAR2(100) NOT NULL,
	-- 비밀번호
	MPW VARCHAR2(15),
	-- 이름
	MNAME VARCHAR2(100),
	-- 전화번호
	MPHONE VARCHAR2(300),
	-- 이메일
	MEMAIL VARCHAR2(25),
	-- 가입일 : DATE DEFAULT SYSDATE
	MRDATE DATE,
	-- 생년월일
	MBIRTH DATE,
	-- 프로필사진
	MPROFILE VARCHAR2(3000),
	-- 탈퇴여부 : 탈퇴 -> Y
	MDROP VARCHAR2(1),
	PRIMARY KEY (MID)
);


-- 공지글
CREATE TABLE NOTICE
(
	-- 자주묻는질문아이디
	NID NUMBER(4) NOT NULL,
	-- 제목
	NTITLE VARCHAR2(100),
	-- 내용
	NCONTENT VARCHAR2(4000),
	-- 첨부파일
	NFILE VARCHAR2(4000),
	-- 등록일 : DATE DEFAULT SYSDATE
	NRDATE DATE,
	-- 공개여부 : 공개->Y
	-- 비공개->N
	-- 
	NPUBLIC VARCHAR2(1),
	-- 어드민아이디
	AID VARCHAR2(10) NOT NULL,
	PRIMARY KEY (NID)
);


-- 결제
CREATE TABLE PAYMENT
(
	-- 결제아이디
	PID NUMBER(4) NOT NULL,
	-- 결제수단
	PMETHOD VARCHAR2(100),
	-- 결제날짜
	PDATE DATE,
	-- 총 비용
	PTOTAL NUMBER(10),
	-- 환불 : 환불 시 Y
	PREFUND VARCHAR2(1),
	-- 결제토큰
	PTOKEN VARCHAR2(100),
	-- 예약아이디
	RID NUMBER(4) NOT NULL,
	-- 아이디
	MID VARCHAR2(100) NOT NULL,
	PRIMARY KEY (PID)
);


-- 기간
CREATE TABLE PERIOD
(
	-- 기간아이디
	PEID NUMBER(4) NOT NULL,
	-- 시즌 : 비수기/성수기/준성수기
	PESEASON VARCHAR2(20),
	-- 시작날짜
	PESTART DATE,
	-- 끝날짜
	PEEND DATE,
	-- 숙소아이디
	AID NUMBER(4) NOT NULL,
	PRIMARY KEY (PEID)
);


-- 예약
CREATE TABLE RESERVATION
(
	-- 예약아이디
	RID NUMBER(4) NOT NULL,
	-- 객실예약번호
	RORDERNUM NUMBER(3),
	-- 인원
	RAMOUNT NUMBER(3),
	-- 예약시작일
	RCHECKIN VARCHAR2(15),
	-- 예약종료일 : 다음날퇴실
	RCHECKOUT VARCHAR2(15),
	-- 예약자이름
	RRESNAME VARCHAR2(100),
	-- 예약자전화번호
	RRESPHONE VARCHAR2(15),
	-- 예약자 이메일
	RRESEMAIL VARCHAR2(100),
	-- 조식추가인원 : 0 -> 조식추가안함
	-- 1~ -> 명 조식 추가
	-- 
	REXBREAKNUM NUMBER(1),
	-- 침대추가 : 1개추가 ->1
	REXBED NUMBER(1),
	-- 인원추가 : 0->추가안함
	-- 1~->명 추가
	REXPERSON NUMBER(1),
	-- 취소여부 : 취소->Y
	-- 
	RCANCEL VARCHAR2(5),
	-- 아이디
	MID VARCHAR2(100) NOT NULL,
	-- 객실아이디
	RIID NUMBER(4) NOT NULL,
	PRIMARY KEY (RID)
);


-- 리뷰
CREATE TABLE REVIEW
(
	-- 리뷰아이디
	REID NUMBER(4) NOT NULL,
	-- 리뷰제목
	RETITLE VARCHAR2(300),
	-- 리뷰내용
	RECONTENT VARCHAR2(4000),
	-- 리뷰사진
	REPHOTO VARCHAR2(4000),
	-- 리뷰등록일 : DATE DEFAULT SYSDATE
	RERDATE DATE,
	-- 별점
	RESTAR NUMBER(3),
	-- 아이디
	MID VARCHAR2(100) NOT NULL,
	-- 예약아이디
	RID NUMBER(4) NOT NULL,
	PRIMARY KEY (REID)
);


-- 객실세부정보
CREATE TABLE ROOM_INFO
(
	-- 객실아이디
	RIID NUMBER(4) NOT NULL,
	-- 객실종류 : (호텔-~룸,펜션-00호)
	RIROOMTYPE VARCHAR2(100),
	-- 총 객실수
	RIROOM NUMBER(4),
	-- 부가서비스 : 인터넷,조식,욕조,흡연
	RISERVICE VARCHAR2(3000),
	-- 객실크기 : 7평
	RISIZE VARCHAR2(50),
	-- 숙박가능인원
	RIMINPER NUMBER(3),
	-- 숙박최대인원
	RIMAXPER NUMBER(3),
	-- 성수기 1박 기본요금
	RIPEAK NUMBER(10),
	-- 준성수기 1박 기본요금
	RISEMIPEAK NUMBER(10),
	-- 비수기 1박 기본요금
	RIOFF NUMBER(10),
	-- 대표이미지
	RIMAINIMG VARCHAR2(3000),
	-- 추가이미지1
	RIEXTRAIMG1 VARCHAR2(3000),
	-- 추가이미지2
	RIEXTRAIMG2 VARCHAR2(3000),
	-- 숙소아이디
	AID NUMBER(4) NOT NULL,
	PRIMARY KEY (RIID)
);


-- 문의글
CREATE TABLE USERQNA
(
	-- 문의글아이디
	QID NUMBER(4) NOT NULL,
	-- 문의글카테고리 : 1.상품 2.교환/환불 3.사이트이용 4.기타
	QCATE VARCHAR2(20),
	-- 문의글비번
	QPW VARCHAR2(100),
	-- 문의글제목
	QTITLE VARCHAR2(300),
	-- 문의글내용
	QCONTENT VARCHAR2(4000),
	-- 문의글첨부
	QFILE VARCHAR2(4000),
	-- 문의글등록일 : DATE DEFAULT SYSDATE
	QRDATE DATE,
	-- 문의글처리여부 : 처리->Y
	QLEV VARCHAR2(1),
	-- 그룹번호
	QREF NUMBER(3),
	-- 글번호
	QSTEP NUMBER(3),
	-- 아이디
	MID VARCHAR2(100) NOT NULL,
	PRIMARY KEY (QID)
);



/* Create Foreign Keys */

ALTER TABLE PERIOD
	ADD FOREIGN KEY (AID)
	REFERENCES ACCOMMODATIONS (AID)
;


ALTER TABLE ROOM_INFO
	ADD FOREIGN KEY (AID)
	REFERENCES ACCOMMODATIONS (AID)
;


ALTER TABLE COMMENTS
	ADD FOREIGN KEY (BID)
	REFERENCES BOARD (BID)
;


ALTER TABLE CHAT_ADD
	ADD FOREIGN KEY (CMID)
	REFERENCES CHAT_MEMBERS (CMID)
;


ALTER TABLE CHAT_BUDDY
	ADD FOREIGN KEY (CMID)
	REFERENCES CHAT_MEMBERS (CMID)
;


ALTER TABLE CHAT_MESSAGE
	ADD FOREIGN KEY (CMID)
	REFERENCES CHAT_MEMBERS (CMID)
;


ALTER TABLE CHAT_ROOMJOIN
	ADD FOREIGN KEY (CMID)
	REFERENCES CHAT_MEMBERS (CMID)
;


ALTER TABLE CHAT_MESSAGE
	ADD FOREIGN KEY (CRID)
	REFERENCES CHAT_ROOM (CRID)
;


ALTER TABLE CHAT_ROOMJOIN
	ADD FOREIGN KEY (CRID)
	REFERENCES CHAT_ROOM (CRID)
;


ALTER TABLE FAQ
	ADD FOREIGN KEY (AID)
	REFERENCES HEAD_ADMIN (AID)
;


ALTER TABLE NOTICE
	ADD FOREIGN KEY (AID)
	REFERENCES HEAD_ADMIN (AID)
;


ALTER TABLE BOARD
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE COMMENTS
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE FAVORITE
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE PAYMENT
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE RESERVATION
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE REVIEW
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE USERQNA
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE PAYMENT
	ADD FOREIGN KEY (RID)
	REFERENCES RESERVATION (RID)
;


ALTER TABLE REVIEW
	ADD FOREIGN KEY (RID)
	REFERENCES RESERVATION (RID)
;


ALTER TABLE ADDITIONAL_FEE
	ADD FOREIGN KEY (RIID)
	REFERENCES ROOM_INFO (RIID)
;


ALTER TABLE RESERVATION
	ADD FOREIGN KEY (RIID)
	REFERENCES ROOM_INFO (RIID)
;




--sql초기세팅