using CharityOrganisation.BusinessLayer;
using CharityOrganisation.BusinessLayer.PollOperations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CharityOrganisation
{
    public partial class Poll : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["pollVoted"] != null && Session["pollVoted"].Equals(true))
            {
                this.pollTable.Visible = false;
                this.pollErrors.InnerHtml = "Sorry, you have already voted.";
                this.pollErrors.Visible = true;
            }
            else {
                PollQuestionOpSelect questionOp = new PollQuestionOpSelect();
                questionOp.SelectActive = true;
                OperacijaRezultat questionRez = OperationManager.Singleton.izvrsiOperaciju(questionOp);

                if ((questionRez == null) || (!questionRez.Status))
                {
                    return;
                }
                else
                {
                    PollQuestionDb[] questions = (PollQuestionDb[])questionRez.DbItems;

                    if (questions.Length == 1)
                    {
                        int idQuestion = questions[0].IdPollQuestion;
                        Label1.Text = idQuestion.ToString();
                        string questionText = questions[0].Question;
                        Label2.Text = questionText;
                    }
                    else
                    {
                        Label1.Text = "0";
                        Label2.Text = "Error loading Questions and Answers. Please try again later.";
                    }
                }
            
            }

            
        }
    }
}