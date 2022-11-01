CLASS zcl_etl_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES:
      BEGIN OF ty_legacy_data,
        number TYPE i,
        string TYPE string,
      END OF ty_legacy_data .
    TYPES:
      BEGIN OF ty_new_data,
        letter TYPE c LENGTH 1,
        number TYPE i,
      END OF ty_new_data .
    TYPES:
      tty_legacy_data TYPE SORTED TABLE OF ty_legacy_data WITH UNIQUE KEY number .
    TYPES:
      tty_new_data    TYPE SORTED TABLE OF ty_new_data WITH UNIQUE KEY letter .

    METHODS transform
      IMPORTING
        !legacy_data    TYPE tty_legacy_data
      RETURNING
        VALUE(new_data) TYPE tty_new_data .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_etl_example IMPLEMENTATION.


  METHOD transform.
    LOOP AT legacy_data ASSIGNING FIELD-SYMBOL(<data>).
      SPLIT to_lower( <data>-string ) AT ',' INTO TABLE DATA(letters).
      LOOP AT letters ASSIGNING FIELD-SYMBOL(<letter>).
        DATA(n) = VALUE ty_new_data( letter = <letter> number = <data>-number ).
        INSERT n INTO TABLE new_data.
      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
