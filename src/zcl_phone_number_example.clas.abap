CLASS zcl_phone_number_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS clean
      IMPORTING
        !number       TYPE string
      RETURNING
        VALUE(result) TYPE string
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_phone_number_example IMPLEMENTATION.


  METHOD clean.
    FIND REGEX '1*.*([2-9]\d\d).*([2-9]\d\d).*(\d\d\d\d).*(\d*)' IN number
      SUBMATCHES DATA(p1) DATA(p2) DATA(p3) DATA(p4).
    IF sy-subrc = 0 AND strlen( p4 ) = 0.
      result = p1 && p2 && p3.
    ELSE.
      DATA(err) = NEW cx_parameter_invalid( ).
      RAISE EXCEPTION err.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
