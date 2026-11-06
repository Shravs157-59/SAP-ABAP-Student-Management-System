REPORT zsra_student_delete.

PARAMETERS p_stuid TYPE zsra_student-student_id.

DATA gs_student TYPE zsra_student.

IF p_stuid IS INITIAL.
  WRITE: / 'Please enter Student ID.'.
  RETURN.
ENDIF.

TRY.

    SELECT SINGLE *
      FROM zsra_student
      INTO @gs_student
      WHERE student_id = @p_stuid.

    IF sy-subrc = 0.

      DELETE FROM zsra_student
        WHERE student_id = @p_stuid.

      IF sy-subrc = 0.
        COMMIT WORK.
        WRITE: / 'Student deleted successfully.'.
      ELSE.
        ROLLBACK WORK.
        WRITE: / 'Student deletion failed.'.
      ENDIF.

    ELSE.
      WRITE: / 'Student ID not found!'.
    ENDIF.

  CATCH cx_sy_open_sql_db INTO DATA(lx_sql).
    ROLLBACK WORK.
    WRITE: / 'Database Error:', lx_sql->get_text( ).

ENDTRY.
