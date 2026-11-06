*&---------------------------------------------------------------------*
*& Report ZSRA_STUDENT_VALIDATE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZSRA_STUDENT_VALIDATE.
PARAMETERS:
  p_stuid TYPE zsra_student-student_id,
  p_name  TYPE zsra_student-student_name,
  p_dept  TYPE zsra_student-department,
  p_age   TYPE zsra_student-age,
  p_marks TYPE zsra_student-marks.

IF p_stuid IS INITIAL.
  WRITE: / 'Error: Student ID cannot be empty.'.

ELSEIF p_name IS INITIAL.
  WRITE: / 'Error: Student name cannot be empty.'.

ELSEIF p_dept IS INITIAL.
  WRITE: / 'Error: Department cannot be empty.'.

ELSEIF p_age < 17 OR p_age > 30.
  WRITE: / 'Error: Age must be between 17 and 30.'.

ELSEIF p_marks < 0 OR p_marks > 100.
  WRITE: / 'Error: Marks must be between 0 and 100.'.

ELSE.
  WRITE: / 'All student details are valid.'.
ENDIF.
