CLASS lhc_Order DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE Order.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE Order.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE Order.

    METHODS read FOR READ
      IMPORTING keys FOR READ Order RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK Order.

    METHODS rba_Oitem FOR READ
      IMPORTING keys_rba FOR READ Order\_Oitem FULL result_requested RESULT result LINK association_links.

    METHODS cba_Oitem FOR MODIFY
      IMPORTING entities_cba FOR CREATE Order\_Oitem.

ENDCLASS.

CLASS lhc_Order IMPLEMENTATION.

  METHOD create.
  ENDMETHOD.

  METHOD update.
    DATA legacy_entity_in   TYPE zis_order.
    DATA legacy_entity_x  TYPE zsx_order_is . "refers to x structure (> BAPIs)
    DATA messages TYPE /dmo/t_message.

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<entity>).
      legacy_entity_in = CORRESPONDING #( <entity> MAPPING FROM ENTITY ).
      legacy_entity_x-order_id = <entity>-OrderID.
      legacy_entity_x = CORRESPONDING zsx_order_is( <entity> MAPPING FROM ENTITY ).


    ENDLOOP.

  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_Oitem.
  ENDMETHOD.

  METHOD cba_Oitem.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZI_ORDER_IS DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_ORDER_IS IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
