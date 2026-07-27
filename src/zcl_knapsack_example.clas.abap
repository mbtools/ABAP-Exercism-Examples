CLASS zcl_knapsack_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF item_type,
             weight TYPE i,
             value  TYPE i,
           END OF item_type.
    TYPES items_type TYPE TABLE OF item_type.

    METHODS get_max_possible_value
      IMPORTING weight_limit     TYPE i
                items            TYPE items_type
      RETURNING VALUE(max_value) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_knapsack_example IMPLEMENTATION.


  METHOD get_max_possible_value.
    DATA dp TYPE TABLE OF i.

    IF items IS INITIAL OR weight_limit <= 0.
      max_value = 0.
      RETURN.
    ENDIF.

    DO ( weight_limit + 1 ) TIMES.
      APPEND 0 TO dp.
    ENDDO.

    " Process each item and iterate backwards to avoid using same item twice
    LOOP AT items INTO DATA(item).
      DATA(w) = weight_limit.

      WHILE w >= item-weight.
        DATA(current) = dp[ w + 1 ].
        DATA(with_item) = dp[ w - item-weight + 1 ] + item-value.

        IF with_item > current.
          dp[ w + 1 ] = with_item.
        ENDIF.

        w = w - 1.
      ENDWHILE.
    ENDLOOP.

    max_value = dp[ weight_limit + 1 ].
  ENDMETHOD.
ENDCLASS.
