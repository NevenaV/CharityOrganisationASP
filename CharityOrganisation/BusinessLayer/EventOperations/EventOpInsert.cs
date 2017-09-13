using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.EventOperations
{
    public class EventOpInsert : EventOpBase
    {
        private EventDb insEvent;

        public EventDb InsEvent
        {
            get { return insEvent; }
            set { insEvent = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            entiteti.EventInsert(insEvent.EventDescr, insEvent.IdUser, insEvent.Time);
            return base.izvrsi(entiteti);
        }
    }
}