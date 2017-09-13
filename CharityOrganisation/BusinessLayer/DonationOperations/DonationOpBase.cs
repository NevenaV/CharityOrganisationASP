using CharityOrganisation.DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.DonationOperations
{
    public class DonationDb : DbItem {
        private int idDonation;

        public int IdDonation
        {
            get { return idDonation; }
            set { idDonation = value; }
        }
        private int idUser;

        public int IdUser
        {
            get { return idUser; }
            set { idUser = value; }
        }
        private decimal amount;

        public decimal Amount
        {
            get { return amount; }
            set { amount = value; }
        }
        private DateTime timeDonated;

        public DateTime TimeDonated
        {
            get { return timeDonated; }
            set { timeDonated = value; }
        }
        private int cause;

        public int Cause
        {
            get { return cause; }
            set { cause = value; }
        }
        private string firstName;

        public string FirstName
        {
            get { return firstName; }
            set { firstName = value; }
        }
        private string lastName;

        public string LastName
        {
            get { return lastName; }
            set { lastName = value; }
        }

        private int? anonymous;

        public int? Anonymous
        {
            get { return anonymous; }
            set { anonymous = value; }
        }

        private long? creditCard;

        public long? CreditCard
        {
            get { return creditCard; }
            set { creditCard = value; }
        }

        private int? csc;

        public int? Csc
        {
            get { return csc; }
            set { csc = value; }
        }

    }

    public abstract class DonationOpBase : Operacija
    {
        public override OperacijaRezultat izvrsi(CharityOrganisationDatabaseEntities entiteti)
        {
            IEnumerable<DonationDb> ieDonations;

            ieDonations = from donation in entiteti.Donations
                          select new DonationDb
                          {
                              IdDonation=donation.idDonation,
                              IdUser=donation.idUser,
                              Amount=donation.amount,
                              TimeDonated=donation.timeDonated,
                              Cause=donation.charitableCauseId,
                              FirstName=donation.firstName,
                              LastName=donation.lastName,
                              Anonymous=donation.anonymous,
                              CreditCard=donation.creditCard,
                              Csc=donation.csc
                          };

            DonationDb[] niz = ieDonations.ToArray();

            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        }
    }
}