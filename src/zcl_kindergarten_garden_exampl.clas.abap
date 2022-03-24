CLASS zcl_kindergarten_garden_exampl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS plants
      IMPORTING
        !diagram       TYPE string
        !student       TYPE string
      RETURNING
        VALUE(results) TYPE string_table .
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA students TYPE string_table.

ENDCLASS.



CLASS zcl_kindergarten_garden_exampl IMPLEMENTATION.


  METHOD plants.
    DATA(pos) = find( val = sy-abcde sub = student(1) ) * 2.
    SPLIT diagram AT '\n' INTO TABLE DATA(rows).
    LOOP AT rows ASSIGNING FIELD-SYMBOL(<row>).
      DO 2 TIMES.
        DATA(plant) = substring( val = <row> off = pos + sy-index - 1 len = 1 ).
        CASE plant.
          WHEN 'V'.
            APPEND 'violets' TO results.
          WHEN 'R'.
            APPEND 'radishes' TO results.
          WHEN 'G'.
            APPEND 'grass' TO results.
          WHEN 'C'.
            APPEND 'clover' TO results.
        ENDCASE.
      ENDDO.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
