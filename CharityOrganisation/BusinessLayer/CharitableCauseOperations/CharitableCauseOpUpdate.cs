using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.CharitableCauseOperations
{
    public class CharitableCauseOpUpdate : CharitableCauseOpBase
    {
        private string updateCauseName;

        public string UpdateCauseName
        {
            get { return updateCauseName; }
            set { updateCauseName = value; }
        }

        private int updateCauseId;

        public int UpdateCauseId
        {
            get { return updateCauseId; }
            set { updateCauseId = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            entiteti.CharitableCauseUpdate(this.updateCauseName,this.updateCauseId);
            return base.izvrsi(entiteti);
        }
    }

    public class CharitableCauseOpAddFunds : CharitableCauseOpBase {
        private decimal funds;

        public decimal Funds
        {
            get { return funds; }
            set { funds = value; }
        }

        private int idCause;

        public int IdCause
        {
            get { return idCause; }
            set { idCause = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            entiteti.CharitableCauseAddFunds(this.idCause,this.funds);
            return base.izvrsi(entiteti);
        }
    }
}