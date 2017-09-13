using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.PollOperations
{
    public class PollAnswerOpInsert : PollAnswerOpBase
    {
        private PollAnswerDb insAnswer;

        public PollAnswerDb InsAnswer
        {
            get { return insAnswer; }
            set { insAnswer = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            entiteti.PollAnswerInsert(InsAnswer.Answer,insAnswer.IdQuestion);
            return base.izvrsi(entiteti);
        }
    }
}