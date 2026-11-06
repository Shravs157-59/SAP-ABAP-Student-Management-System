REPORT zsra_student_alv.

DATA:
  lt_students TYPE TABLE OF zsra_student,
  lo_alv      TYPE REF TO cl_salv_table.

START-OF-SELECTION.

  SELECT *
    FROM zsra_student
    INTO TABLE @lt_students.

  IF lt_students IS INITIAL.
    WRITE: / 'No student records found.'.
    RETURN.
  ENDIF.

  DATA(lv_student_count) = lines( lt_students ).

  WRITE: / 'Total Number of Students:', lv_student_count.

  TRY.

      cl_salv_table=>factory(
        IMPORTING
          r_salv_table = lo_alv
        CHANGING
          t_table      = lt_students
      ).

      "Improve column headings

      lo_alv->get_columns( )->get_column( 'STUDENT_ID' )->set_short_text( 'ID' ).
      lo_alv->get_columns( )->get_column( 'STUDENT_ID' )->set_medium_text( 'Student ID' ).
      lo_alv->get_columns( )->get_column( 'STUDENT_ID' )->set_long_text( 'Student ID' ).

      lo_alv->get_columns( )->get_column( 'STUDENT_NAME' )->set_short_text( 'Name' ).
      lo_alv->get_columns( )->get_column( 'STUDENT_NAME' )->set_medium_text( 'Student Name' ).
      lo_alv->get_columns( )->get_column( 'STUDENT_NAME' )->set_long_text( 'Student Name' ).

      lo_alv->get_columns( )->get_column( 'DEPARTMENT' )->set_short_text( 'Dept' ).
      lo_alv->get_columns( )->get_column( 'DEPARTMENT' )->set_medium_text( 'Department' ).
      lo_alv->get_columns( )->get_column( 'DEPARTMENT' )->set_long_text( 'Department' ).

      lo_alv->get_columns( )->get_column( 'AGE' )->set_short_text( 'Age' ).
      lo_alv->get_columns( )->get_column( 'AGE' )->set_medium_text( 'Student Age' ).
      lo_alv->get_columns( )->get_column( 'AGE' )->set_long_text( 'Student Age' ).

      lo_alv->get_columns( )->get_column( 'MARKS' )->set_short_text( 'Marks' ).
      lo_alv->get_columns( )->get_column( 'MARKS' )->set_medium_text( 'Student Marks' ).
      lo_alv->get_columns( )->get_column( 'MARKS' )->set_long_text( 'Student Marks' ).

      "Enable ALV toolbar functions

      lo_alv->get_functions( )->set_all( abap_true ).

      "Optimize column width

      lo_alv->get_columns( )->set_optimize( abap_true ).

      "Sort by Student ID

      DATA(lo_sorts) = lo_alv->get_sorts( ).

      lo_sorts->add_sort(
        columnname = 'STUDENT_ID'
        sequence   = if_salv_c_sort=>sort_up
      ).

      "Display ALV

      lo_alv->display( ).

    CATCH cx_salv_not_found.
      WRITE: / 'ALV column not found.'.

    CATCH cx_salv_data_error.
      WRITE: / 'Invalid sorting data.'.

    CATCH cx_salv_existing.
      WRITE: / 'Sorting already exists.'.

    CATCH cx_salv_msg.
      WRITE: / 'Error while displaying ALV report.'.

  ENDTRY.
