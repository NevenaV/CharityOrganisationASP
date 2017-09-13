using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.InterestingFactOperations
{
    public class InterestingFactOpDelete : InterestingFactOpBase
    {
        private int deleteId;

        public int DeleteId
        {
            get { return deleteId; }
            set { deleteId = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            entiteti.InterestingFactDelete(this.deleteId);
            return base.izvrsi(entiteti);
        }
    }
}