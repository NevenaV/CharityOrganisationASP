using CharityOrganisation.BusinessLayer;
using CharityOrganisation.BusinessLayer.CharitableCauseOperations;
using CharityOrganisation.BusinessLayer.DonationOperations;
using CharityOrganisation.BusinessLayer.GalleryOperations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CharityOrganisation
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idUser"] != null)
            {
                this.notLogged.Visible = false;
                this.donatedNotification.Visible = false;
                getSliderImages();
            }
            else {
                this.donateTable.Visible = false;
                this.donatedNotification.Visible = false;
                getSliderImages();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid){
                string firstName = TextBox1.Text;
                string lastName = TextBox2.Text;
                long creditCard = Convert.ToInt64(TextBox3.Text);
                int csc = Convert.ToInt32(TextBox4.Text);
                decimal amount = Convert.ToDecimal(TextBox5.Text);
                int cause = Convert.ToInt32(DropDownList2.SelectedItem.Value);
                DateTime time = DateTime.Now;

                DonationOpInsert op = new DonationOpInsert();
                op.InsDonation = new DonationDb();
                op.InsDonation.FirstName = firstName;
                op.InsDonation.LastName = lastName;
                op.InsDonation.CreditCard = creditCard;
                op.InsDonation.Csc = csc;
                op.InsDonation.Amount = amount;
                op.InsDonation.Cause = cause;
                op.InsDonation.TimeDonated = time;
                op.InsDonation.IdUser = Convert.ToInt32(Session["idUser"]);
                int anonymous;
                if (CheckBox1.Checked)
                {
                    anonymous = 1;
                }
                else {
                    anonymous = 0;
                }
                op.InsDonation.Anonymous = anonymous;


                OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);

                CharitableCauseOpAddFunds add = new CharitableCauseOpAddFunds();
                add.IdCause = cause;
                add.Funds = amount;

                OperacijaRezultat fundsUpdate = OperationManager.Singleton.izvrsiOperaciju(add);

                this.donateTable.Visible = false;
                this.donatedNotification.Visible = true;

            }
            else {
                return;
            }
        }

        public void getSliderImages() {
            this.sliderUl.InnerHtml = "";

            GalleryImageOpSelect op = new GalleryImageOpSelect();
            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);

            if ((rez == null) || (rez.Status == false))
            {
                return;
            }
            else {
                GalleryImageDb[] images = (GalleryImageDb[])rez.DbItems;

                foreach (GalleryImageDb image in images) {
                    this.sliderUl.InnerHtml += "<li><img src='"+image.Path+"' alt='"+image.ImageName+"'/></li>";
                }
            }
        }
    }
}