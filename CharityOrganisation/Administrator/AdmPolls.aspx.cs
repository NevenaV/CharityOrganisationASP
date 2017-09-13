using CharityOrganisation.BusinessLayer;
using CharityOrganisation.BusinessLayer.EventOperations;
using CharityOrganisation.BusinessLayer.PollOperations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CharityOrganisation.Administrator
{
    public partial class AdmPolls : System.Web.UI.Page
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

        protected void insLink_Click(object sender, EventArgs e) {
            if (Page.IsValid)
            {
                int active = Convert.ToInt32(((DropDownList)GridView1.FooterRow.FindControl("insPollActive")).SelectedValue);

                if(active==1){
                    PollSetAllInactive op1 = new PollSetAllInactive();
                    OperacijaRezultat rez1 = OperationManager.Singleton.izvrsiOperaciju(op1);
                }


                SqlDataSource1.InsertParameters["pollQuestion"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("tbInsertQuestion")).Text;
                SqlDataSource1.InsertParameters["pollActive"].DefaultValue = ((DropDownList)GridView1.FooterRow.FindControl("insPollActive")).SelectedValue;

                SqlDataSource1.Insert();

                int idUser = Convert.ToInt32(Session["idUser"]);
                EventOpInsert op = new EventOpInsert();
                op.InsEvent = new EventDb();
                op.InsEvent.IdUser = idUser;
                op.InsEvent.EventDescr = "User inserted a new Poll!";
                op.InsEvent.Time = DateTime.Now;

                OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int active = Convert.ToInt32(((DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownList1")).SelectedValue);

            if (active == 1)
            {
                PollSetAllInactive op1 = new PollSetAllInactive();
                OperacijaRezultat rez1 = OperationManager.Singleton.izvrsiOperaciju(op1);
            }

            int idUser = Convert.ToInt32(Session["idUser"]);

            Label idItemLabel = (Label)GridView1.Rows[e.RowIndex].FindControl("Label1");
            int idItem = Convert.ToInt32(idItemLabel.Text);
            EventOpInsert op = new EventOpInsert();
            op.InsEvent = new EventDb();
            op.InsEvent.IdUser = idUser;
            op.InsEvent.EventDescr = "User edited a Poll with the id: " + idItem + "!";
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
            op.InsEvent.EventDescr = "User deleted a Poll with the id: " + idItem + " and all its answers!";
            op.InsEvent.Time = DateTime.Now;

            PollAnswerDeleteRelated del = new PollAnswerDeleteRelated();
            del.IdQuestionDel = idItem;
            OperacijaRezultat delrez = OperationManager.Singleton.izvrsiOperaciju(del);

            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);
        }



        protected void insLink2_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SqlDataSource2.InsertParameters["pollAnswer"].DefaultValue = ((TextBox)GridView2.FooterRow.FindControl("tbAnswer")).Text;
                SqlDataSource2.InsertParameters["answerScore"].DefaultValue = ((TextBox)GridView2.FooterRow.FindControl("tbScore")).Text;
                SqlDataSource2.InsertParameters["idPollQuestion"].DefaultValue = ((DropDownList)GridView2.FooterRow.FindControl("insPollId")).SelectedValue;

                SqlDataSource2.Insert();

                int idUser = Convert.ToInt32(Session["idUser"]);
                EventOpInsert op = new EventOpInsert();
                op.InsEvent = new EventDb();
                op.InsEvent.IdUser = idUser;
                op.InsEvent.EventDescr = "User inserted a new Answer!";
                op.InsEvent.Time = DateTime.Now;

                OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);
            }
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int idUser = Convert.ToInt32(Session["idUser"]);

            Label idItemLabel = (Label)GridView2.Rows[e.RowIndex].FindControl("Label1");
            int idItem = Convert.ToInt32(idItemLabel.Text);
            EventOpInsert op = new EventOpInsert();
            op.InsEvent = new EventDb();
            op.InsEvent.IdUser = idUser;
            op.InsEvent.EventDescr = "User edited an Answer with the id: " + idItem + "!";
            op.InsEvent.Time = DateTime.Now;

            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);
        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int idUser = Convert.ToInt32(Session["idUser"]);

            Label idItemLabel = (Label)GridView2.Rows[e.RowIndex].FindControl("Label1");
            int idItem = Convert.ToInt32(idItemLabel.Text);
            EventOpInsert op = new EventOpInsert();
            op.InsEvent = new EventDb();
            op.InsEvent.IdUser = idUser;
            op.InsEvent.EventDescr = "User deleted an Answer with the id: " + idItem + "!";
            op.InsEvent.Time = DateTime.Now;

            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);
        }
    }

}