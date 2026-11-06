*&---------------------------------------------------------------------*
*& Report ZSRA_STUDENT_UPDATE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZSRA_STUDENT_UPDate.

PARAMETERS:
  p_stuid TYPE zsra_student-student_id,
  p_name  TYPE zsra_student-student_name,
  p_dept  TYPE zsra_student-department,
  p_age   TYPE zsra_student-age,
  p_marks TYPE zsra_student-marks.

DATA gs_student TYPE zsra_student.
* Validate Student ID
IF p_stuid IS INITIAL.
  WRITE: / 'Error: Student ID cannot be empty.'.
  RETURN.
ENDIF.

* Validate Student Name
IF p_name IS INITIAL.
  WRITE: / 'Error: Student name cannot be empty.'.
  RETURN.
ENDIF.

* Validate Department
IF p_dept IS INITIAL.
  WRITE: / 'Error: Department cannot be empty.'.
  RETURN.
ENDIF.

* Validate Age
IF p_age < 17 OR p_age > 30.
  WRITE: / 'Error: Age must be between 17 and 30.'.
  RETURN.
ENDIF.

* Validate Marks
IF p_marks < 0 OR p_marks > 100.
  WRITE: / 'Error: Marks must be between 0 and 100.'.
  RETURN.
ENDIF.

TRY.

    SELECT SINGLE *
      FROM zsra_student
      INTO @gs_student
      WHERE student_id = @p_stuid.

    IF sy-subrc = 0.

      UPDATE zsra_student
        SET student_name = @p_name,
            department   = @p_dept,
            age          = @p_age,
            marks        = @p_marks
        WHERE student_id = @p_stuid.

      IF sy-subrc = 0.

        COMMIT WORK.

        WRITE: / 'Student record updated successfully.'.

      ELSE.

        ROLLBACK WORK.

        WRITE: / 'Student update failed.'.

      ENDIF.

    ELSE.

      WRITE: / 'Student ID not found. No record updated.'.

    ENDIF.

  CATCH cx_sy_open_sql_db INTO DATA(lx_sql).

    ROLLBACK WORK.

    WRITE: / 'Database Error:', lx_sql->get_text( ).

ENDTRY.
