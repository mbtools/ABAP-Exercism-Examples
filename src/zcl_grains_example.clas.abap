CLASS zcl_grains_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES type_result TYPE decfloat34.

    METHODS square
      IMPORTING
        !input        TYPE i
      RETURNING
        VALUE(result) TYPE type_result
      RAISING
        cx_parameter_invalid.

    METHODS total
      RETURNING
        VALUE(result) TYPE type_result
      RAISING
        cx_parameter_invalid.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_grains_example IMPLEMENTATION.


  METHOD square.
    IF input BETWEEN 1 AND 64.
      result = 2 ** ( input - 1 ).
    ELSE.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
  ENDMETHOD.


  METHOD total.
    DO 64 TIMES.
      result = result + square( sy-index ).
    ENDDO.
  ENDMETHOD.
ENDCLASS.
