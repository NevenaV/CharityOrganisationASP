using CharityOrganisation.DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.EventOperations
{
    public class EventDb : DbItem {
        private int idEvent;

        public int IdEvent
        {
            get { return idEvent; }
            set { idEvent = value; }
        }
        private string eventDescr;

        public string EventDescr
        {
            get { return eventDescr; }
            set { eventDescr = value; }
        }
        private int idUser;

        public int IdUser
        {
            get { return idUser; }
            set { idUser = value; }
        }
        private DateTime time;

        public DateTime Time
        {
            get { return time; }
            set { time = value; }
        }
    }

    public class EventOpBase : Operacija {
        public override OperacijaRezultat izvrsi(CharityOrganisationDatabaseEntities entiteti)
        {
            IEnumerable<EventDb> ieEvents;

            ieEvents = from someEvent in entiteti.Events
                         select new EventDb
                         {
                             IdEvent = someEvent.idEvent,
                             EventDescr = someEvent.event1,
                             IdUser=someEvent.idUser,
                             Time=someEvent.eventTime
                         };

            EventDb[] niz = ieEvents.ToArray();

            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        }
    }
}