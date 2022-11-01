CLASS zcl_armstrong_numbers_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS is_armstrong_number
      IMPORTING
        !num          TYPE i
      RETURNING
        VALUE(result) TYPE abap_bool .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_armstrong_numbers_example IMPLEMENTATION.


  METHOD is_armstrong_number.
    DATA test TYPE i.
    DATA offset TYPE i.
    DATA(s) = |{ num }|.
    DO strlen( s ) TIMES.
      test += s+offset(1) ** strlen( s ).
      offset += 1.
    ENDDO.
    result = boolc( test = num ).
  ENDMETHOD.
ENDCLASS.
