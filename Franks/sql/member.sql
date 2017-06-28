-- ���̺� ������ ���踦 ����Ͽ� �� ���� �����ص� ������ �߻����� �ʰ� ���ĵǾ����ϴ�.
        
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

COMMENT ON TABLE FRANCHISE IS '������';


COMMENT ON COLUMN FRANCHISE.fnum IS '��������ȣ';


COMMENT ON COLUMN FRANCHISE.fname IS '�������̸�';


COMMENT ON COLUMN FRANCHISE.fphone IS '��������ȭ��ȣ';


COMMENT ON COLUMN FRANCHISE.faddress IS '�������ּ�';



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


COMMENT ON TABLE WARE IS '��ǰ';


COMMENT ON COLUMN WARE.wnum IS '���ǹ�ȣ';


COMMENT ON COLUMN WARE.wname IS '�����̸�';


COMMENT ON COLUMN WARE.wtype IS '����Ÿ��';



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

COMMENT ON TABLE MENU IS '�޴�';


COMMENT ON COLUMN MENU.menu_num IS '�޴���ȣ';


COMMENT ON COLUMN MENU.menu_name IS '�޴��̸�';


COMMENT ON COLUMN MENU.menu_price IS '�޴�����';


COMMENT ON COLUMN MENU.menu_type IS '�޴�Ÿ��';


COMMENT ON COLUMN MENU.menu_count IS '�޴�����';


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


COMMENT ON TABLE MEMBERS IS 'ȸ�����̺�';


COMMENT ON COLUMN MEMBERS.unum IS '������ȣ';


COMMENT ON COLUMN MEMBERS.uname IS '�����̸�';


COMMENT ON COLUMN MEMBERS.fid IS '�������̵�';


COMMENT ON COLUMN MEMBERS.upw IS '������й�ȣ';


COMMENT ON COLUMN MEMBERS.utype IS '����Ÿ��';


COMMENT ON COLUMN MEMBERS.fnum IS '��������ȣ';


COMMENT ON COLUMN MEMBERS.phon IS '����ó';


COMMENT ON COLUMN MEMBERS.email IS '�̸���';


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


COMMENT ON TABLE CONTACT IS '��������';


COMMENT ON COLUMN CONTACT.qnum IS '���ǹ�ȣ';


COMMENT ON COLUMN CONTACT.qname IS '�������̸�';


COMMENT ON COLUMN CONTACT.qphone IS '�����ڿ���ó';


COMMENT ON COLUMN CONTACT.qnarea IS 'â������';


COMMENT ON COLUMN CONTACT.qcntnt IS '���ǳ���';


COMMENT ON COLUMN CONTACT.qntype IS '��������';


COMMENT ON COLUMN CONTACT.qnsize IS '����Ը�';


COMMENT ON COLUMN CONTACT.qtype IS '���Ǻо�';


COMMENT ON COLUMN CONTACT.qstate IS '����';



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


COMMENT ON TABLE STOCK IS '���';


COMMENT ON COLUMN STOCK.fnum IS '��������ȣ';


COMMENT ON COLUMN STOCK.wnum IS '���ǹ�ȣ';


COMMENT ON COLUMN STOCK.nowstock IS '�������';


COMMENT ON COLUMN STOCK.instock IS '�԰����';


COMMENT ON COLUMN STOCK.outstock IS '������';


COMMENT ON COLUMN STOCK.udate IS '������Ʈ ��¥';


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


COMMENT ON TABLE ORDERS IS '�ֹ�';


COMMENT ON COLUMN ORDERS.onum IS '�ֹ���ȣ';


COMMENT ON COLUMN ORDERS.wnum IS '���ǹ�ȣ';


COMMENT ON COLUMN ORDERS.ocount IS '�ֹ�����';


COMMENT ON COLUMN ORDERS.otype IS '�ֹ�Ÿ��';


COMMENT ON COLUMN ORDERS.osdate IS '�ֹ�����';


COMMENT ON COLUMN ORDERS.oedate IS '������������';


COMMENT ON COLUMN ORDERS.osstore IS '���Ÿ���';


COMMENT ON COLUMN ORDERS.orstore IS '�߽Ÿ���';


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

COMMENT ON TABLE SALES IS '����';


COMMENT ON COLUMN SALES.snum IS '�ǸŹ�ȣ';


COMMENT ON COLUMN SALES.sdate IS '�Ǹ���';


COMMENT ON COLUMN SALES.spay IS '�Ǹűݾ�';


COMMENT ON COLUMN SALES.stype IS '�Ǹ�����';


COMMENT ON COLUMN SALES.smenu IS '�ǸŸ޴�';


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


COMMENT ON TABLE INFORM IS '�˸�';


COMMENT ON COLUMN INFORM.anum IS '�˸���ȣ';


COMMENT ON COLUMN INFORM.asub IS '�˸�����';


COMMENT ON COLUMN INFORM.acntnt IS '�˸�����';


COMMENT ON COLUMN INFORM.asdate IS '�߽ų�¥';


COMMENT ON COLUMN INFORM.ardate IS '���ų�¥';


COMMENT ON COLUMN INFORM.achk IS '�˸�Ȯ�ο���';


COMMENT ON COLUMN INFORM.asstore IS '�߽Ÿ���';


COMMENT ON COLUMN INFORM.arstore IS '���Ÿ���';


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


COMMENT ON TABLE FREEBOARD IS '�����Խ���';


COMMENT ON COLUMN FREEBOARD.bnum IS '�� ��ȣ';


COMMENT ON COLUMN FREEBOARD.bname IS '����';


COMMENT ON COLUMN FREEBOARD.bpw IS '��й�ȣ';


COMMENT ON COLUMN FREEBOARD.bdate IS '��¥';


COMMENT ON COLUMN FREEBOARD.bcnt IS '��ȸ ��';


COMMENT ON COLUMN FREEBOARD.bcntnt IS '����';



