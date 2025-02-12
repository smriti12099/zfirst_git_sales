@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'INTERFACE VIEW FOR ACADMIC RESULT'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_ACADEAMIC_RESULT_5000 as select from ztabular_format
association to parent zinterface_view as _student on $projection.Id = _student.Id
association to zi_course as _Course on $projection.Course = _Course.Value
association to zi_sem as _semester on $projection.Semester = _semester.value
association to  ZISEM_RESULT as _semres on $projection.Semresult = _semres.value


{
   key id as Id,
   key course as Course,
   key semester as Semester,
   _Course.Description as course_desc,
   _semester.Description as semester_desc,
   
   semresult as Semresult ,
   _semres.Description as semres_desc,
   _student
}
