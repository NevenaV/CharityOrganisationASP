using CharityOrganisation.BusinessLayer;
using CharityOrganisation.BusinessLayer.DonationOperations;
using CharityOrganisation.BusinessLayer.MenuOperations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CharityOrganisation
{
    public partial class Template : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            showTopDonations();
            getMenu();
        }

        public void showTopDonations() {

            this.topDonations.InnerHtml = "";

            DonationCauseOpSelect op = new DonationCauseOpSelect();
            op.ByAmount = true;
            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);

            if ((rez == null) || (!rez.Status))
            {
                return;
            }
            else
            {
                DonationCauseDb[] data = (DonationCauseDb[])rez.DbItems;
                int countDonations = data.Length;
                int n;
                if (countDonations >= 5)
                {
                    n = 4;
                }
                else
                {
                    n = countDonations - 1;
                }
                for (int i = 0; i <= n; i++)
                {
                    DateTime donatedDT = data[i].TimeDonated;
                    string donated = donatedDT.ToString("dd/MM/yyyy H:mm:ss");
                    if (data[i].Anonymous == 1)
                    {
                        this.topDonations.InnerHtml += "<div class='div-90 margin-auto text-center bottom-border'><b>Anonymous</b><br />For: '" + data[i].CauseName + "'<br />Amount: $" + data[i].Amount.ToString() + "<br />Date: " + donated + "</div>";
                    }
                    else
                    {
                        this.topDonations.InnerHtml += "<div class='div-90 margin-auto text-center bottom-border'><b>" + data[i].FirstName + " " + data[i].LastName + "</b><br />For: '" + data[i].CauseName + "'<br />Amount: $" + data[i].Amount + "<br />Date: " + donated + "</div>";
                    }
                }
            }
        }


        public void getMenu() {
            this.navMenu.InnerHtml = "";

            MenuOpSelect op = new MenuOpSelect();
            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);

            if ((rez == null) || (!rez.Status))
            {
                return;
            }
            else {
                MenuDb[] linkovi = (MenuDb[])rez.DbItems;

                foreach (MenuDb link in linkovi) {
                    if (link.Title=="Log In") {
                        if (Session["idUser"] == null)
                        {
                            this.navMenu.InnerHtml += "<li><a href='" + link.Link + "'>" + link.Title + "</a></li>";
                        }
                    }
                    else if(link.Title=="Log Out"){
                        if (Session["idUser"] != null)
                        {
                            this.navMenu.InnerHtml += "<li><a href='" + link.Link + "'>" + link.Title + "</a></li>";
                        }
                    }
                    else if (link.Title == "Register")
                    {
                        if (Session["idUser"] == null)
                        {
                            this.navMenu.InnerHtml += "<li><a href='" + link.Link + "'>" + link.Title + "</a></li>";
                        }
                    }
                    else if (link.Title == "Admin Panel")
                    {
                        if (Session["idRole"] != null && (Convert.ToInt32(Session["idRole"]) == 1))
                        {
                            this.navMenu.InnerHtml += "<li><a href='/Administrator/" + link.Link + "'>" + link.Title + "</a></li>";
                        }
                    }
                    else {
                        this.navMenu.InnerHtml += "<li><a href='" + link.Link + "'>" + link.Title + "</a></li>";
                    }
                }
            }
        }
    }
}