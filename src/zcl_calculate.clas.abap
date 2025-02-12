CLASS zcl_calculate DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  interfaces IF_SADL_EXIT_CALC_ELEMENT_READ.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CALCULATE IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.
  DATA : IT_PRF TYPE STANDARD TABLE OF ZCONSUMPTION_VIEW WITH DEFAULT KEY.
        IT_PRF = CORRESPONDING #( it_original_data ).


        LOOP AT  IT_PRF ASSIGNING FIELD-SYMBOL(<LS_PRF>).
            if ( <LS_PRF>-Firstname EQ 'smriti' ).
           <LS_PRF>-BonusAmount =  <LS_PRF>-Age + 2.

        else.
         <LS_PRF>-BonusAmount = <LS_PRF>-Age + 5 .
         ENDIF.
        ENDLOOP.


        ct_calculated_data = CORRESPONDING #( IT_PRF ).



  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.

  ENDMETHOD.
ENDCLASS.
