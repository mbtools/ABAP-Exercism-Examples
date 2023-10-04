CLASS zcl_triangle_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS is_equilateral
      IMPORTING
        !side_a       TYPE f
        !side_b       TYPE f
        !side_c       TYPE f
      RETURNING
        VALUE(result) TYPE abap_bool
      RAISING
        cx_parameter_invalid.

    METHODS is_isosceles
      IMPORTING
        !side_a       TYPE f
        !side_b       TYPE f
        !side_c       TYPE f
      RETURNING
        VALUE(result) TYPE abap_bool
      RAISING
        cx_parameter_invalid.

    METHODS is_scalene
      IMPORTING
        !side_a       TYPE f
        !side_b       TYPE f
        !side_c       TYPE f
      RETURNING
        VALUE(result) TYPE abap_bool
      RAISING
        cx_parameter_invalid.

  PROTECTED SECTION.
  PRIVATE SECTION.

    METHODS
      is_triangle
        IMPORTING
          side_a        TYPE f
          side_b        TYPE f
          side_c        TYPE f
        RETURNING
          VALUE(result) TYPE abap_bool
        RAISING
          cx_parameter_invalid.

ENDCLASS.



CLASS zcl_triangle_example IMPLEMENTATION.


  METHOD is_equilateral.
    is_triangle(
      side_a = side_a
      side_b = side_b
      side_c = side_c
    ).
    result = boolc( side_a = side_b AND side_a = side_c ).
  ENDMETHOD.


  METHOD is_isosceles.
    is_triangle(
      side_a = side_a
      side_b = side_b
      side_c = side_c
    ).
    result = boolc( side_a = side_b OR side_a = side_c OR side_b = side_c ).
  ENDMETHOD.


  METHOD is_scalene.
    is_triangle(
      side_a = side_a
      side_b = side_b
      side_c = side_c
    ).
    result = boolc( side_a <> side_b AND side_a <> side_c AND side_b <> side_c ).
  ENDMETHOD.


  METHOD is_triangle.
    IF side_a <= 0 OR side_b <= 0 OR side_c <= 0.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
    IF side_a + side_b < side_c.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
    IF side_a + side_c < side_b.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
    IF side_b + side_c < side_a.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
