CLASS zcl_custom_signs_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    "! Build a sign that includes both of the parameters.
    METHODS build_sign IMPORTING occasion      TYPE string
                                 name          TYPE string
                       RETURNING VALUE(result) TYPE string.

    "! Build a birthday sign that conditionally formats the return string.
    METHODS build_birthday_sign IMPORTING age           TYPE i
                                RETURNING VALUE(result) TYPE string.

    "! Build a graduation sign that includes multiple lines
    METHODS graduation_for IMPORTING name          TYPE string
                                     year          TYPE i
                           RETURNING VALUE(result) TYPE string.

    "! Determine cost based on each character of sign parameter that builds
    "! the template string that includes the currency parameter.
    METHODS cost_of IMPORTING sign          TYPE string
                              currency      TYPE string
                    RETURNING VALUE(result) TYPE string.

ENDCLASS.



CLASS zcl_custom_signs_example IMPLEMENTATION.


  METHOD build_birthday_sign.
    result = |Happy Birthday! What a { COND #( WHEN age >= 50 THEN 'mature' ELSE 'young' ) } fellow you are.|.
  ENDMETHOD.


  METHOD build_sign.
    result = |Happy { occasion } { name }!|.
  ENDMETHOD.


  METHOD cost_of.
    DATA(price) = 20 + strlen( sign ) * 2.
    result = |Your sign costs { price DECIMALS = 2 } { currency }.|.
  ENDMETHOD.


  METHOD graduation_for.
    result = |Congratulations { name }!\nClass of { year }|.
  ENDMETHOD.
ENDCLASS.
