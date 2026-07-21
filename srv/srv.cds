using {datamodel} from '../db/datamodel';


service RAGS {

    @odata.draft.enabled
    entity EmployeeDetailsSet as projection on datamodel.EmployeeDetails;

    @odata.draft.enabled
    entity DepartmentSet      as projection on datamodel.Department;


    entity RegionSet          as projection on datamodel.Region;

    action   ActionEmpSet(EmpID: EmployeeDetailsSet:EmpID) returns EmployeeDetailsSet;
    function SumFunc(a: Int16, b: Int16)                   returns Int16;

    @odata.draft.enabled
    entity Status             as projection on datamodel.Status;

  

    entity FileDB as projection on datamodel.FilesDB;
       entity Attachments @(odata.draft.enabled: true) as
        projection on datamodel.Attachment {
            *
        }
        where
            DELETE = 'Y';

}
