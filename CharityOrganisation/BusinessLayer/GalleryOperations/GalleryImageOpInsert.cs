using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.GalleryOperations
{
    public class GalleryImageOpInsert : GalleryImageOpBase
    {
        private GalleryImageDb insImage;

        public GalleryImageDb InsImage
        {
            get { return insImage; }
            set { insImage = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            entiteti.GalleryInsert(insImage.ImageName, insImage.Path, InsImage.ThumbPath);
            return base.izvrsi(entiteti);
        }
    }
}