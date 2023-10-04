CLASS zcl_prime_factors_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.

    METHODS factors
      IMPORTING
        !input        TYPE int8
      RETURNING
        VALUE(result) TYPE integertab.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_prime_factors_example IMPLEMENTATION.


  METHOD factors.
    CHECK input > 1.
    DATA(inp) = input.
    DATA(fac) = 2.
    DO.
      IF inp MOD fac = 0.
        INSERT fac INTO TABLE result.
        inp = inp DIV fac.
        IF inp = 1.
          EXIT.
        ENDIF.
      ELSE.
        fac = fac + 1.
        IF fac MOD 2 = 0.
          fac = fac + 1.
        ENDIF.
      ENDIF.
    ENDDO.
  ENDMETHOD.
ENDCLASS.
