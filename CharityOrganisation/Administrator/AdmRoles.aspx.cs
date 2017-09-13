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
    public partial class AdmRoles : System.Web.UI.Page
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

        protected void insLink_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                SqlDataSource1.InsertParameters["roleName"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("tbName")).Text;

                SqlDataSource1.Insert();

                int idUser = Convert.ToInt32(Session["idUser"]);
                EventOpInsert op = new EventOpInsert();
                op.InsEvent = new EventDb();
                op.InsEvent.IdUser = idUser;
                op.InsEvent.EventDescr = "User inserted a new Role!";
                op.InsEvent.Time = DateTime.Now;

                OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int idUser = Convert.ToInt32(Session["idUser"]);

            Label idItemLabel = (Label)GridView1.Rows[e.RowIndex].FindControl("Label1");
            int idItem = Convert.ToInt32(idItemLabel.Text);
            EventOpInsert op = new EventOpInsert();
            op.InsEvent = new EventDb();
            op.InsEvent.IdUser = idUser;
            op.InsEvent.EventDescr = "User edited a Role with the id: " + idItem + "!";
            op.InsEvent.Time = DateTime.Now;

            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int idUser = Convert.ToInt32(Session["idUser"]);

            Label idItemLabel = (Label)GridView1.Rows[e.RowIndex].FindControl("Label1");
            int idItem = Convert.ToInt32(idItemLabel.Text);
            EventOpInsert op = new EventOpInsert();
            op.InsEvent = new EventDb();
            op.InsEvent.IdUser = idUser;
            op.InsEvent.EventDescr = "User deleted a Role with the id: " + idItem + "!";
            op.InsEvent.Time = DateTime.Now;

            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);
        }
    }
}