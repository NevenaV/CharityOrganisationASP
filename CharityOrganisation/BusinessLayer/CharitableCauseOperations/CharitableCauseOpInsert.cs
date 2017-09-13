using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.CharitableCauseOperations
{
    public class CharitableCauseOpInsert : CharitableCauseOpBase
    {
        private string insCauseName;

        public string InsCauseName
        {
            get { return insCauseName; }
            set { insCauseName = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            entiteti.CharitableCauseInsert(this.insCauseName);
            return base.izvrsi(entiteti);
        }
    }
}