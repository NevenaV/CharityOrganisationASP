using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.PollOperations
{
    public class PollAnswerOpDelete : PollAnswerOpBase
    {
        private int deleteId;

        public int DeleteId
        {
            get { return deleteId; }
            set { deleteId = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            entiteti.PollAnswerDelete(this.deleteId);
            return base.izvrsi(entiteti);
        }
    }
}