# Student Hostel Management System

A centralized relational database project for managing student hostel operations using Oracle SQL.

## Overview

The system manages:

- Student registration
- Room allocation and occupancy
- Warden management
- Hostel fee payments
- Complaint tracking and resolution
- Visitor records
- SQL-based reporting

## Technology

- Oracle Database / Oracle SQL
- SQL Developer
- ER modeling
- Relational database design
- Normalization up to 3NF

## Database Design

The supplied project implements 13 tables covering core hostel entities, multi-valued attributes, and supporting relationship data.

### Core entities

- WARDEN
- ROOM
- STUDENT
- FEE_PAYMENT
- COMPLAINT
- VISITOR

### Supporting tables

- WARDEN_EMAIL
- WARDEN_PHONE
- STUDENT_EMAIL
- STUDENT_PHONE
- VISITOR_PHONE
- COMPLAINT_RESOLUTION
- VISIT_PURPOSE

## DBMS Concepts Demonstrated

- Primary keys
- Foreign keys
- Composite primary keys
- UNIQUE constraints
- Referential integrity
- 1NF, 2NF and 3NF
- INNER JOIN
- LEFT JOIN
- WHERE
- GROUP BY
- HAVING
- COUNT()
- SUM()
- SQL reporting

## Repository Structure

```text
Student-Hostel-Management-System/
├── README.md
├── .gitignore
├── database/
│   ├── 01_create_tables.sql
│   ├── 02_constraints.sql
│   ├── 03_insert_sample_data.sql
│   └── 04_queries.sql
├── documentation/
│   ├── Project_Report.pdf
│   ├── ER_Diagram.png
│   ├── Relational_Schema.md
│   └── Normalization.md
├── presentation/
│   └── Student_Hostel_Management_System.pptx
└── screenshots/
```

## How to Run

1. Open Oracle SQL Developer and connect to an Oracle database.
2. Run `database/01_create_tables.sql`.
3. Run `database/02_constraints.sql`.
4. Run `database/03_insert_sample_data.sql`.
5. Run the required queries from `database/04_queries.sql`.

## Query Examples

The query file includes examples for:

- Listing all students
- Displaying students with room details
- Finding CSE students
- Displaying rooms managed by each warden
- Finding students who have paid fees
- Finding pending fee payments
- Displaying complaints with student and warden details
- Finding unresolved complaints
- Counting students per room
- Finding rooms with available capacity
- Counting students per course
- Calculating total fees collected
- Displaying visitor logs
- Counting visitors per student
- Displaying complaint resolutions

## Documentation

See `documentation/Project_Report.pdf` for the complete project report, including the problem statement, objectives, system analysis, ER design, relational schema, table design, normalization, SQL implementation, query outputs, conclusion and future enhancements.

## Presentation

The final classroom presentation is available in `presentation/Student_Hostel_Management_System.pptx`.

## Note on Sample Data

The repository is intended for academic demonstration. Before publishing publicly, replace any real personal information in sample records with fictional data.

## Team

Add the project team members here before publishing:

- Name 1
- Name 2
- Name 3
- Name 4
