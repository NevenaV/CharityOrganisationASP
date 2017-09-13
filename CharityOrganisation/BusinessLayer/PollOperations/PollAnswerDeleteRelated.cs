using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.PollOperations
{
    public class PollAnswerDeleteRelated : PollAnswerOpBase
    {
        private int idQuestionDel;

        public int IdQuestionDel
        {
            get { return idQuestionDel; }
            set { idQuestionDel = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            entiteti.PollDeleteAllRelatedAnswers(this.idQuestionDel);
            return base.izvrsi(entiteti);
        }
    }
}