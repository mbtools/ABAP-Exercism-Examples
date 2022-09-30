CLASS zcl_secret_handshake_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS get_commands
      IMPORTING
        !code           TYPE i
      RETURNING
        VALUE(commands) TYPE string_table .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_secret_handshake_example IMPLEMENTATION.


  METHOD get_commands.
    DATA(x) = CONV xstring( code ).
    DATA(c) = VALUE string_table( ( `wink` ) ( `double blink` ) ( `close your eyes` ) ( `jump` ) ).
    DO 4 TIMES.
      CHECK x O CONV xstring( 2 ** ( sy-index - 1 ) ).
      IF x Z CONV xstring( 16 ).
        INSERT c[ sy-index ] INTO TABLE commands.
      ELSE.
        INSERT c[ sy-index ] INTO commands INDEX 1.
      ENDIF.
    ENDDO.
  ENDMETHOD.
ENDCLASS.
