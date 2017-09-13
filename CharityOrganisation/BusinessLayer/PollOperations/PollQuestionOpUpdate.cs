using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.PollOperations
{
    public class PollQuestionOpUpdate : PollQuestionOpBase
    {
        private PollQuestionDb updateQuestion;

        public PollQuestionDb UpdateQuestion
        {
            get { return updateQuestion; }
            set { updateQuestion = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            entiteti.PollQuestionUpdate(updateQuestion.IdPollQuestion,updateQuestion.Question,updateQuestion.PollActive);
            return base.izvrsi(entiteti);
        }
    }
}