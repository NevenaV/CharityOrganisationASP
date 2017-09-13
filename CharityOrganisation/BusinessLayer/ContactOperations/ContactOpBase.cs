using CharityOrganisation.DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.ContactOperations
{
    public class ContactDb : DbItem
    {
        private int idContact;

        public int IdContact
        {
            get { return idContact; }
            set { idContact = value; }
        }
        private string name, email, message;

        public string Message
        {
            get { return message; }
            set { message = value; }
        }

        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        private DateTime timeSent;

        public DateTime TimeSent
        {
            get { return timeSent; }
            set { timeSent = value; }
        }
    }

    public abstract class ContactOpBase : Operacija
    {
        public override OperacijaRezultat izvrsi(CharityOrganisationDatabaseEntities entiteti)
        {
            IEnumerable<ContactDb> ieContacts;

            ieContacts = from contact in entiteti.Contacts
                          select new ContactDb
                          {
                              IdContact=contact.idContact,
                              Name=contact.name,
                              Email=contact.email,
                              Message=contact.message,
                              TimeSent=contact.timeSent
                          };

            ContactDb[] niz = ieContacts.ToArray();

            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        }
    }
}