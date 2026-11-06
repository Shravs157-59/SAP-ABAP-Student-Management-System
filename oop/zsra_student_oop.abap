REPORT zsra_student_oop.
CLASS lcx_invalid_marks DEFINITION
  INHERITING FROM cx_static_check.
ENDCLASS.

CLASS lcl_student DEFINITION.

  PUBLIC SECTION.

  METHODS:
  constructor
    IMPORTING
      iv_id    TYPE zsra_student-student_id
      iv_name  TYPE zsra_student-student_name
      iv_dept  TYPE zsra_student-department
      iv_age   TYPE zsra_student-age
      iv_marks TYPE zsra_student-marks,

  validate_student,
  display_student,

  update_marks
  IMPORTING
    iv_new_marks TYPE zsra_student-marks
  RAISING
    lcx_invalid_marks,

  get_marks
    RETURNING
      VALUE(rv_marks) TYPE zsra_student-marks.
  PRIVATE SECTION.

    DATA: gv_student_id TYPE zsra_student-student_id,
          gv_name       TYPE zsra_student-student_name,
          gv_department TYPE zsra_student-department,
          gv_age        TYPE zsra_student-age,
          gv_marks      TYPE zsra_student-marks.

ENDCLASS.


CLASS lcl_student IMPLEMENTATION.

  METHOD constructor.

    gv_student_id = iv_id.
    gv_name       = iv_name.
    gv_department = iv_dept.
    gv_age        = iv_age.
    gv_marks      = iv_marks.

  ENDMETHOD.


  METHOD validate_student.

    IF gv_age < 17 OR gv_age > 30.
      WRITE: / 'Invalid Age'.

    ELSEIF gv_marks < 0 OR gv_marks > 100.
      WRITE: / 'Invalid Marks'.

    ELSE.
      WRITE: / 'Student Details Valid'.
    ENDIF.

  ENDMETHOD.


  METHOD display_student.

    ULINE.
    WRITE: / 'STUDENT DETAILS'.
    ULINE.

    WRITE: / 'Student ID:', gv_student_id.
    WRITE: / 'Name:', gv_name.
    WRITE: / 'Department:', gv_department.
    WRITE: / 'Age:', gv_age.
    WRITE: / 'Marks:', gv_marks.

    ULINE.

  ENDMETHOD.
METHOD update_marks.

  IF iv_new_marks < 0 OR iv_new_marks > 100.

    RAISE EXCEPTION TYPE lcx_invalid_marks.

  ELSE.

    gv_marks = iv_new_marks.

    WRITE: / 'Student Marks Updated Successfully'.

  ENDIF.

ENDMETHOD.
METHOD get_marks.

  rv_marks = gv_marks.

ENDMETHOD.

ENDCLASS.


START-OF-SELECTION.

  DATA(lo_student) = NEW lcl_student(
    iv_id    = '10005'
    iv_name  = 'Arjun Kumar'
    iv_dept  = 'CSE'
    iv_age   = 21
    iv_marks = '94.00'
  ).


  WRITE: / 'BEFORE UPDATE'.

  lo_student->display_student( ).

  TRY.

    lo_student->update_marks(
      iv_new_marks = '98.00'
    ).

  CATCH lcx_invalid_marks.

    WRITE: / 'ERROR: Marks must be between 0 and 100'.

ENDTRY.

  lo_student->display_student( ).
