CLASS zcl_acronym_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS parse
      IMPORTING
        !phrase        TYPE string
      RETURNING
        VALUE(acronym) TYPE string .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_acronym_example IMPLEMENTATION.


  METHOD parse.
    DATA(text) = to_upper( phrase ).
    TRANSLATE text USING '- _ '.
    SPLIT condense( text ) AT ' ' INTO TABLE DATA(words).
    LOOP AT words ASSIGNING FIELD-SYMBOL(<word>).
      acronym &&= <word>(1).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
