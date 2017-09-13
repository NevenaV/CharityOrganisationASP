using CharityOrganisation.BusinessLayer;
using CharityOrganisation.BusinessLayer.EventOperations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CharityOrganisation.Administrator
{
    public partial class AdmCharitableCause : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idRole"] != null && (Convert.ToInt32(Session["idRole"]) == 1))
            {
            }
            else
            {
                Response.Redirect("../Home.aspx");
            }
        }

        protected void lbInsert_Click(object sender, EventArgs e) {
            if (Page.IsValid) {
                SqlDataSource1.InsertParameters["causeName"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("tbInsertName")).Text;
                SqlDataSource1.InsertParameters["totalFundsDonated"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("tbInsertTotalFunds")).Text;

                SqlDataSource1.Insert();

                int idUser = Convert.ToInt32(Session["idUser"]);
                EventOpInsert op = new EventOpInsert();
                op.InsEvent = new EventDb();
                op.InsEvent.IdUser = idUser;
                op.InsEvent.EventDescr = "User inserted a new Charitable Cause!";
                op.InsEvent.Time = DateTime.Now;

                OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);
            }
            
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int idUser = Convert.ToInt32(Session["idUser"]);

            Label idCauseLabel = (Label)GridView1.Rows[e.RowIndex].FindControl("Label1");
            int causeId = Convert.ToInt32(idCauseLabel.Text);
            EventOpInsert op = new EventOpInsert();
            op.InsEvent = new EventDb();
            op.InsEvent.IdUser = idUser;
            op.InsEvent.EventDescr = "User deleted a Charitable Cause with the id: " + causeId + "!";
            op.InsEvent.Time = DateTime.Now;

            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int idUser = Convert.ToInt32(Session["idUser"]);

            Label idCauseLabel = (Label)GridView1.Rows[e.RowIndex].FindControl("Label1");
            int causeId = Convert.ToInt32(idCauseLabel.Text);
            EventOpInsert op = new EventOpInsert();
            op.InsEvent = new EventDb();
            op.InsEvent.IdUser = idUser;
            op.InsEvent.EventDescr = "User edited a Charitable Cause with the id: " + causeId + "!";
            op.InsEvent.Time = DateTime.Now;

            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);
        }

        

    }
}