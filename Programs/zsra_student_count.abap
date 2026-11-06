*&---------------------------------------------------------------------*
*& Report ZSRA_STUDENT_COUNT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZSRA_STUDENT_COUNT.
DATA lv_count TYPE i.

SELECT COUNT( * )
  FROM zsra_student
  INTO @lv_count.

WRITE: / '================================'.
WRITE: / '     STUDENT MANAGEMENT SYSTEM'.
WRITE: / '================================'.
WRITE: / 'Total Number of Students:', lv_count.
