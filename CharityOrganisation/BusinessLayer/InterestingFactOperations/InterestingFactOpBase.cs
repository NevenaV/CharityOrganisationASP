using CharityOrganisation.DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.InterestingFactOperations
{
    public class InterestingFactDb : DbItem {
        private int idFact;

        public int IdFact
        {
            get { return idFact; }
            set { idFact = value; }
        }
        private string fact;

        public string Fact
        {
            get { return fact; }
            set { fact = value; }
        }
    }

    public abstract class InterestingFactOpBase : Operacija
    {
        public override OperacijaRezultat izvrsi(CharityOrganisationDatabaseEntities entiteti)
        {
            IEnumerable<InterestingFactDb> ieFacts;

            ieFacts = from fact in entiteti.InterestingFacts
                       select new InterestingFactDb
                       {
                           IdFact=fact.idFact,
                           Fact=fact.fact
                       };

            InterestingFactDb[] niz = ieFacts.ToArray();

            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        }
    }
}