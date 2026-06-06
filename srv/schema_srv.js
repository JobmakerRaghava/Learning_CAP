
const cds = require('@sap/cds');
// module.exports = cds.service.impl(async function () {
//     this.on('READ', 'EmployeeDetailsSet', async (req) => {
//         debugger;
//     });

//     this.on( 'SumFunc', async (request, next) => {
//         debugger;
//         let {a,b} =request.data;
//         return a+b;
//     });

// })

class Cap_service extends cds.ApplicationService {
    init() {
        this.on('SumFunc', async (request, next) => {
            debugger;
            let { a, b } = request.data;
            return a + b;
        });
        // this.on('CREATE', 'EmployeeDetailsSet',async  (req) => {
        //     debugger;
        //     var result = await cds.tx(req).run(SELECT.from('Cap_service.EmployeeDetailsSet').columns('max(EmpID) as count'));
        //     var count = result[0].count;
        //     req.data.EmpID = count + 1;
        //     // return req;
        // });
        //  this.after('CREATE', 'EmployeeDetailsSet', async req => {
        //     debugger;

        // });
        //  this.before('CREATE', 'EmployeeDetailsSet',  (req) => {
        //     debugger;

        // });
        this.after('READ', 'EmployeeDetailsSet', async (req) => {
            debugger;
        }
        );
        return super.init();
    }
}

module.exports = { Cap_service }