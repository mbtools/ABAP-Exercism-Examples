CLASS zcl_matrix_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.

    METHODS matrix_row
      IMPORTING
        !string       TYPE string
        !index        TYPE i
      RETURNING
        VALUE(result) TYPE integertab.

    METHODS matrix_column
      IMPORTING
        !string       TYPE string
        !index        TYPE i
      RETURNING
        VALUE(result) TYPE integertab.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_matrix_example IMPLEMENTATION.


  METHOD matrix_column.
    DATA i TYPE i.
    SPLIT string AT '\n' INTO TABLE DATA(rows).
    LOOP AT rows INTO DATA(row).
      SPLIT row AT ` ` INTO TABLE DATA(cols).
      READ TABLE cols INTO DATA(col) INDEX index.
      IF sy-subrc = 0.
        i = col.
        INSERT i INTO TABLE result.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


  METHOD matrix_row.
    DATA i TYPE i.
    SPLIT string AT '\n' INTO TABLE DATA(rows).
    READ TABLE rows INTO DATA(row) INDEX index.
    IF sy-subrc = 0.
      SPLIT row AT ` ` INTO TABLE DATA(cols).
      LOOP AT cols INTO DATA(col).
        i = col.
        INSERT i INTO TABLE result.
      ENDLOOP.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
