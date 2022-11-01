CLASS zcl_state_of_tic_tac_toe_examp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES:
      player_type TYPE c LENGTH 1 .
    TYPES:
    "! E.g., ( ( `XOO` ) ( ` X ` ) ( `  X` ) )
      board_type TYPE TABLE OF string INITIAL SIZE 3 .

    CONSTANTS:
      BEGIN OF player_enum,
        one TYPE player_type VALUE 'X',
        two TYPE player_type VALUE 'O',
      END OF player_enum .
    CONSTANTS:
      BEGIN OF state_enum,
        ongoing_game TYPE string VALUE `Ongoing game`,
        draw         TYPE string VALUE `Draw`,
        win          TYPE string VALUE `Win`,
      END OF state_enum .

    "! @parameter state | Possible values are enumerated in state_enum
    "! @raising cx_parameter_invalid | Board is invalid
    METHODS get_state
      IMPORTING
        !board       TYPE board_type
      RETURNING
        VALUE(state) TYPE string
      RAISING
        cx_parameter_invalid .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_state_of_tic_tac_toe_examp IMPLEMENTATION.


  METHOD get_state.
    DATA(b) = concat_lines_of( table = board ). " Board offsets: 012345678
    DATA(one) = count( val = b sub = player_enum-one ).
    DATA(two) = count( val = b sub = player_enum-two ).
    IF strlen( b ) <> 9 OR b NA `XO ` OR NOT one - two BETWEEN 0 AND 1. " Invalid boards
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
    DATA(w) = VALUE string_table( ( `012` ) ( `345` ) ( `678` ) ( `246` ) ( `036` ) ( `147` ) ( `258` ) ( `048` ) ). " Winning combinations
    state = state_enum-ongoing_game.
    DO lines( w ) TIMES.
      DATA(wi) = w[ sy-index ].
      DATA(x) = CONV i( wi+0(1) ).
      DATA(y) = CONV i( wi+1(1) ).
      DATA(z) = CONV i( wi+2(1) ).
      DO 2 TIMES.
        DATA(p) = COND #( WHEN sy-index = 1 THEN player_enum-one ELSE player_enum-two ).
        IF b+x(1) = p AND b+y(1) = p AND b+z(1) = p.
          IF state <> state_enum-ongoing_game AND state <> p. " Can't have two winners
            RAISE EXCEPTION TYPE cx_parameter_invalid.
          ENDIF.
          state = p.
        ENDIF.
      ENDDO.
    ENDDO.
    IF state = player_enum-one OR state = player_enum-two.
      state = state_enum-win.
    ELSEIF one + two = 9.
      state = state_enum-draw.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
