using CharityOrganisation.BusinessLayer;
using CharityOrganisation.BusinessLayer.GalleryOperations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CharityOrganisation
{
    public partial class Gallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            GalleryImageOpSelect selectOp = new GalleryImageOpSelect();
            OperacijaRezultat rezSelect = OperationManager.Singleton.izvrsiOperaciju(selectOp);

            if ((rezSelect == null) || (!rezSelect.Status))
            {
                return;
            }
            else {
                GalleryImageDb[] images = (GalleryImageDb[])rezSelect.DbItems;

                foreach (GalleryImageDb image in images) {
                    this.galleryHolder.InnerHtml += "<a href='"+image.Path+"' data-lightbox='gallery' data-title='"+image.ImageName+"'><img src='"+image.ThumbPath+"' alt='"+image.ImageName+"'/></a>";
                }
            }
        }
    }
}