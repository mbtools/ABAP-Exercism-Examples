CLASS zcl_isbn_verifier_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS is_valid
      IMPORTING
        VALUE(isbn)   TYPE string
      RETURNING
        VALUE(result) TYPE abap_bool.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_isbn_verifier_example IMPLEMENTATION.


  METHOD is_valid.
    DATA(sum) = 0.
    DATA(pos) = 0.
    DO strlen( isbn ) TIMES.
      DATA(digit) = substring( val = isbn off = sy-index - 1 len = 1 ).
      IF digit CA '0123456789'.
        sum = sum + digit * ( 10 - pos ).
        pos = pos + 1.
      ELSEIF digit = 'X'.
        IF pos <> 9.
          RETURN. "false
        ENDIF.
        sum = sum + 10.
        pos = pos + 1.
      ELSEIF digit <> '-'.
        RETURN. "false
      ENDIF.
    ENDDO.
    result = xsdbool( sum MOD 11 = 0 AND pos = 10 ).
  ENDMETHOD.
ENDCLASS.
