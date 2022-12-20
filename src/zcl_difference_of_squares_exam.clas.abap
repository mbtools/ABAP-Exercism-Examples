CLASS zcl_difference_of_squares_exam DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      ret_difference_of_squares IMPORTING num         TYPE i
                                RETURNING VALUE(diff) TYPE i,
      ret_sum_of_squares        IMPORTING num                   TYPE i
                                RETURNING VALUE(sum_of_squares) TYPE i,
      ret_square_of_sum         IMPORTING num                  TYPE i
                                RETURNING VALUE(square_of_sum) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_difference_of_squares_exam IMPLEMENTATION.


  METHOD ret_difference_of_squares.
    diff = ret_square_of_sum( num ) - ret_sum_of_squares( num ).
  ENDMETHOD.


  METHOD ret_square_of_sum.
    DO num TIMES.
      square_of_sum += sy-index.
    ENDDO.
    square_of_sum = square_of_sum ** 2.
  ENDMETHOD.


  METHOD ret_sum_of_squares.
    DO num TIMES.
      sum_of_squares += sy-index ** 2.
    ENDDO.
  ENDMETHOD.
ENDCLASS.
