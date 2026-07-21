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
@title           : 'Stream Type'
@Core.IsMediaType: true
@Core.Computed   : true
type MediaType : String;

@title         : 'Stream Content'
@Core.MediaType: 'application/octet-stream'
type Stream    : LargeBinary;


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

  
    entity FilesDB : cuid, managed, delete {

        fileName    : String;
        fileType    : String;
        fileContent : LargeBinary;

    };
     entity Attachment : cuid,managed, delete {
       

            @Core.MediaType                  : file_type
            // @Core.AcceptableMediaTypes       : [
            //   'image/jpg',
            //   'image/jpeg',
            //   'image/png'
            // ]
            @Core.ContentDisposition.Filename: file_name
            @title                           : 'Attachment'
            file      : Stream;
            file_name : String(120) @changelog;

            @title                           : 'Attachment Type'
            file_type : MediaType; // string

            @readonly
            @title                           : 'Uploaded by'
            @cds.on.insert                   : $user
            uploaded_by : String(120);

            @readonly
            @title                           : 'Uploaded on'
            @cds.on.insert                   : $now
            uploaded_on : DateTime;

            @title                           : 'Note'
            note      : String(120);


    }
}
