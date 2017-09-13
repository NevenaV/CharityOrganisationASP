using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.DonationOperations
{
    public class DonationOpInsert : DonationOpBase
    {
        private DonationDb insDonation;

        public DonationDb InsDonation
        {
            get { return insDonation; }
            set { insDonation = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            entiteti.DonationInsert(insDonation.IdUser,insDonation.Amount,insDonation.TimeDonated,insDonation.Cause,insDonation.FirstName,insDonation.LastName,insDonation.Anonymous,insDonation.CreditCard,insDonation.Csc);
            return base.izvrsi(entiteti);
        }
    }
}