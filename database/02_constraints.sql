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
