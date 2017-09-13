using CharityOrganisation.DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.UserOperations
{
    public class UserDb : DbItem {
        private int idUser;

        public int IdUser
        {
            get { return idUser; }
            set { idUser = value; }
        }
        private string email;

        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        private string password;

        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        private int idRole;

        public int IdRole
        {
            get { return idRole; }
            set { idRole = value; }
        }

    }

    public abstract class UserOpBase : Operacija {
        private bool givenEmailPass = false;

        public bool GivenEmailPass
        {
            get { return givenEmailPass; }
            set { givenEmailPass = value; }
        }

        private UserDb kriterijumUser;

        public UserDb KriterijumUser
        {
            get { return kriterijumUser; }
            set { kriterijumUser = value; }
        }

        public override OperacijaRezultat izvrsi(CharityOrganisationDatabaseEntities entiteti)
        {
            IEnumerable<UserDb> ieUsers;

            if (this.givenEmailPass)
            {
                ieUsers = from user in entiteti.Users
                          where((user.email==kriterijumUser.Email)&& (user.password==kriterijumUser.Password))
                          select new UserDb
                          {
                              IdUser = user.idUser,
                              Email = user.email,
                              Password = user.password,
                              IdRole = user.idRole
                          };
            }
            else {
                ieUsers = from user in entiteti.Users
                          select new UserDb
                          {
                              IdUser = user.idUser,
                              Email = user.email,
                              Password = user.password,
                              IdRole = user.idRole
                          };
            }

            UserDb[] niz = ieUsers.ToArray();

            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        }
    }
}