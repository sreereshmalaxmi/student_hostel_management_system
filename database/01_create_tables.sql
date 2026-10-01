create table room
(
room_id integer,
room_no integer,
floor integer,
type varchar2(20),
capacity integer,
status number(1),
constraint room_pk primary key(room_id));
create table fee_payment
(
payment_id integer,
amount integer,
payment_date date,
due_date date,
payment_status number(1),
constraint fee_payment_pk primary key(payment_id));
create table complaint
(
complaint_id integer,
complaint_date date,
description varchar2(100),
status number(1),
constraint complaint_pk primary key(complaint_id));
CREATE TABLE visitor
(
    visitor_id INTEGER,
    visitor_name VARCHAR2(30),
    visitor_date DATE,
    CONSTRAINT visitor_pk PRIMARY KEY(visitor_id)
);

CREATE TABLE visitor_phone
(
    visitor_id INTEGER,
    phone VARCHAR2(15),
    CONSTRAINT visitor_phone_pk PRIMARY KEY(visitor_id, phone),
    CONSTRAINT visitor_phone_fk FOREIGN KEY(visitor_id)
        REFERENCES visitor(visitor_id)
);
CREATE TABLE warden
(
    warden_id INTEGER,
    first_name VARCHAR2(30),
    middle_name VARCHAR2(30),
    last_name VARCHAR2(30),
    CONSTRAINT warden_pk PRIMARY KEY(warden_id)
);
CREATE TABLE warden_email
(
    warden_id INTEGER,
    email VARCHAR2(50),
    CONSTRAINT warden_email_pk PRIMARY KEY(warden_id, email),
    CONSTRAINT warden_email_fk FOREIGN KEY(warden_id)
        REFERENCES warden(warden_id)
);
CREATE TABLE warden_phone
(
    warden_id INTEGER,
    phone VARCHAR2(15),
    CONSTRAINT warden_phone_pk PRIMARY KEY(warden_id, phone),
    CONSTRAINT warden_phone_fk FOREIGN KEY(warden_id)
        REFERENCES warden(warden_id)
);
CREATE TABLE student
(
    student_id INTEGER,
    first_name VARCHAR2(30),
    middle_name VARCHAR2(30),
    last_name VARCHAR2(30),
    course VARCHAR2(30),
    year INTEGER,
    CONSTRAINT student_pk PRIMARY KEY(student_id)
);

CREATE TABLE student_email
(
    student_id INTEGER,
    email VARCHAR2(50),
    CONSTRAINT student_email_pk PRIMARY KEY(student_id, email),
    CONSTRAINT student_email_fk FOREIGN KEY(student_id)
        REFERENCES student(student_id)
);
CREATE TABLE student_phone
(
    student_id INTEGER,
    phone VARCHAR2(15),
    CONSTRAINT student_phone_pk PRIMARY KEY(student_id, phone),
    CONSTRAINT student_phone_fk FOREIGN KEY(student_id)
        REFERENCES student(student_id)
);
ALTER TABLE room
ADD warden_id INTEGER;

ALTER TABLE room
ADD CONSTRAINT room_warden_fk
FOREIGN KEY (warden_id)
REFERENCES warden(warden_id);

ALTER TABLE student
ADD room_id INTEGER;

ALTER TABLE student
ADD CONSTRAINT student_room_fk
FOREIGN KEY (room_id)
REFERENCES room(room_id);

ALTER TABLE fee_payment
ADD student_id INTEGER;

ALTER TABLE fee_payment
ADD CONSTRAINT payment_student_fk
FOREIGN KEY (student_id)
REFERENCES student(student_id);

ALTER TABLE complaint
ADD student_id INTEGER;

ALTER TABLE complaint
ADD CONSTRAINT complaint_student_fk
FOREIGN KEY (student_id)
REFERENCES student(student_id);

ALTER TABLE complaint
ADD warden_id INTEGER;

ALTER TABLE complaint
ADD CONSTRAINT complaint_warden_fk
FOREIGN KEY (warden_id)
REFERENCES warden(warden_id);

ALTER TABLE visitor
ADD student_id INTEGER;

ALTER TABLE visitor
ADD CONSTRAINT visitor_student_fk
FOREIGN KEY (student_id)
REFERENCES student(student_id);

ALTER TABLE visitor
ADD CONSTRAINT visitor_student_uk
UNIQUE(student_id);

CREATE TABLE complaint_resolution
(
    complaint_id INTEGER,
    resolution_id INTEGER,
    resolution_date DATE,
    remarks VARCHAR2(100),

    PRIMARY KEY (complaint_id, resolution_id),

    FOREIGN KEY (complaint_id)
        REFERENCES complaint(complaint_id)
);
CREATE TABLE visit_purpose
(
    visitor_id INTEGER,
    purpose_id INTEGER,
    purpose VARCHAR2(50),

    PRIMARY KEY (visitor_id, purpose_id),

    FOREIGN KEY (visitor_id)
        REFERENCES visitor(visitor_id)
);
