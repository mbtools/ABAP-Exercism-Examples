CLASS zcl_pangram_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS is_pangram
      IMPORTING
        VALUE(sentence) TYPE string
      RETURNING
        VALUE(result)   TYPE abap_bool.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_pangram_example IMPLEMENTATION.


  METHOD is_pangram.
    DATA(test) = sy-abcde.
    DO 26 TIMES.
      DATA(off) = sy-index - 1.
      IF to_upper( sentence ) CA test+off(1).
        test+off(1) = | |.
      ENDIF.
    ENDDO.
    result = xsdbool( test IS INITIAL ).
  ENDMETHOD.
ENDCLASS.
