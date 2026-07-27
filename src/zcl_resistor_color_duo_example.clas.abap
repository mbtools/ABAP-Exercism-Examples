CLASS zcl_resistor_color_duo_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS value
      IMPORTING
        colors        TYPE string_table
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_resistor_color_duo_example IMPLEMENTATION.


  METHOD value.
    DATA(bands) = VALUE string_table( ( `black` ) ( `brown` ) ( `red` ) ( `orange` ) ( `yellow` ) ( `green` ) ( `blue` ) ( `violet` ) ( `grey` ) ( `white` ) ).
    result = 10 * ( line_index( bands[ table_line = colors[ 1 ] ] ) - 1 ) + line_index( bands[ table_line = colors[ 2 ] ] ) - 1.
  ENDMETHOD.
ENDCLASS.
