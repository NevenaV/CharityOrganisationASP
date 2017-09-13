using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.ContactOperations
{
    public class ContactOpDelete : ContactOpBase
    {
        private int deleteId;

        public int DeleteId
        {
            get { return deleteId; }
            set { deleteId = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            entiteti.ContactDelete(this.deleteId);
            return base.izvrsi(entiteti);
        }
    }
}