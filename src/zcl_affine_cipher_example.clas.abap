CLASS zcl_affine_cipher_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF key,
             a TYPE i,
             b TYPE i,
           END OF key.
    CONSTANTS m TYPE i VALUE 26.
    METHODS:
      encode IMPORTING phrase        TYPE string
                       key           TYPE key
             RETURNING VALUE(cipher) TYPE string
             RAISING   cx_parameter_invalid,
      decode IMPORTING cipher        TYPE string
                       key           TYPE key
             RETURNING VALUE(phrase) TYPE string
             RAISING   cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS mmi
      IMPORTING a          TYPE i
      RETURNING VALUE(mmi) TYPE i.
ENDCLASS.



CLASS zcl_affine_cipher_example IMPLEMENTATION.


  METHOD decode.
    DATA log TYPE string. " <<< FOR LOGGING
    IF key-a MOD 2 = 0 OR key-a MOD 13 = 0.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
    DO strlen( cipher ) TIMES.
      DATA(cha) = substring( val = cipher off = sy-index - 1 len = 1 ).
      DATA(pos) = find( val = to_lower( sy-abcde && '0123456789' ) sub = to_lower( cha ) ).
      IF pos >= 0.
        IF pos < 26.
          DATA(y) = ( mmi( key-a ) * ( pos - key-b ) ) MOD m.
          phrase &&= to_lower( sy-abcde+y(1) ).
        ELSE.
          phrase &&= cha.
        ENDIF.
      ENDIF.
    ENDDO.
  ENDMETHOD.


  METHOD encode.
    DATA len TYPE i.
    IF key-a MOD 2 = 0 OR key-a MOD 13 = 0.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
    DO strlen( phrase ) TIMES.
      DATA(cha) = substring( val = phrase off = sy-index - 1 len = 1 ).
      DATA(pos) = find( val = to_lower( sy-abcde && '0123456789' ) sub = to_lower( cha ) ).
      IF pos >= 0.
        IF len > 0 AND len MOD 5 = 0.
          cipher &&= ` `.
        ENDIF.
        IF pos < 26.
          DATA(x) = ( key-a * pos + key-b ) MOD m.
          cipher &&= to_lower( sy-abcde+x(1) ).
        ELSE.
          cipher &&= cha.
        ENDIF.
        len += 1.
      ENDIF.
    ENDDO.
  ENDMETHOD.


  METHOD mmi.
    " https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm
    DATA(t) = 0.
    DATA(newt) = 1.
    DATA(r) = m.
    DATA(newr) = a.

    WHILE newr <> 0.
      DATA(quotient) = r DIV newr.
      DATA(temp) = t.
      t = newt.
      newt = temp - quotient * newt.
      temp = r.
      r = newr.
      newr = temp - quotient * newr.
    ENDWHILE.

    mmi = t.
  ENDMETHOD.
ENDCLASS.
