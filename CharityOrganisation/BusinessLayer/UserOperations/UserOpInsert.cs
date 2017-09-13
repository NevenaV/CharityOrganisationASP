using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.UserOperations
{
    public class UserOpInsert : UserOpBase
    {
        private UserDb insUser;

        public UserDb UnosUser
        {
            get { return insUser; }
            set { insUser = value; }
        }

        private bool newAdmin = false;

        public bool NewAdmin
        {
            get { return newAdmin; }
            set { newAdmin = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            if (newAdmin)
            {
                entiteti.UserInsert(this.insUser.Email, this.insUser.Password, 1);
            }
            else {
                entiteti.UserInsert(this.insUser.Email, this.insUser.Password, 2);
            }
           
            return base.izvrsi(entiteti);
        }
    }
}