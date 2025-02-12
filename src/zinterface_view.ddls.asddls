@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'INTERFACE VIEW for student'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}


define root view entity zinterface_view as select from zrap_table
composition[0..*] of ZI_ACADEAMIC_RESULT_5000 as _academicres
composition[0..*] of znew_data_view as _new

association to zview_male_female as _gender on $projection.Gender = _gender.Value


 

{
    
    key id as Id,
     firstname  as Firstname,
     lastname as Lastname,
     age as Age,
     course as Course,
     courseduration as Courseduration,
     status as Status,
     gender as Gender,
     dob as Dob,
    _new,
     _gender,
     _gender.Description as Genderdesc,
     _academicres 
     
   }

   
