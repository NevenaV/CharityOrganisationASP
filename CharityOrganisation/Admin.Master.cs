using CharityOrganisation.BusinessLayer;
using CharityOrganisation.BusinessLayer.MenuOperations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CharityOrganisation
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getMenu();
        }

        public void getMenu()
        {
            this.navMenu.InnerHtml = "";

            MenuOpSelect op = new MenuOpSelect();
            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);

            if ((rez == null) || (!rez.Status))
            {
                return;
            }
            else
            {
                MenuDb[] linkovi = (MenuDb[])rez.DbItems;

                foreach (MenuDb link in linkovi)
                {
                    if (link.Title == "Log In")
                    {
                        if (Session["idUser"] == null)
                        {
                            this.navMenu.InnerHtml += "<li><a href='../" + link.Link + "'>" + link.Title + "</a></li>";
                        }
                    }
                    else if (link.Title == "Log Out")
                    {
                        if (Session["idUser"] != null)
                        {
                            this.navMenu.InnerHtml += "<li><a href='../" + link.Link + "'>" + link.Title + "</a></li>";
                        }
                    }
                    else if (link.Title == "Register")
                    {
                        if (Session["idUser"] == null)
                        {
                            this.navMenu.InnerHtml += "<li><a href='../" + link.Link + "'>" + link.Title + "</a></li>";
                        }
                    }
                    else if (link.Title == "Admin Panel")
                    {
                        if (Session["idRole"] != null && (Convert.ToInt32(Session["idRole"]) == 1))
                        {
                            this.navMenu.InnerHtml += "<li><a href='" + link.Link + "'>" + link.Title + "</a></li>";
                        }
                    }
                    else
                    {
                        this.navMenu.InnerHtml += "<li><a href='../" + link.Link + "'>" + link.Title + "</a></li>";
                    }
                }
            }
        }
    }
}