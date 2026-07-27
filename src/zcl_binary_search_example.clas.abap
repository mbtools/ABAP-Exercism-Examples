CLASS zcl_binary_search_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    METHODS binary_search
      IMPORTING
        val           TYPE i
        table         TYPE integertab
      RETURNING
        VALUE(result) TYPE i
      RAISING
        cx_sy_itab_line_not_found.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_binary_search_example IMPLEMENTATION.


  METHOD binary_search.
    " Not a binary search... just plain ABAP :-)
    DATA(tab) = table.
    SORT tab.
    READ TABLE tab TRANSPORTING NO FIELDS WITH KEY table_line = val.
    IF sy-subrc = 0.
      result = sy-tabix.
    ELSE.
      RAISE EXCEPTION TYPE cx_sy_itab_line_not_found.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
