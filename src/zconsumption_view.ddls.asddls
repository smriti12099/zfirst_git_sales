@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CONSUMPTION VIEW'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define  root view entity ZCONSUMPTION_VIEW as projection on
zinterface_view as student
{
 @EndUserText.label :'Student ID'
 key Id,
  @EndUserText.label :'First Name'
  Firstname,
  @EndUserText.label :'Last Name'
  Lastname,
  @EndUserText.label :'Age'
   Age,
    
  @EndUserText.label :'Course'
   Course,
  
    
     
   @EndUserText.label :'Course Duration'
  Courseduration ,
  
   @EndUserText.label :'Status'
  Status ,
  
   @EndUserText.label :'Gender'
  Gender ,
  
  Genderdesc,
   @EndUserText.label :'DOB'
  Dob ,
  
 
  
  
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_CALCULATE'
  @EndUserText.label :'total pay'
  virtual BonusAmount : abap.int4
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
