using { Cap_service } from '../srv/schema_srv';


annotate Cap_service.EmployeeDetailsSet with
@(UI: {
    LineItem          : [
        {
            $Type: 'UI.DataField',
            Value: EmpID,
            Label: 'Employee ID',
            

        },
        {
            $Type: 'UI.DataField',
            Value: FirstName,
            Label: 'First Name',

        },
        {
            $Type: 'UI.DataField',
            Value: LastName,
            Label: 'Last Name',

        },
        {
            $Type: 'UI.DataField',
            Value: Position,


        },
        {
            $Type: 'UI.DataField',
            Value: status,

        },
        {
            $Type: 'UI.DataField',
            Value: Email,

        },
        {
            $Type: 'UI.DataField',
            Value: ID,
            @UI.Hidden,
        },
    ],
    FieldGroup #Create: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: EmpID,
                Label: 'Employee ID',
            },
            {
                $Type: 'UI.DataField',
                Value: FirstName,
                Label: 'First Name'
            },
            {
                $Type: 'UI.DataField',
                Value: LastName,
                Label: 'Last Name'
            },
            {
                $Type: 'UI.DataField',
                Value: Position,
                Label: 'Position'
            },
            {
                $Type: 'UI.DataField',
                Value: Age,
                Label: 'Age'
            },
            {
                $Type: 'UI.DataField',
                Value: Email,
                Label: 'Email'
            },
            {
                $Type: 'UI.DataField',
                Value: status,
                Label: 'Status'
                
            },

        ],
    
    },
    FieldGroup  #fgRegion: {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type: 'UI.DataField',
                Value: to_region.Region,
                Label: 'Region',
            },
           

        ],
    },
    Facets            : [
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#Create',
            Label : 'Info',
            ID    : 'InfoID',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: 'to_dep/@UI.LineItem',
            Label : 'Department Info',
            ID    : 'DepID'

        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: 'to_region/@UI.LineItem',
            Label : 'Region Info',
            ID    : 'RegionID'
        }

    ],
    
});
annotate Cap_service.EmployeeDetailsSet {
    status @Common.ValueList : {
        $Type :'Common.ValueListType',
        CollectionPath: 'Status',
        Parameters: [{
            $Type : 'Common.ValueListParameterInOut',
            LocalDataProperty : status,
            ValueListProperty : 'statuscode',
        },
        {
            $Type : 'Common.ValueListParameterDisplayOnly',
            ValueListProperty : 'statusdes',
        },
        {
            $Type : 'Common.ValueListParameterDisplayOnly',
            ValueListProperty : 'statuscode',
        },
        

        ]
        
    }
} ;





annotate Cap_service.DepartmentSet with @UI: {LineItem: [{
    $Type: 'UI.DataField',
    Value: Department,
    Label: 'Department'
}, ], };

annotate Cap_service.RegionSet with @UI : { LineItem : [
    {
        $Type: 'UI.DataField',
        Value: Region,
        Label: 'Region'
    },
], };


annotate Cap_service.Status with @UI: {
    LineItem: [
        {
            $Type: 'UI.DataField',
            Value: ID,
            @UI.Hidden,
        },
        {
            $Type: 'UI.DataField',
            Value: status,
        },
        {
            $Type: 'UI.DataField',
            Value: statusdes,
        },
        {
            $Type: 'UI.DataField',
            Value: statuscode,
        },
    ],
    FieldGroup #create : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type: 'UI.DataField',
                Value: ID,
                
            },
            {
                $Type: 'UI.DataField',
                Value: status,
                Label: 'Status',
            },
            {
                $Type: 'UI.DataField',
                Value: statusdes,
                Label: 'Status Description',
            },
            {
                $Type: 'UI.DataField',
                Value: statuscode,
                Label: 'Status Code',
            },
        ],
        
    },
    Facets  : [
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#create',
            ID : 'StatusIDd',
            Label : 'Status Info',
        },
    ],

};
