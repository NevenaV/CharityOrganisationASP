using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.PollOperations
{
    public class PollQuestionOpDelete : PollQuestionOpBase
    {
        private int idDelete;

        public int IdDelete
        {
            get { return idDelete; }
            set { idDelete = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            entiteti.PollQuestionDelete(this.idDelete);
            return base.izvrsi(entiteti);
        }
    }
}