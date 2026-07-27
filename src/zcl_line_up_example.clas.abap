CLASS zcl_line_up_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS format IMPORTING name          TYPE string
                             number        TYPE i
                   RETURNING VALUE(result) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_line_up_example IMPLEMENTATION.


  METHOD format.
    DATA(nth) = 'th'.
    IF number MOD 10 = 1 AND number <> 11.
      nth = 'st'.
    ELSEIF number MOD 10 = 2 AND number <> 12.
      nth = 'nd'.
    ELSEIF number MOD 10 = 3 AND number <> 13.
      nth = 'rd'.
    ENDIF.
    result = |{ name }, you are the { number }{ nth } customer we serve today. Thank you!|.
  ENDMETHOD.
ENDCLASS.
