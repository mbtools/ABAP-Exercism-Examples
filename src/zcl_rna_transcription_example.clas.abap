CLASS zcl_rna_transcription_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS transcribe
      IMPORTING
        !strand       TYPE string
      RETURNING
        VALUE(result) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rna_transcription_example IMPLEMENTATION.


  METHOD transcribe.
    result = strand.
    TRANSLATE result USING 'GCCGTAAU'.
  ENDMETHOD.
ENDCLASS.
