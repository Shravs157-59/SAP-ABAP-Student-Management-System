*&---------------------------------------------------------------------*
*& Report ZSRA_STUDENT_PARAMS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZSRA_STUDENT_PARAMS.
DATA:
  gv_name  TYPE zsra_student-student_name,
  gv_marks TYPE zsra_student-marks.

START-OF-SELECTION.

  gv_name  = 'Sravani'.
  gv_marks = '85.00'.

  WRITE: / 'BEFORE CALLING FORM'.
  WRITE: / 'Student Name:', gv_name.
  WRITE: / 'Original Marks:', gv_marks.

  ULINE.

  PERFORM calculate_marks
    USING gv_name
    CHANGING gv_marks.

  WRITE: / 'AFTER CALLING FORM'.
  WRITE: / 'Student Name:', gv_name.
  WRITE: / 'Updated Marks:', gv_marks.

* FORM with USING and CHANGING

FORM calculate_marks
  USING p_name TYPE zsra_student-student_name
  CHANGING p_marks TYPE zsra_student-marks.

  p_marks = p_marks + 10.

  WRITE: / 'Processing student:', p_name.

ENDFORM.
