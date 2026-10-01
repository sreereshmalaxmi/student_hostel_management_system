# Relational Schema

The project documentation defines the following relations.

| Relation | Key attributes / columns |
|---|---|
| WARDEN | `warden_id` (PK), `first_name`, `middle_name`, `last_name` |
| WARDEN_EMAIL | `warden_id` (PK/FK), `email` (PK) |
| WARDEN_PHONE | `warden_id` (PK/FK), `phone` (PK) |
| ROOM | `room_id` (PK), `room_no`, `floor`, `type`, `capacity`, `status`, `warden_id` (FK) |
| STUDENT | `student_id` (PK), `first_name`, `middle_name`, `last_name`, `course`, `year`, `room_id` (FK) |
| STUDENT_EMAIL | `student_id` (PK/FK), `email` (PK) |
| STUDENT_PHONE | `student_id` (PK/FK), `phone` (PK) |
| FEE_PAYMENT | `payment_id` (PK), `amount`, `payment_date`, `due_date`, `payment_status`, `student_id` (FK) |
| COMPLAINT | `complaint_id` (PK), `complaint_date`, `description`, `status`, `student_id` (FK), `warden_id` (FK) |
| COMPLAINT_RESOLUTION | `complaint_id` (PK/FK), `resolution_id` (PK), `resolution_date`, `remarks` |
| VISITOR | `visitor_id` (PK), `visitor_name`, `visitor_date`, `student_id` (FK) |
| VISITOR_PHONE | `visitor_id` (PK/FK), `phone` (PK) |
| VISIT_PURPOSE | `visitor_id` (PK/FK), `purpose_id` (PK), `purpose` |
