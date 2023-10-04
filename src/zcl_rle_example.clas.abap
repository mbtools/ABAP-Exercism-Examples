CLASS zcl_rle_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS encode
      IMPORTING
        !input        TYPE string
      RETURNING
        VALUE(result) TYPE string.

    METHODS decode
      IMPORTING
        !input        TYPE string
      RETURNING
        VALUE(result) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rle_example IMPLEMENTATION.


  METHOD decode.
    DATA(inp) = input.
    DO.
      IF inp IS INITIAL.
        EXIT.
      ENDIF.
      FIND REGEX '^([0-9]+)([A-Za-z ])' IN inp SUBMATCHES DATA(len) DATA(chr).
      IF sy-subrc = 0.
        DO len TIMES.
          result = result && chr.
        ENDDO.
        SHIFT inp LEFT BY ( strlen( len ) + 1 ) PLACES.
      ELSE.
        result = result && inp(1).
        SHIFT inp LEFT.
      ENDIF.
    ENDDO.
  ENDMETHOD.


  METHOD encode.
    DATA(inp) = input.
    DATA chr TYPE string.
    DATA prev TYPE string.
    DATA(len) = 0.
    DO.
      IF inp IS INITIAL.
        EXIT.
      ENDIF.
      chr = inp(1).
      IF prev = '' OR chr = prev.
        len = len + 1.
      ELSEIF len = 1.
        result = result && |{ prev }|.
      ELSEIF len > 1.
        result = result && |{ len }{ prev }|.
        len = 1.
      ENDIF.
      prev = chr.
      SHIFT inp LEFT.
    ENDDO.
    IF len = 1.
      result = result && |{ chr }|.
    ELSEIF len > 1.
      result = result && |{ len }{ chr }|.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
