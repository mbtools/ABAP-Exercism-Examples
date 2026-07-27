CLASS zcl_eliuds_eggs_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS egg_count IMPORTING number       TYPE i
                      RETURNING VALUE(count) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_eliuds_eggs_example IMPLEMENTATION.


  METHOD egg_count.
    DATA(val) = number.
    DO.
      IF val MOD 2 = 1.
        count = count + 1.
      ENDIF.
      val = val DIV 2.
      IF val = 0.
        EXIT.
      ENDIF.
    ENDDO.
  ENDMETHOD.
ENDCLASS.
