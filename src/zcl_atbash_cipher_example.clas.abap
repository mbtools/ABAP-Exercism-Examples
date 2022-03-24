CLASS zcl_atbash_cipher_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS decode
      IMPORTING
        !cipher_text      TYPE string
      RETURNING
        VALUE(plain_text) TYPE string .
    METHODS encode
      IMPORTING
        !plain_text        TYPE string
      RETURNING
        VALUE(cipher_text) TYPE string .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_atbash_cipher_example IMPLEMENTATION.


  METHOD DECODE.
    plain_text = replace(
      val  = encode( cipher_text )
      sub  = ` `
      with = ``
      occ  = 0 ).
  ENDMETHOD.


  METHOD ENCODE.
    CONSTANTS abc TYPE string VALUE 'abcdefghijklmnopqrstuvwxyz'.
    DATA(text) = replace( val   = to_lower( plain_text )
                          regex = `[ .,]`
                          with  = ``
                          occ   = 0 ).
    DATA(idx) = 0.
    WHILE idx < strlen( text ).
      DATA(pos) = 25 - find( val = abc
                             sub = text+idx(1) ).
      IF pos BETWEEN 0 AND 25.
        cipher_text = cipher_text && substring( val = abc
                                                off = pos
                                                len = 1 ).
      ELSE.
        cipher_text = cipher_text && text+idx(1).
      ENDIF.
      idx = idx + 1.
      IF idx MOD 5 = 0 AND idx < strlen( text ).
        cipher_text = cipher_text && ` `.
      ENDIF.
    ENDWHILE.
  ENDMETHOD.
ENDCLASS.
