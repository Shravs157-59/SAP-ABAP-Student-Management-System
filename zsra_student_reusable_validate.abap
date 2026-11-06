*&---------------------------------------------------------------------*
*& Report ZSRA_STUDENT_REUSABLE_VALIDATE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZSRA_STUDENT_REUSABLE_VALIDATE.
PARAMETERS:
  p_age   TYPE zsra_student-age,
  p_marks TYPE zsra_student-marks.

DATA:
  gv_valid   TYPE abap_bool,
  gv_message TYPE string.

START-OF-SELECTION.

  PERFORM validate_student
    USING p_age p_marks
    CHANGING gv_valid gv_message.

  IF gv_valid = abap_true.
    WRITE: / 'Student validation successful!'.
  ELSE.
    WRITE: / gv_message.
  ENDIF.


FORM validate_student
  USING iv_age TYPE zsra_student-age
        iv_marks TYPE zsra_student-marks
  CHANGING cv_valid TYPE abap_bool
           cv_message TYPE string.

  cv_valid = abap_true.
  CLEAR cv_message.

  IF iv_age < 17 OR iv_age > 30.

    cv_valid = abap_false.
    cv_message = 'Invalid Age! Age must be between 17 and 30.'.

  ELSEIF iv_marks < 0 OR iv_marks > 100.

    cv_valid = abap_false.
    cv_message = 'Invalid Marks! Marks must be between 0 and 100.'.

  ENDIF.

ENDFORM.
