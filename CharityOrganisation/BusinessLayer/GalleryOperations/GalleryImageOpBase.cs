using CharityOrganisation.DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.GalleryOperations
{
    public class GalleryImageDb : DbItem
    {
        private int idImage;

        public int IdImage
        {
            get { return idImage; }
            set { idImage = value; }
        }
        private string imageName;

        public string ImageName
        {
            get { return imageName; }
            set { imageName = value; }
        }
        private string path;

        public string Path
        {
            get { return path; }
            set { path = value; }
        }

        private string thumbPath;

        public string ThumbPath
        {
            get { return thumbPath; }
            set { thumbPath = value; }
        }
    }

    public abstract class GalleryImageOpBase : Operacija {
        public override OperacijaRezultat izvrsi(CharityOrganisationDatabaseEntities entiteti)
        {
            IEnumerable<GalleryImageDb> ieImages;

            ieImages = from image in entiteti.Galleries
                         select new GalleryImageDb
                         {
                             IdImage=image.idImage,
                             ImageName=image.imageName,
                             Path=image.path,
                             ThumbPath=image.thumbPath
                         };

            GalleryImageDb[] niz = ieImages.ToArray();

            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        }
    }
}