using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.InterestingFactOperations
{
    public class InterestingFactsOpUpdate : InterestingFactOpBase
    {
        private InterestingFactDb updateFact;

        public InterestingFactDb UpdateFact
        {
            get { return updateFact; }
            set { updateFact = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            entiteti.InterestingFactUpdate(updateFact.IdFact,updateFact.Fact);
            return base.izvrsi(entiteti);
        }
    }
}