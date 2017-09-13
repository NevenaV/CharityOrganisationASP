using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.PollOperations
{
    public class PollQuestionOpInsert : PollQuestionOpBase
    {
        private PollQuestionDb insQuestion;

        public PollQuestionDb InsQuestion
        {
            get { return insQuestion; }
            set { insQuestion = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            entiteti.PollQuestionInsert(insQuestion.Question,insQuestion.PollActive);
            return base.izvrsi(entiteti);
        }
    }
}