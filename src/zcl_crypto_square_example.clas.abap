CLASS zcl_crypto_square_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS encode
      IMPORTING
        !plain_text        TYPE string
      RETURNING
        VALUE(crypto_text) TYPE string .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_crypto_square_example IMPLEMENTATION.


  METHOD encode.
    DATA(text) = replace( val = to_lower( plain_text ) regex = '[^a-z0-9]' with = '' occ = 0 ).
    CHECK text IS NOT INITIAL.
    DATA(cols) = CONV i( ceil( sqrt( strlen( text ) ) ) ).
    DATA(rows) = CONV i( sqrt( strlen( text ) ) ).
    DO cols TIMES.
      DATA(col) = sy-index - 1.
      DO rows TIMES.
        DATA(offset) = ( sy-index - 1 ) * cols + col.
        IF offset < strlen( text ).
          crypto_text &&= text+offset(1).
        ELSE.
          crypto_text &&= ` `.
        ENDIF.
      ENDDO.
      IF offset + 1 < cols * rows.
        crypto_text &&= ` `.
      ENDIF.
    ENDDO.
  ENDMETHOD.
ENDCLASS.
