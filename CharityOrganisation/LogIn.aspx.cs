using CharityOrganisation.BusinessLayer;
using CharityOrganisation.BusinessLayer.UserOperations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CharityOrganisation
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idUser"] != null) {
                Response.Redirect("Home.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string email = TextBox1.Text;
                string password = TextBox2.Text;

                UserOpSelect op = new UserOpSelect();
                op.GivenEmailPass = true;
                op.KriterijumUser = new UserDb();
                op.KriterijumUser.Email = email;
                op.KriterijumUser.Password = password;
                OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);

                if ((rez == null) || (!rez.Status))
                {
                    this.unknownUser.InnerHtml = "Given email - password combination was not found in our database.";
                    return;
                }
                else
                {
                    UserDb[] users = (UserDb[])rez.DbItems;

                    if (users.Length > 0)
                    {
                        Session["email"] = users[0].Email;
                        Session["idUser"] = users[0].IdUser;
                        Session["idRole"] = users[0].IdRole;

                        if (Convert.ToInt32(Session["idRole"]) == 1)
                        {
                            Response.Redirect("/Administrator/AdminPanel.aspx");
                        }
                        else {
                            Response.Redirect("Home.aspx");
                        }
                        
                    }
                    else
                    {
                        this.unknownUser.InnerHtml = "Given email - password combination was not found in our database.";
                    }


                }
            }
            else {
                return;
            }
            
        }
    }
}