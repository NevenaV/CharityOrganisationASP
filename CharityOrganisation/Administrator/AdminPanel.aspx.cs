using CharityOrganisation.BusinessLayer;
using CharityOrganisation.BusinessLayer.MenuOperations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CharityOrganisation.Administrator
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idRole"] != null && (Convert.ToInt32(Session["idRole"]) == 1))
            {
            }
            else {
                Response.Redirect("../Home.aspx");
            }
        }

        
    }
}