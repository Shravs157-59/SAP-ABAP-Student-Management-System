REPORT zsra_student_search.

DATA:
  gs_student  TYPE zsra_student,
  gt_students TYPE STANDARD TABLE OF zsra_student
              WITH DEFAULT KEY,
  gv_count    TYPE i.

PARAMETERS:
  p_stuid TYPE zsra_student-student_id,
  p_all   AS CHECKBOX DEFAULT ' '.

* Option 1: Display all students

IF p_all = 'X'.

  SELECT *
    FROM zsra_student
    INTO TABLE @gt_students.

  IF sy-subrc = 0.

    ULINE.
    WRITE: / 'ALL STUDENT RECORDS'.
    ULINE.

    LOOP AT gt_students INTO gs_student.

      WRITE: / 'Student ID:', gs_student-student_id.
      WRITE: / 'Name:', gs_student-student_name.
      WRITE: / 'Department:', gs_student-department.
      WRITE: / 'Age:', gs_student-age.
      WRITE: / 'Marks:', gs_student-marks.
      ULINE.

    ENDLOOP.

    gv_count = lines( gt_students ).

    WRITE: / 'Total Students:', gv_count.

  ELSE.

    WRITE: / 'No student records found.'.

  ENDIF.

* Option 2: Search student by ID

ELSE.

  IF p_stuid IS INITIAL.

    WRITE: / 'Please enter Student ID or select Display All.'.

  ELSE.

    SELECT SINGLE *
      FROM zsra_student
      INTO @gs_student
      WHERE student_id = @p_stuid.

    IF sy-subrc = 0.

      ULINE.
      WRITE: / 'STUDENT DETAILS'.
      ULINE.

      WRITE: / 'Student ID:', gs_student-student_id.
      WRITE: / 'Name:', gs_student-student_name.
      WRITE: / 'Department:', gs_student-department.
      WRITE: / 'Age:', gs_student-age.
      WRITE: / 'Marks:', gs_student-marks.

    ELSE.

      WRITE: / 'Student not found!'.

    ENDIF.

  ENDIF.

ENDIF.
