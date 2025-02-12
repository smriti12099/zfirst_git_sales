CLASS lhc_student DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

*    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
*      IMPORTING keys REQUEST requested_authorizations FOR student RESULT result.
       METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR student RESULT result.
    METHODS setadmitted FOR modify
      IMPORTING keys FOR ACTION student~setadmitted RESULT result.
    METHODS validateage FOR VALIDATE ON SAVE
      IMPORTING keys FOR student~validateage.
    METHODS updatecourseduration FOR DETERMINE ON save
      IMPORTING keys FOR student~updatecourseduration.
    METHODS statusupdate FOR MODIFY
      IMPORTING keys FOR ACTION student~statusupdate.








ENDCLASS.

CLASS lhc_student IMPLEMENTATION.

  METHOD get_instance_features.
  read ENTITIES OF zinterface_view in local mode entity student
  fields ( status ) with corresponding #( keys )
  result data(studentadmitted)
  failed failed.


  result =
  value #(
    for stud in studentadmitted
  let statusval = cond #( when stud-Status = abap_true
                            then if_abap_behv=>fc-o-disabled
                            else if_abap_behv=>fc-o-enabled )

                            in ( %tky = stud-%tky
                            %action-setAdmitted = statusval
                            )

  ).

  ENDMETHOD.

  METHOD SetAdmitted.
  modify entities of  zinterface_view in local mode
  entity Student
  update
   fields ( Status )
   with value #( for key in keys ( %tky = key-%tky Status = abap_true ) )
   failed failed
  REPORTED reported.
  read ENTITIES OF zinterface_view  in local mode
  entity  student
  all fields with CORRESPONDING #( keys )
  result data(studentdata).
   result = value #(  for studentrec in studentdata
   ( %tky =  studentrec-%tky %param = studentrec ) ).
  ENDMETHOD.

  METHOD validateAge.
  read ENTITIES OF zinterface_view  in local mode
  entity  student
   fields  ( Age ) with CORRESPONDING #( keys )
  result data(studentsAge).
  loop at studentsAge into data(studentAge).
  if studentAge-Age < 2.
  append value #( %tky = studentage-%tky  ) to failed-student.

  append value #( %tky = keys[ 1 ]-%tky
     %msg = new_message_with_text(
       Severity  = if_abap_behv_message=>severity-error
       text = 'Age cannot be less than 2'
     ) )

   to reported-student.
  endif.
   endloop.

  ENDMETHOD.

  METHOD updateCourseDuration.
  read ENTITIES OF zinterface_view  in local mode
  entity  student
   fields  (  Course ) with CORRESPONDING #( keys )
  result data(studentsCourse).
    loop at studentsCourse into data(studentCourse).
    if studentCourse-Course = 'Computers'.
    modify ENTITIES OF  zinterface_view  in LOCAL MODE ENTITY STUDENT
    UPDATE fields  (   courseduration ) with value #( ( %tky = studentcourse-%tky  courseduration = 5 ) ).
      endif.


  if studentCourse-Course = 'Electronics'.
    modify ENTITIES OF  zinterface_view  in LOCAL MODE ENTITY STUDENT
    UPDATE fields  (   courseduration ) with value #( ( %tky = studentcourse-%tky  courseduration = 3 ) ).
      endif.



  ENDLOOP.

ENDMETHOD.
 METHOD statusUpdate.


  read ENTITIES OF zinterface_view  in local mode
  entity  student
   all fields  with CORRESPONDING #( keys )
  result data(students_var) failed failed.
   sort students_var by status DESCENDING.



   loop at students_var ASSIGNING field-symbol(<lfs_students>).





   if <lfs_students>-Age < 25.
   append value #( %tky = <lfs_students>-%tky ) to failed-student.
   append value #( %tky = <lfs_students>-%tky
     %msg = new_message_with_text(
       Severity  = if_abap_behv_message=>severity-error
       text = 'Age cannot be less than 25'
     ) ) to reported-student.

   else.
   <lfs_students>-Status = abap_true.

 endif.

   ENDLOOP.


   if failed-student is INITIAL.
    sort students_var by status DESCENDING.
   modify ENTITIES OF zinterface_view in local mode
   entity student
   update FIELDS ( status ) with CORRESPONDING #( students_var ).
 endif.

ENDMETHOD.

ENDCLASS.
