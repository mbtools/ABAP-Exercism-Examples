CLASS zcl_isogram_example DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS is_isogram
      IMPORTING
        VALUE(phrase) TYPE string
      RETURNING
        VALUE(result) TYPE abap_bool.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_isogram_example IMPLEMENTATION.


  METHOD is_isogram.
    DATA res TYPE c LENGTH 26.
    DO strlen( phrase ) TIMES.
      DATA(pos) = find( val = sy-abcde sub = to_upper( phrase(1) ) ).
      IF pos >= 0.
        IF res+pos(1) = abap_true.
          RETURN.
        ELSE.
          res+pos(1) = abap_true.
        ENDIF.
      ENDIF.
      SHIFT phrase LEFT.
    ENDDO.
    result = abap_true.
  ENDMETHOD.
ENDCLASS.
