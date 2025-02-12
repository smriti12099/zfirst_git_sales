@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'inteface view for sem number'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zi_sem as select  from DDCDS_CUSTOMER_DOMAIN_VALUE_T(p_domain_name :'ZCIM_RAP_SEM_DE_5000')
{

   key domain_name,
  key value_position,
  @Semantics.language: true
  key language,
  value_low as value,
  @Semantics.text : true
  text as Description   
}
