using CharityOrganisation.DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.CharitableCauseOperations
{
    public class CharitableCauseDb : DbItem {
        private int idCharitableCause;

        public int IdCharitableCause
        {
            get { return idCharitableCause; }
            set { idCharitableCause = value; }
        }
        private string causeName;

        public string CauseName
        {
            get { return causeName; }
            set { causeName = value; }
        }
        private decimal? totalFundsDonated;

        public decimal? TotalFundsDonated
        {
            get { return totalFundsDonated; }
            set { totalFundsDonated = value; }
        }

        public override string ToString()
        {
            return this.CauseName;
        }
        
    }

    public abstract class CharitableCauseOpBase : Operacija {
        public override OperacijaRezultat izvrsi(CharityOrganisationDatabaseEntities entiteti)
        {
            IEnumerable<CharitableCauseDb> ieCauses;
            ieCauses = from cause in entiteti.CharitableCauses
                       select new CharitableCauseDb
                       {
                           IdCharitableCause=cause.idCharitableCause,
                           CauseName=cause.causeName,
                           TotalFundsDonated=cause.totalFundsDonated,
                       };

            CharitableCauseDb[] niz = ieCauses.ToArray();

            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        }
    }
}