CLASS lhc_Oitem DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE Oitem.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE Oitem.

    METHODS read FOR READ
      IMPORTING keys FOR READ Oitem RESULT result.

    METHODS rba_Order FOR READ
      IMPORTING keys_rba FOR READ Oitem\_Order FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_Oitem IMPLEMENTATION.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Order.
  ENDMETHOD.

ENDCLASS.
