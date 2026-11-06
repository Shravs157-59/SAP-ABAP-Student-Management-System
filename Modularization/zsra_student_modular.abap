*&---------------------------------------------------------------------*
*& Report ZSRA_STUDENT_MODULAR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZSRA_STUDENT_MODULAR.
DATA:
  gt_students TYPE STANDARD TABLE OF zsra_student
              WITH DEFAULT KEY,
  gs_student  TYPE zsra_student.

START-OF-SELECTION.

  PERFORM get_students.

  PERFORM display_students.

  PERFORM display_total.

*--------------------------------------------------*
* FORM 1: Retrieve student records
*--------------------------------------------------*
FORM get_students.

  SELECT *
    FROM zsra_student
    INTO TABLE @gt_students.

ENDFORM.

*--------------------------------------------------*
* FORM 2: Display student records
*--------------------------------------------------*
FORM display_students.

  IF gt_students IS INITIAL.

    WRITE: / 'No student records found.'.

  ELSE.

    ULINE.
    WRITE: / 'STUDENT MANAGEMENT REPORT'.
    ULINE.

    LOOP AT gt_students INTO gs_student.

      WRITE: / 'Student ID:', gs_student-student_id.
      WRITE: / 'Name:', gs_student-student_name.
      WRITE: / 'Department:', gs_student-department.
      WRITE: / 'Age:', gs_student-age.
      WRITE: / 'Marks:', gs_student-marks.

      ULINE.

    ENDLOOP.

  ENDIF.

ENDFORM.

*--------------------------------------------------*
* FORM 3: Display total student count
*--------------------------------------------------*
FORM display_total.

  WRITE: / 'Total Students:', lines( gt_students ).

ENDFORM.
