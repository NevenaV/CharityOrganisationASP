using CharityOrganisation.BusinessLayer;
using CharityOrganisation.BusinessLayer.DonationOperations;
using CharityOrganisation.BusinessLayer.PollOperations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace CharityOrganisation
{
    /// <summary>
    /// Summary description for WebServiceAjax
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebServiceAjax : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod(EnableSession = true)]
        public void pollVote(int idAnswer) {
            Session["pollVoted"] = true;

            PollAnswerOpUpvote opUpdate = new PollAnswerOpUpvote();
            opUpdate.Upvote = true;
            opUpdate.AnswerId = idAnswer;
            OperacijaRezultat updateRez = OperationManager.Singleton.izvrsiOperaciju(opUpdate);

            if ((updateRez == null) || (!updateRez.Status))
            {
                //greska
            }
            else {
                PollAnswerOpSelect opSelect = new PollAnswerOpSelect();
                opSelect.OnlyActive = true;
                OperacijaRezultat selectRez = OperationManager.Singleton.izvrsiOperaciju(opSelect);

                if ((selectRez == null) || (!selectRez.Status))
                {
                    //greska
                }
                else {
                    string dataPrint = "";
                    PollAnswerDb[] answers = (PollAnswerDb[])selectRez.DbItems;
                    for (int i = 0; i < answers.Length; i++)
                    {
                        dataPrint += "<tr><td>" + answers[i].Answer + ": " + answers[i].Score + " vote(s)</td></tr>";
                    }
                    var jsonObj = new JavaScriptSerializer().Serialize(dataPrint);
                    this.Context.Response.ContentType = "application/json; charset=utf-8";
                    this.Context.Response.Write(jsonObj);
                }
            }
        }

        [WebMethod]
        public void donationsFilter(string valFilter)
        {
            string strDataReturn = "";

            int filter = Convert.ToInt32(valFilter);

            DonationCauseOpSelect op = new DonationCauseOpSelect();

            if (filter == 1) {
                op.ByAmount = true;
            }
            else if (filter == 2) {
                op.ByTime = true;
            }

            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);

            if ((rez == null) || (!rez.Status))
            {
                return;
            }
            else {
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
                        strDataReturn += "<div class='div-90 margin-auto text-center bottom-border'><b>Anonymous</b><br />For: '" + data[i].CauseName + "'<br />Amount: $" + data[i].Amount.ToString() + "<br />Date: " + donated + "</div>";
                    }
                    else
                    {
                        strDataReturn += "<div class='div-90 margin-auto text-center bottom-border'><b>" + data[i].FirstName + " " + data[i].LastName + "</b><br />For: '" + data[i].CauseName + "'<br />Amount: $" + data[i].Amount + "<br />Date: " + donated + "</div>";
                    }
                }
            }

            var jsonObj = new JavaScriptSerializer().Serialize(strDataReturn);
            this.Context.Response.ContentType = "application/json; charset=utf-8";
            this.Context.Response.Write(jsonObj);
        }
    }
}
