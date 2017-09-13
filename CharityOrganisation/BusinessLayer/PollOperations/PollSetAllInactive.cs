using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.PollOperations
{
    public class PollSetAllInactive : PollQuestionOpBase
    {
        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            entiteti.PollSetAllInactive();
            return base.izvrsi(entiteti);
        }
    }
}