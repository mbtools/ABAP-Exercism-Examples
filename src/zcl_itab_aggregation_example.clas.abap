CLASS zcl_itab_aggregation_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_numbers_type,
             group  TYPE group,
             number TYPE i,
           END OF initial_numbers_type,
           initial_numbers TYPE STANDARD TABLE OF initial_numbers_type WITH EMPTY KEY.

    TYPES: BEGIN OF aggregated_data_type,
             group   TYPE group,
             count   TYPE i,
             sum     TYPE i,
             min     TYPE i,
             max     TYPE i,
             average TYPE f,
           END OF aggregated_data_type,
           aggregated_data TYPE STANDARD TABLE OF aggregated_data_type WITH KEY group.

    METHODS perform_aggregation
      IMPORTING
        initial_numbers        TYPE initial_numbers
      RETURNING
        VALUE(aggregated_data) TYPE aggregated_data.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_itab_aggregation_example IMPLEMENTATION.


  METHOD perform_aggregation.
    LOOP AT initial_numbers ASSIGNING FIELD-SYMBOL(<i>).
      READ TABLE aggregated_data ASSIGNING FIELD-SYMBOL(<a>)
        WITH TABLE KEY group = <i>-group.
      IF sy-subrc = 0.
        <a>-count += 1.
        <a>-sum += <i>-number.
        <a>-min = nmin( val1 = <i>-number val2 = <a>-min ).
        <a>-max = nmax( val1 = <i>-number val2 = <a>-max ).
        <a>-average = ( <a>-average * ( <a>-count - 1 ) + <i>-number ) / <a>-count.
      ELSE.
        APPEND INITIAL LINE TO aggregated_data ASSIGNING <a>.
        <a>-group = <i>-group.
        <a>-count = 1.
        <a>-sum = <i>-number.
        <a>-min = <i>-number.
        <a>-max = <i>-number.
        <a>-average = <i>-number.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
