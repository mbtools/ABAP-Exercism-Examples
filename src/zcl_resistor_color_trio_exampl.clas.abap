CLASS zcl_resistor_color_trio_exampl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS label
      IMPORTING
        colors        TYPE string_table
      RETURNING
        VALUE(result) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_resistor_color_trio_exampl IMPLEMENTATION.


  METHOD label.
    DATA(bands) = VALUE string_table( ( `black` ) ( `brown` ) ( `red` ) ( `orange` ) ( `yellow` ) ( `green` ) ( `blue` ) ( `violet` ) ( `grey` ) ( `white` ) ).
    DATA(val) = 10 * ( line_index( bands[ table_line = colors[ 1 ] ] ) - 1 ) + line_index( bands[ table_line = colors[ 2 ] ] ) - 1.
    result = |{ val * ( 10 ** ( line_index( bands[ table_line = colors[ 3 ] ] ) - 1 ) ) } ohms|.
    result = replace( val = result sub = `000000000 ` with = ` giga` ).
    result = replace( val = result sub = `000000 ` with = ` mega` ).
    result = replace( val = result sub = `000 ` with = ` kilo` ).
  ENDMETHOD.
ENDCLASS.
