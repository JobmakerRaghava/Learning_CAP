namespace poc.db;

using {poc.aspects.delete as delete} from './CustomAspects';
using { API_BUSINESS_PARTNER as external } from '../srv/external/API_BUSINESS_PARTNER';


using {
    cuid,
    managed
} from '@sap/cds/common';


// context schema
// {
entity EmployeeDetails : cuid, managed, delete {
    EmpID     : Integer;
    FirstName : String(50);
    LastName  : String(50);
    Age       : Integer;
    Position  : String(50);
    Email     : String(50);
    to_dep    : Association to many Department
                    on to_dep.to_emp = $self;
    to_region : Composition of many Region
                    on to_region.to_emp = $self;
    status    : String(10)
    @title: '{i18n>status}';
    Supplier: Composition of external.A_Supplier;
}

entity Department : cuid, managed, delete {
    to_emp     : Association to one EmployeeDetails;
    Department : String(100);
}

entity Region : cuid, managed, delete {
    to_emp : Association to one EmployeeDetails;
    Region : String(100);
}

entity Status : cuid {
    statuscode : String(2);
    statusdes  : String(50);
    status     : String(10);
}

// }
