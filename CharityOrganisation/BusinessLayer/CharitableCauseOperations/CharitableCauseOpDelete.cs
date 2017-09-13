using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.CharitableCauseOperations
{
    public class CharitableCauseOpDelete : CharitableCauseOpBase
    {
        private int idDelete;

        public int IdDelete
        {
            get { return idDelete; }
            set { idDelete = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            entiteti.CharitableCauseDelete(this.idDelete);
            return base.izvrsi(entiteti);
        }
    }
}