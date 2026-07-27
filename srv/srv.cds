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

    entity Attachments        as projection on datamodel.Attachments;

    action   uploadFile(fileName: String,
                        mimeType: String,
                        fileSize: Integer,
                        content: LargeString);


}
