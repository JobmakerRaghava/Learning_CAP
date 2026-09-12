const cds = require('@sap/cds');
const SapCfMailer = require("sap-cf-mailer").default;
class RAGS extends cds.ApplicationService {
    async init() {
        const { Attachments } = this.entities;
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


        this.on('uploadFile', async (req) => {
            debugger;
            const {
                fileName,
                mimeType,
                fileSize,
                content
            } = req.data;

            const result = await INSERT.into(Attachments).entries({
                ID: cds.utils.uuid(),
                fileName,
                mimeType,
                fileSize,
                content: Buffer.from(content, 'base64'),
                createdAt: new Date()
            });

            return result;
        });

        this.on('sendMail', async () => {

            try {

                // const transporter = new SapCfMailer("GmailSMTP"); // Match your destination
                 const transporter = await cds.connect.to('GmailSMTP');

                const result = await transporter.sendMail({

                    to: "raghavakolanu123@gmail.com", 

                    // cc: "", //cc list separated by comma

                    subject: "Test Mail from BTP System",

                    html: "Hello from CAP!",

                    attachments: []

                });

                return `Email sent successfully`;

            } catch (error) {

                console.error('Error sending email:', error);

                return `Error sending email: ${error.message}`;

            }

        });
        return super.init();
    }
}
// class ExternalServices extends cds.ApplicationService {
//     async init() {
//         const services = await cds.connect.to('API_BUSINESS_PARTNER');
//         this.on('READ', 'BusinessPartnerSet', async (req) => {
//             debugger;
//             return services.run(req.query);
//         });
//         return super.init();
//     }
// }
module.exports = { RAGS };