CLASS zcl_protein_translation_exampl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS proteins
      IMPORTING
        strand        TYPE string
      RETURNING
        VALUE(result) TYPE string_table
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_protein_translation_exampl IMPLEMENTATION.


  METHOD proteins.
    DATA(offset) = 0.
    DO strlen( strand ) DIV 3 TIMES.
      CASE strand+offset(3).
        WHEN 'AUG'.
          INSERT `Methionine` INTO TABLE result.
        WHEN 'UUU' OR 'UUC'.
          INSERT `Phenylalanine` INTO TABLE result.
        WHEN 'UUA' OR 'UUG'.
          INSERT `Leucine` INTO TABLE result.
        WHEN 'UCU' OR 'UCC' OR 'UCA' OR 'UCG'.
          INSERT `Serine` INTO TABLE result.
        WHEN 'UAU' OR 'UAC'.
          INSERT `Tyrosine` INTO TABLE result.
        WHEN 'UGU' OR 'UGC'.
          INSERT `Cysteine` INTO TABLE result.
        WHEN 'UGG'.
          INSERT `Tryptophan` INTO TABLE result.
        WHEN 'UAA' OR 'UAG' OR 'UGA'.
          EXIT.
        WHEN OTHERS.
          RAISE EXCEPTION TYPE cx_parameter_invalid.
      ENDCASE.
      offset = offset + 3.
      IF strlen( strand+offset(*) ) BETWEEN 1 AND 2.
        RAISE EXCEPTION TYPE cx_parameter_invalid.
      ENDIF.
    ENDDO.
  ENDMETHOD.
ENDCLASS.
