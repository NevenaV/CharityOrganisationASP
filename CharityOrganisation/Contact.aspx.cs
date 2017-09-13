using CharityOrganisation.BusinessLayer;
using CharityOrganisation.BusinessLayer.ContactOperations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CharityOrganisation
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string name = TextBox1.Text;
                string email = TextBox2.Text;
                string message = TextBox3.Text;
                DateTime time = DateTime.Now;

                ContactOpInsert op = new ContactOpInsert();
                op.InsContact = new ContactDb();
                op.InsContact.Name = name;
                op.InsContact.Email = email;
                op.InsContact.Message = message;
                op.InsContact.TimeSent = time;

                OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);

                if ((rez != null) && (rez.Status))
                {
                    this.contactSuccess.InnerHtml = "You have successfully sent a message to our team. Thank you!";
                }
            }
            else
            {
                return;
            }
        }
    }
}