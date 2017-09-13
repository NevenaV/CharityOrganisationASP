using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.InterestingFactOperations
{
    public class InterestingFactOpInsert : InterestingFactOpBase
    {
        private InterestingFactDb insFact;

        public InterestingFactDb InsFact
        {
            get { return insFact; }
            set { insFact = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            entiteti.InterestingFactInsert(insFact.Fact);
            return base.izvrsi(entiteti);
        }
    }
}