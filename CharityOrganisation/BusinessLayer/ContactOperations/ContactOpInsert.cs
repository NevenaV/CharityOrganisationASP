using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.ContactOperations
{
    public class ContactOpInsert : ContactOpBase
    {
        private ContactDb insContact;

        public ContactDb InsContact
        {
            get { return insContact; }
            set { insContact = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            entiteti.ContactInsert(insContact.Name,insContact.Email,insContact.Message,insContact.TimeSent);
            return base.izvrsi(entiteti);
        }
    }
}