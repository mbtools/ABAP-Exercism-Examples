CLASS zcl_darts_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS score
      IMPORTING
        !x            TYPE f
        !y            TYPE f
      RETURNING
        VALUE(result) TYPE i .
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_darts_example IMPLEMENTATION.


  METHOD SCORE.
    IF ( ( x * x ) + ( y * y ) ) <= 1.
      result = 10.
    ELSEIF ( ( x * x ) + ( y * y ) ) <= ( 5 * 5 ).
      result = 5.
    ELSEIF ( ( x * x ) + ( y * y ) ) <= ( 10 * 10 ).
      result = 1.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
