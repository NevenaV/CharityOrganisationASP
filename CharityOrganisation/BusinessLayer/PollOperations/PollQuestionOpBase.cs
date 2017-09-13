using CharityOrganisation.DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.PollOperations
{
    public class PollQuestionDb : DbItem {
        private int idPollQuestion;

        public int IdPollQuestion
        {
            get { return idPollQuestion; }
            set { idPollQuestion = value; }
        }
        private string question;

        public string Question
        {
            get { return question; }
            set { question = value; }
        }
        private int pollActive;

        public int PollActive
        {
            get { return pollActive; }
            set { pollActive = value; }
        }
    }

    public abstract class PollQuestionOpBase : Operacija
    {
        private bool selectActive = false;

        public bool SelectActive
        {
            get { return selectActive; }
            set { selectActive = value; }
        }


        public override OperacijaRezultat izvrsi(CharityOrganisationDatabaseEntities entiteti)
        {
            IEnumerable<PollQuestionDb> iePollQuestions;

            if (this.selectActive)
            {
                iePollQuestions = from question in entiteti.PollQuestions
                                  where(question.pollActive==1)
                                  select new PollQuestionDb
                                  {
                                      IdPollQuestion = question.idPollQuestion,
                                      Question = question.pollQuestion1,
                                      PollActive = question.pollActive
                                  };
            }
            else {
                iePollQuestions = from question in entiteti.PollQuestions
                                  select new PollQuestionDb
                                  {
                                      IdPollQuestion = question.idPollQuestion,
                                      Question = question.pollQuestion1,
                                      PollActive = question.pollActive
                                  };
            }

            PollQuestionDb[] niz = iePollQuestions.ToArray();

            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        }
    }
}