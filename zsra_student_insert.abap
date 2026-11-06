*&---------------------------------------------------------------------*
*& Report ZSRA_STUDENT_INSERT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZSRA_STUDENT_INSERT.
PARAMETERS:
  p_stuid TYPE zsra_student-student_id,
  p_name  TYPE zsra_student-student_name,
  p_dept  TYPE zsra_student-department,
  p_age   TYPE zsra_student-age,
  p_marks TYPE zsra_student-marks.

DATA:
  gs_student TYPE zsra_student,
  lv_existing TYPE zsra_student-student_id.

* Validate student ID
IF p_stuid IS INITIAL.
  WRITE: / 'Error: Student ID cannot be empty.'.
  RETURN.
ENDIF.

* Validate student name
IF p_name IS INITIAL.
  WRITE: / 'Error: Student name cannot be empty.'.
  RETURN.
ENDIF.

* Validate department
IF p_dept IS INITIAL.
  WRITE: / 'Error: Department cannot be empty.'.
  RETURN.
ENDIF.

* Validate age
IF p_age < 17 OR p_age > 30.
  WRITE: / 'Error: Age must be between 17 and 30.'.
  RETURN.
ENDIF.

* Validate marks
IF p_marks < 0 OR p_marks > 100.
  WRITE: / 'Error: Marks must be between 0 and 100.'.
  RETURN.
ENDIF.

* Check duplicate Student ID
SELECT SINGLE student_id
  FROM zsra_student
  INTO @lv_existing
  WHERE student_id = @p_stuid.

IF sy-subrc = 0.
  WRITE: / 'Error: Student ID already exists.'.
  RETURN.
ENDIF.

* Assign input values
gs_student-student_id   = p_stuid.
gs_student-student_name = p_name.
gs_student-department   = p_dept.
gs_student-age          = p_age.
gs_student-marks        = p_marks.

* Insert student record
TRY.

    INSERT zsra_student FROM @gs_student.

    IF sy-subrc = 0.

      COMMIT WORK.

      WRITE: / 'Student record inserted successfully.'.

    ELSEIF sy-subrc = 4.

      WRITE: / 'Error: Student ID already exists.'.

    ELSE.

      WRITE: / 'Student insertion failed.'.

    ENDIF.

  CATCH cx_sy_open_sql_db INTO DATA(lx_sql).

    ROLLBACK WORK.

    WRITE: / 'Database Error:', lx_sql->get_text( ).

ENDTRY.
