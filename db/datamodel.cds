using {
    cuid,
    managed
} from '@sap/cds/common';

aspect delete {
    DELETE : String enum {
        Yes = 'X';
        No = 'Y';
    } default 'X';
}


context datamodel {


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
    // Supplier: Composition of external.A_Supplier;
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

    entity Attachments {
        key ID        : UUID;
            fileName  : String(255);
            mimeType  : String(100);
            fileSize  : Integer;

            @Core.MediaType: mimeType
            content   : LargeBinary;
            createdAt : Timestamp;
    }

}