
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
    async init() {
        const services = await cds.connect.to('API_BUSINESS_PARTNER');
        this.on('SumFunc', async (request, next) => {
            debugger;
            let { a, b } = request.data;
            return a + b;
        });
        // this.on('CREATE', 'EmployeeDetailsSet', async (req) => {
            // debugger;
            // var result = await cds.tx(req).run(SELECT.from('Cap_service.EmployeeDetailsSet').columns('max(EmpID) as count'));
            // var count = result[0].count;
            // req.data.EmpID = count + 1;
            // console.log(req.data);
            // return req;
            // const tx = cds.transaction(req);

            // const result = await cds.tx(req).run(
            //     SELECT.one.from(req.target)
            //         .columns('max(EmpID) as maxId')
            // );

            // req.data.EmpID = (result.maxId || 0) + 1;
        // });
        //  this.after('CREATE', 'EmployeeDetailsSet', async req => {
        //     debugger;

        // });
         this.before('CREATE', 'EmployeeDetailsSet', async (req) => {
            debugger;
            const result = await cds.tx(req).run(
                SELECT.one.from(req.target)
                    .columns('max(EmpID) as maxId')
            );

            req.data.EmpID = (result.maxId || 0) + 1;

        });
      
        
        
        return super.init();
    }
}

module.exports = { Cap_service }