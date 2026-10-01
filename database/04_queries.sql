/*1. Display all students*/
SELECT * 
FROM student;
/* 2. Display student details with their room */
SELECT s.student_id,
       s.first_name || ' ' || s.last_name AS student_name,
       s.course,
       s.year,
       r.room_no,
       r.floor,
       r.type
FROM student s
JOIN room r
ON s.room_id = r.room_id;
/*3. Find students belonging to CSE*/
SELECT student_id,
       first_name,
       last_name,
       course,
       year
FROM student
WHERE course = 'CSE';
/* 4. Display rooms managed by each warden */

SELECT w.warden_id,
       w.first_name || ' ' || w.last_name AS warden_name,
       r.room_no,
       r.floor,
       r.type
FROM warden w
JOIN room r
ON w.warden_id = r.warden_id
ORDER BY w.warden_id;


/* 5. Display students who have paid their fees */

SELECT s.student_id,
       s.first_name || ' ' || s.last_name AS student_name,
       f.amount,
       f.payment_date,
       f.payment_status
FROM student s
JOIN fee_payment f
ON s.student_id = f.student_id
WHERE f.payment_status = 1;


/* 6. Display students whose fee payment is pending */

SELECT s.student_id,
       s.first_name || ' ' || s.last_name AS student_name,
       f.amount,
       f.due_date
FROM student s
JOIN fee_payment f
ON s.student_id = f.student_id
WHERE f.payment_status = 0;


/* 7. Display complaints with student and warden details */

SELECT c.complaint_id,
       s.first_name || ' ' || s.last_name AS student_name,
       c.description,
       c.complaint_date,
       c.status,
       w.first_name || ' ' || w.last_name AS warden_name
FROM complaint c
JOIN student s
ON c.student_id = s.student_id
JOIN warden w
ON c.warden_id = w.warden_id;


/* 8. Display unresolved complaints */

SELECT complaint_id,
       student_id,
       description,
       complaint_date
FROM complaint
WHERE status = 0;


/* 9. Count students in each room */

SELECT r.room_no,
       r.capacity,
       COUNT(s.student_id) AS students_count
FROM room r
LEFT JOIN student s
ON r.room_id = s.room_id
GROUP BY r.room_no, r.capacity
ORDER BY r.room_no;


/* 10. Find rooms having available capacity */

SELECT r.room_no,
       r.capacity,
       COUNT(s.student_id) AS occupied,
       r.capacity - COUNT(s.student_id) AS available
FROM room r
LEFT JOIN student s
ON r.room_id = s.room_id
GROUP BY r.room_no, r.capacity
HAVING COUNT(s.student_id) < r.capacity;


/* 11. Count students in each course */

SELECT course,
       COUNT(*) AS total_students
FROM student
GROUP BY course
ORDER BY total_students DESC;


/* 12. Find total fee collected */

SELECT SUM(amount) AS total_fee_collected
FROM fee_payment
WHERE payment_status = 1;


/* 13. Display visitors with the students they visited */

SELECT v.visitor_id,
       v.visitor_name,
       v.visitor_date,
       s.student_id,
       s.first_name || ' ' || s.last_name AS student_name
FROM visitor v
JOIN student s
ON v.student_id = s.student_id
ORDER BY v.visitor_date;


/* 14. Count visitors for each student */

SELECT s.student_id,
       s.first_name || ' ' || s.last_name AS student_name,
       COUNT(v.visitor_id) AS visitor_count
FROM student s
JOIN visitor v
ON s.student_id = v.student_id
GROUP BY s.student_id,
         s.first_name,
         s.last_name
ORDER BY visitor_count DESC;


/* 15. Display complaint resolutions */

SELECT c.complaint_id,
       c.description,
       cr.resolution_date,
       cr.remarks
FROM complaint c
JOIN complaint_resolution cr
