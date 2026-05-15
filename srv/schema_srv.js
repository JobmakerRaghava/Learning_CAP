// module.export = (srv) => {
//     srv.on('READ', 'EmployeeDetailsSet', request => {
//         debugger;
//     })
// }
const cds = require('@sap/cds');
module.exports = cds.service.impl(async function () {
    // this.on('READ', 'EmployeeDetailsSet', async (request, next) => {
    //     debugger;
    // });

    this.on( 'SumFunc', async (request, next) => {
        debugger;
        let {a,b} =request.data;
        return a+b;
    });
})