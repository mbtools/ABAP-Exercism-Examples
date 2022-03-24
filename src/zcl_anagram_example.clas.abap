CLASS zcl_anagram_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS anagram
      IMPORTING
        !input        TYPE string
        !candidates   TYPE string_table
      RETURNING
        VALUE(result) TYPE string_table .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_anagram_example IMPLEMENTATION.


  METHOD ANAGRAM.
    DATA(test) = candidates[].
    DATA(inp) = input.
    DO strlen( inp ) TIMES.
      LOOP AT test ASSIGNING FIELD-SYMBOL(<test>).
        DATA(chr) = inp(1).
        REPLACE FIRST OCCURRENCE OF to_lower( chr ) IN <test> WITH ` `.
        IF sy-subrc <> 0.
          REPLACE FIRST OCCURRENCE OF to_upper( chr ) IN <test> WITH ` `.
          IF sy-subrc <> 0.
            <test> = '-'.
          ENDIF.
        ENDIF.
      ENDLOOP.
      SHIFT inp LEFT.
    ENDDO.
    LOOP AT test TRANSPORTING NO FIELDS WHERE table_line CO ` `.
      READ TABLE candidates ASSIGNING FIELD-SYMBOL(<cand>) INDEX sy-tabix.
      IF sy-subrc = 0 AND to_upper( <cand> ) <> to_upper( input ).
        APPEND <cand> TO result.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
