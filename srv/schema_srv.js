
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
        // this.on('READ', 'EmployeeDetailsSet',  (req) => {
        //     debugger;
        // });
        return super.init();
    }
}

module.exports = { Cap_service }