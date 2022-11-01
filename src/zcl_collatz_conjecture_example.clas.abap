CLASS zcl_collatz_conjecture_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS ret_steps
      IMPORTING
        !num         TYPE i
      RETURNING
        VALUE(steps) TYPE i
      RAISING
        cx_parameter_invalid .
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_collatz_conjecture_example IMPLEMENTATION.


  METHOD ret_steps.
    DATA(c) = num.
    IF c < 1.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
    WHILE c > 1.
      c = COND #( WHEN c MOD 2 = 0 THEN c / 2 ELSE c * 3 + 1 ).
      steps += 1.
    ENDWHILE.
  ENDMETHOD.
ENDCLASS.
