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
    public partial class Register : System.Web.UI.Page
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

                UserOpInsert op = new UserOpInsert();
                op.UnosUser = new UserDb();
                op.UnosUser.Email = email;
                op.UnosUser.Password = password;
                OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);

                if ((rez == null) || (!rez.Status))
                {
                    return;
                }
                else
                {
                    UserOpSelect op2 = new UserOpSelect();
                    op2.GivenEmailPass = true;
                    op2.KriterijumUser = new UserDb();
                    op2.KriterijumUser.Email = email;
                    op2.KriterijumUser.Password = password;
                    OperacijaRezultat rez2 = OperationManager.Singleton.izvrsiOperaciju(op2);

                    if ((rez2 == null) || (!rez2.Status))
                    {
                        return;
                    }
                    else
                    {
                        UserDb[] users = (UserDb[])rez2.DbItems;

                        if (users.Length == 1)
                        {
                            Session["email"] = users[0].Email;
                            Session["idUser"] = users[0].IdUser;
                            Session["idRole"] = users[0].IdRole;
                            Response.Redirect("Home.aspx");
                        }
                        else {
                            return;
                        }
                    }
                }
            }
            else
            {
                return;
            }
            
        }
    }
}