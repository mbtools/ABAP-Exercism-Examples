CLASS zcl_hamming_example DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS hamming_distance
      IMPORTING
        !first_strand  TYPE string
        !second_strand TYPE string
      RETURNING
        VALUE(result)  TYPE i
      RAISING
        cx_parameter_invalid.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_hamming_example IMPLEMENTATION.


  METHOD hamming_distance.
    DATA i TYPE i.

    IF strlen( first_strand ) <> strlen( second_strand ).
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    i = 0.
    DO strlen( first_strand ) TIMES.
      IF substring( val = first_strand
                    off = i
                    len = 1 ) <> substring( val = second_strand
                                            off = i
                                            len = 1 ).
        result = result + 1.
      ENDIF.
      i = i + 1.
    ENDDO.
  ENDMETHOD.
ENDCLASS.
