CLASS zcl_space_age_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      age_in_years TYPE p LENGTH 3 DECIMALS 2.

    METHODS age
      IMPORTING
        !planet       TYPE string
        !seconds      TYPE i
      RETURNING
        VALUE(result) TYPE age_in_years
      RAISING
        cx_parameter_invalid.

  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS earth_year_seconds TYPE f VALUE '31557600'.
ENDCLASS.



CLASS zcl_space_age_example IMPLEMENTATION.


  METHOD age.
    CASE planet.
      WHEN 'Earth'.
        result = seconds / earth_year_seconds / '1.0'.
      WHEN 'Mercury'.
        result = seconds / earth_year_seconds / '0.2408467'.
      WHEN 'Venus'.
        result = seconds / earth_year_seconds / '0.61519726'.
      WHEN 'Mars'.
        result = seconds / earth_year_seconds / '1.8808158'.
      WHEN 'Jupiter'.
        result = seconds / earth_year_seconds / '11.862615'.
      WHEN 'Saturn'.
        result = seconds / earth_year_seconds / '29.447498'.
      WHEN 'Uranus'.
        result = seconds / earth_year_seconds / '84.016846'.
      WHEN 'Neptune'.
        result = seconds / earth_year_seconds / '164.79132'.
      WHEN OTHERS.
        RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDCASE.
  ENDMETHOD.
ENDCLASS.
