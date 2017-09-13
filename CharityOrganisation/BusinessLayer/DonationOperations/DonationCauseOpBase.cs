using CharityOrganisation.DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.DonationOperations
{
    public class DonationCauseDb : DonationDb
    {
        private string causeName;

        public string CauseName
        {
            get { return causeName; }
            set { causeName = value; }
        }
    }

    public abstract class DonationCauseOpBase : Operacija
    {
        private bool byAmount=false;

        public bool ByAmount
        {
            get { return byAmount; }
            set { byAmount = value; }
        }

        private bool byTime = false;

        public bool ByTime
        {
            get { return byTime; }
            set { byTime = value; }
        }

        public override OperacijaRezultat izvrsi(CharityOrganisationDatabaseEntities entiteti)
        {
            
            IEnumerable<DonationCauseDb> ieDonationCauses;

            if (byAmount)
            {
                ieDonationCauses = from donation in entiteti.Donations
                                   join cause in entiteti.CharitableCauses
                                   on donation.charitableCauseId equals cause.idCharitableCause
                                   orderby donation.amount descending
                                   select new DonationCauseDb
                                   {
                                       IdDonation = donation.idDonation,
                                       IdUser = donation.idUser,
                                       Amount = donation.amount,
                                       TimeDonated = donation.timeDonated,
                                       Cause = donation.charitableCauseId,
                                       FirstName = donation.firstName,
                                       LastName = donation.lastName,
                                       Anonymous = donation.anonymous,
                                       CauseName = cause.causeName
                                   };

            }
            else if (ByTime)
            {
                ieDonationCauses = from donation in entiteti.Donations
                                   join cause in entiteti.CharitableCauses
                                   on donation.charitableCauseId equals cause.idCharitableCause
                                   orderby donation.timeDonated descending
                                   select new DonationCauseDb
                                   {
                                       IdDonation = donation.idDonation,
                                       IdUser = donation.idUser,
                                       Amount = donation.amount,
                                       TimeDonated = donation.timeDonated,
                                       Cause = donation.charitableCauseId,
                                       FirstName = donation.firstName,
                                       LastName = donation.lastName,
                                       Anonymous = donation.anonymous,
                                       CauseName = cause.causeName
                                   };
            }
            else {
                ieDonationCauses = from donation in entiteti.Donations
                                   join cause in entiteti.CharitableCauses
                                   on donation.charitableCauseId equals cause.idCharitableCause
                                   select new DonationCauseDb
                                   {
                                       IdDonation = donation.idDonation,
                                       IdUser = donation.idUser,
                                       Amount = donation.amount,
                                       TimeDonated = donation.timeDonated,
                                       Cause = donation.charitableCauseId,
                                       FirstName = donation.firstName,
                                       LastName = donation.lastName,
                                       Anonymous = donation.anonymous,
                                       CreditCard = donation.creditCard,
                                       Csc = donation.csc,
                                       CauseName = cause.causeName
                                   };
            }


            DonationCauseDb[] niz = ieDonationCauses.ToArray();

            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        }
    }
}