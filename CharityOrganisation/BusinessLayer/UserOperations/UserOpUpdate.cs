using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.UserOperations
{
    public class UserOpUpdate : UserOpBase
    {
        private UserDb updateUser;

        public UserDb UpdateUser
        {
            get { return updateUser; }
            set { updateUser = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            entiteti.UserUpdate(updateUser.IdUser,updateUser.Email,updateUser.Password,updateUser.IdRole);
            return base.izvrsi(entiteti);
        }
    }
}