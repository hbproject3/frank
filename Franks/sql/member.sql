-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.
        
-- FRANCHISE Table Create SQL
CREATE TABLE FRANCHISE
(
    fnum        NUMBER           NOT NULL, 
    fname       VARCHAR2(30)     NULL, 
    fphone      VARCHAR2(15)     NULL, 
    faddress    VARCHAR2(120)    NULL, 
    CONSTRAINT FRANCHISE_PK PRIMARY KEY (fnum)
);


CREATE SEQUENCE FRANCHISE_SEQ
START WITH 1
INCREMENT BY 1;

COMMENT ON TABLE FRANCHISE IS '가맹점';


COMMENT ON COLUMN FRANCHISE.fnum IS '가맹점번호';


COMMENT ON COLUMN FRANCHISE.fname IS '가맹점이름';


COMMENT ON COLUMN FRANCHISE.fphone IS '가맹점전화번호';


COMMENT ON COLUMN FRANCHISE.faddress IS '가맹점주소';



-- WARE Table Create SQL
CREATE TABLE WARE
(
    wnum     NUMBER          NOT NULL, 
    wname    VARCHAR2(20)    NULL, 
    wtype    VARCHAR2(20)    NULL, 
    CONSTRAINT WARE_PK PRIMARY KEY (wnum)
);


CREATE SEQUENCE WARE_SEQ
START WITH 1
INCREMENT BY 1;


COMMENT ON TABLE WARE IS '물품';


COMMENT ON COLUMN WARE.wnum IS '물건번호';


COMMENT ON COLUMN WARE.wname IS '물건이름';


COMMENT ON COLUMN WARE.wtype IS '물건타입';



-- MENU Table Create SQL
CREATE TABLE MENU
(
    menu_num      NUMBER           NOT NULL, 
    menu_name     VARCHAR2(256)    NULL, 
    menu_price    NUMBER           NULL, 
    menu_type     VARCHAR2(20)     NULL, 
    menu_count    NUMBER           NULL, 
    CONSTRAINT MENU_PK PRIMARY KEY (menu_num)
);


CREATE SEQUENCE MENU_SEQ
START WITH 1
INCREMENT BY 1;

COMMENT ON TABLE MENU IS '메뉴';


COMMENT ON COLUMN MENU.menu_num IS '메뉴번호';


COMMENT ON COLUMN MENU.menu_name IS '메뉴이름';


COMMENT ON COLUMN MENU.menu_price IS '메뉴가격';


COMMENT ON COLUMN MENU.menu_type IS '메뉴타입';


COMMENT ON COLUMN MENU.menu_count IS '메뉴수량';


CREATE TABLE MEMBERS
(
    unum     NUMBER           NOT NULL, 
    uname    VARCHAR2(120)    NULL, 
    fid      VARCHAR2(48)     NULL, 
    upw      VARCHAR2(72)     NULL, 
    utype    NUMBER           NULL, 
    fnum     NUMBER           NOT NULL, 
    phon     VARCHAR2(15)     NULL, 
    email    VARCHAR2(128)    NULL, 
    CONSTRAINT MEMBERS_PK PRIMARY KEY (unum)
);


CREATE SEQUENCE MEMBERS_SEQ
START WITH 1
INCREMENT BY 1;


COMMENT ON TABLE MEMBERS IS '회원테이블';


COMMENT ON COLUMN MEMBERS.unum IS '유저번호';


COMMENT ON COLUMN MEMBERS.uname IS '유저이름';


COMMENT ON COLUMN MEMBERS.fid IS '유저아이디';


COMMENT ON COLUMN MEMBERS.upw IS '유저비밀번호';


COMMENT ON COLUMN MEMBERS.utype IS '유저타입';


COMMENT ON COLUMN MEMBERS.fnum IS '가맹점번호';


COMMENT ON COLUMN MEMBERS.phon IS '연락처';


COMMENT ON COLUMN MEMBERS.email IS '이메일';


ALTER TABLE MEMBERS
    ADD CONSTRAINT FK_MEMBER_fnum_FRANCHISE_fnum FOREIGN KEY (fnum)
        REFERENCES FRANCHISE (fnum);

-- CONTACT Table Create SQL
CREATE TABLE CONTACT
(
    qnum      NUMBER            NOT NULL, 
    qname     VARCHAR2(120)     NULL, 
    qphone    VARCHAR2(15)      NULL, 
    qnarea    VARCHAR2(60)      NULL, 
    qcntnt    VARCHAR2(2048)    NULL, 
    qntype    VARCHAR2(128)     NULL, 
    qnsize    VARCHAR2(128)     NULL, 
    qtype     VARCHAR2(128)     NULL, 
    qstate    NUMBER            NULL, 
    CONSTRAINT CONTACT_PK PRIMARY KEY (qnum)
);


CREATE SEQUENCE CONTACT_SEQ
START WITH 1
INCREMENT BY 1;


COMMENT ON TABLE CONTACT IS '문의정보';


COMMENT ON COLUMN CONTACT.qnum IS '문의번호';


COMMENT ON COLUMN CONTACT.qname IS '문의자이름';


COMMENT ON COLUMN CONTACT.qphone IS '문의자연락처';


COMMENT ON COLUMN CONTACT.qnarea IS '창업지역';


COMMENT ON COLUMN CONTACT.qcntnt IS '문의내용';


COMMENT ON COLUMN CONTACT.qntype IS '매장종류';


COMMENT ON COLUMN CONTACT.qnsize IS '매장규모';


COMMENT ON COLUMN CONTACT.qtype IS '질의분야';


COMMENT ON COLUMN CONTACT.qstate IS '상태';



-- STOCK Table Create SQL
CREATE TABLE STOCK
(
    fnum        NUMBER    NOT NULL, 
    wnum        NUMBER    NOT NULL, 
    nowstock    NUMBER    NULL, 
    instock     NUMBER    NULL, 
    outstock    NUMBER    NULL, 
    udate       DATE      NULL   
);


COMMENT ON TABLE STOCK IS '재고';


COMMENT ON COLUMN STOCK.fnum IS '가맹점번호';


COMMENT ON COLUMN STOCK.wnum IS '물건번호';


COMMENT ON COLUMN STOCK.nowstock IS '현재수량';


COMMENT ON COLUMN STOCK.instock IS '입고수량';


COMMENT ON COLUMN STOCK.outstock IS '출고수량';


COMMENT ON COLUMN STOCK.udate IS '업데이트 날짜';


ALTER TABLE STOCK
    ADD CONSTRAINT FK_STOCK_wnum_WARE_wnum FOREIGN KEY (wnum)
        REFERENCES WARE (wnum);


ALTER TABLE STOCK
    ADD CONSTRAINT FK_STOCK_fnum_FRANCHISE_fnum FOREIGN KEY (fnum)
        REFERENCES FRANCHISE (fnum);



-- ORDER Table Create SQL
CREATE TABLE ORDERS
(
    onum       NUMBER    NOT NULL, 
    wnum       NUMBER    NULL, 
    ocount     NUMBER    NULL, 
    otype      NUMBER    NULL, 
    osdate     DATE      DEFAULT sysdate, 
    oedate     DATE      DEFAULT sysdate, 
    osstore    NUMBER    NOT NULL, 
    orstore    NUMBER    NOT NULL, 
    CONSTRAINT ORDER_PK PRIMARY KEY (onum)
);


CREATE SEQUENCE ORDERS_SEQ
START WITH 1
INCREMENT BY 1;


COMMENT ON TABLE ORDERS IS '주문';


COMMENT ON COLUMN ORDERS.onum IS '주문번호';


COMMENT ON COLUMN ORDERS.wnum IS '물건번호';


COMMENT ON COLUMN ORDERS.ocount IS '주문수량';


COMMENT ON COLUMN ORDERS.otype IS '주문타입';


COMMENT ON COLUMN ORDERS.osdate IS '주문일자';


COMMENT ON COLUMN ORDERS.oedate IS '도착예정일자';


COMMENT ON COLUMN ORDERS.osstore IS '수신매장';


COMMENT ON COLUMN ORDERS.orstore IS '발신매장';


ALTER TABLE ORDERS
    ADD CONSTRAINT FK_ORDERS_wnum_WARE_wnum FOREIGN KEY (wnum)
        REFERENCES WARE (wnum);


ALTER TABLE ORDERS
    ADD CONSTRAINT FK_ORDER_osstore_FRANCHISE_fnu FOREIGN KEY (osstore)
        REFERENCES FRANCHISE (fnum);


ALTER TABLE ORDERS
    ADD CONSTRAINT FK_ORDER_orstore_FRANCHISE_fnu FOREIGN KEY (orstore)
        REFERENCES FRANCHISE (fnum);



-- SALES Table Create SQL
CREATE TABLE SALES
(
    snum     NUMBER           NOT NULL, 
    sdate    DATE           DEFAULT sysdate, 
    spay     NUMBER           NULL, 
    stype    NUMBER           NULL, 
    smenu    NUMBER           NULL, 
    CONSTRAINT SALES_PK PRIMARY KEY (snum)
);


CREATE SEQUENCE SALES_SEQ
START WITH 1
INCREMENT BY 1;

COMMENT ON TABLE SALES IS '매출';


COMMENT ON COLUMN SALES.snum IS '판매번호';


COMMENT ON COLUMN SALES.sdate IS '판매일';


COMMENT ON COLUMN SALES.spay IS '판매금액';


COMMENT ON COLUMN SALES.stype IS '판매유형';


COMMENT ON COLUMN SALES.smenu IS '판매메뉴';


ALTER TABLE SALES
    ADD CONSTRAINT FK_SALES_smenu_MENU_menu_num FOREIGN KEY (smenu)
        REFERENCES MENU (menu_num);



-- INFORM Table Create SQL
CREATE TABLE INFORM
(
    anum       NUMBER            NOT NULL, 
    asub       VARCHAR2(512)     NULL, 
    acntnt     VARCHAR2(2048)    NULL, 
    asdate     DATE              DEFAULT sysdate, 
    ardate     DATE              DEFAULT sysdate, 
    achk       NUMBER            NULL, 
    asstore    NUMBER            NOT NULL, 
    arstore    NUMBER            NOT NULL, 
    CONSTRAINT INFORM_PK PRIMARY KEY (anum)
);


CREATE SEQUENCE INFORM_SEQ
START WITH 1
INCREMENT BY 1;


COMMENT ON TABLE INFORM IS '알림';


COMMENT ON COLUMN INFORM.anum IS '알림번호';


COMMENT ON COLUMN INFORM.asub IS '알림제목';


COMMENT ON COLUMN INFORM.acntnt IS '알림내용';


COMMENT ON COLUMN INFORM.asdate IS '발신날짜';


COMMENT ON COLUMN INFORM.ardate IS '수신날짜';


COMMENT ON COLUMN INFORM.achk IS '알림확인여부';


COMMENT ON COLUMN INFORM.asstore IS '발신매장';


COMMENT ON COLUMN INFORM.arstore IS '수신매장';


ALTER TABLE INFORM
    ADD CONSTRAINT FK_INFORM_asstore_FRANCHISE_fn FOREIGN KEY (asstore)
        REFERENCES FRANCHISE (fnum);


ALTER TABLE INFORM
    ADD CONSTRAINT FK_INFORM_arstore_FRANCHISE_fn FOREIGN KEY (arstore)
        REFERENCES FRANCHISE (fnum);



-- FREEBOARD Table Create SQL
CREATE TABLE FREEBOARD
(
    bnum      NUMBER            NOT NULL, 
    bname     VARCHAR2(30)      NULL, 
    bpw       VARCHAR2(50)      NULL, 
    bdate     DATE              NULL, 
    bcnt      NUMBER            NULL, 
    bcntnt    VARCHAR2(1024)    NULL, 
    CONSTRAINT FREEBOARD_PK PRIMARY KEY (bnum)
);


CREATE SEQUENCE FREEBOARD_SEQ
START WITH 1
INCREMENT BY 1;


COMMENT ON TABLE FREEBOARD IS '자유게시판';


COMMENT ON COLUMN FREEBOARD.bnum IS '글 번호';


COMMENT ON COLUMN FREEBOARD.bname IS '제목';


COMMENT ON COLUMN FREEBOARD.bpw IS '비밀번호';


COMMENT ON COLUMN FREEBOARD.bdate IS '날짜';


COMMENT ON COLUMN FREEBOARD.bcnt IS '조회 수';


COMMENT ON COLUMN FREEBOARD.bcntnt IS '내용';



