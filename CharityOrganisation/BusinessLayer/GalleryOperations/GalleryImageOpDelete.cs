using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.GalleryOperations
{
    public class GalleryImageOpDelete : GalleryImageOpBase
    {
        private int idDelete;

        public int IdDelete
        {
            get { return idDelete; }
            set { idDelete = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            entiteti.GalleryDelete(this.idDelete);
            return base.izvrsi(entiteti);
        }
    }
}