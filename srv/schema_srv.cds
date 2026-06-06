using {poc.db as schema} from '../db/schema';
using {API_BUSINESS_PARTNER as external} from './external/API_BUSINESS_PARTNER';


service Cap_service {
    @odata.draft.enabled
    entity EmployeeDetailsSet as projection on schema.EmployeeDetails;

    @odata.draft.enabled
    entity DepartmentSet      as projection on schema.Department;


    entity RegionSet          as projection on schema.Region;

    action   ActionEmpSet(EmpID: EmployeeDetailsSet:EmpID) returns EmployeeDetailsSet;
    function SumFunc(a: Int16, b: Int16)                   returns Int16;

    @odata.draft.enabled
    entity Status             as projection on schema.Status;
    
}
service ExternalService {
    // @cds.autoexpose
    entity BusinessPartner as projection on external.A_BusinessPartner;


}
