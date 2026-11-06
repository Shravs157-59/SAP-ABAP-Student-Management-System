*&---------------------------------------------------------------------*
*& Report ZSRA_STUDENT_MGMT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZSRA_STUDENT_MGMT.
* Step 1: Define student structure
TYPES: BEGIN OF ty_student,
         student_id TYPE n LENGTH 5,
         name       TYPE c LENGTH 30,
         department TYPE c LENGTH 20,
         age        TYPE i,
         marks      TYPE p LENGTH 5 DECIMALS 2,
       END OF ty_student.

* Step 2: Declare internal table and work area
DATA: gt_students TYPE STANDARD TABLE OF ty_student
                  WITH DEFAULT KEY,
      gs_student  TYPE ty_student.

* Step 3: Insert first student
CLEAR gs_student.
gs_student-student_id = '10001'.
gs_student-name       = 'Shannu'.
gs_student-department = 'CSE'.
gs_student-age        = 20.
gs_student-marks      = '85.50'.
APPEND gs_student TO gt_students.

* Step 4: Insert second student
CLEAR gs_student.
gs_student-student_id = '10002'.
gs_student-name       = 'Bhanu'.
gs_student-department = 'CSE'.
gs_student-age        = 20.
gs_student-marks      = '91.00'.
APPEND gs_student TO gt_students.

* Step 5: Insert third student
CLEAR gs_student.
gs_student-student_id = '10003'.
gs_student-name       = 'Zayar'.
gs_student-department = 'ECE'.
gs_student-age        = 22.
gs_student-marks      = '78.50'.
APPEND gs_student TO gt_students.

* Step 6: Display student records
WRITE: / 'STUDENT MANAGEMENT SYSTEM'.
ULINE.

WRITE: / 'ID',
         10 'NAME',
         43 'DEPARTMENT',
         65 'AGE',
         75 'MARKS'.

ULINE.

LOOP AT gt_students INTO gs_student.

  WRITE: / gs_student-student_id,
           10 gs_student-name,
           43 gs_student-department,
           65 gs_student-age,
           75 gs_student-marks.

ENDLOOP.

ULINE.
WRITE: / 'Total Students:', lines( gt_students ).
