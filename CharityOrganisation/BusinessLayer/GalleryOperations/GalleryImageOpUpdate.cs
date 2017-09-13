using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.GalleryOperations
{
    public class GalleryImageOpUpdate : GalleryImageOpBase
    {
        private GalleryImageDb updateImage;

        public GalleryImageDb UpdateImage
        {
            get { return updateImage; }
            set { updateImage = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            entiteti.GalleryUpdate(updateImage.IdImage,updateImage.ImageName,updateImage.Path,updateImage.ThumbPath);
            return base.izvrsi(entiteti);
        }
    }
}