using CharityOrganisation.BusinessLayer;
using CharityOrganisation.BusinessLayer.EventOperations;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CharityOrganisation.Administrator
{
    public partial class AdmGalleryImages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idRole"] != null && (Convert.ToInt32(Session["idRole"]) == 1))
            {
            }
            else
            {
                Response.Redirect("../Home.aspx");
            }
        }

        protected void insLink_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) {

                FileUpload file = ((FileUpload)GridView1.FooterRow.FindControl("fileImg"));

                if (file.HasFile)
                {
                    string extension = System.IO.Path.GetExtension(file.FileName);
                    string uploadFolder = Server.MapPath("~/images/");

                    if (extension == ".jpg" || extension == ".png" || extension == ".gif" || extension == ".jpeg")
                    {
                        try
                        {
                            file.SaveAs(uploadFolder + file.FileName);
                            file.SaveAs(uploadFolder + "thumb_" + file.FileName);
                            string path = "/images/" + file.FileName;
                            string pathThumb = "/images/" + "thumb_" + file.FileName;
                            SqlDataSource1.InsertParameters["imageName"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("tbName")).Text;
                            SqlDataSource1.InsertParameters["path"].DefaultValue = path;
                            SqlDataSource1.InsertParameters["thumbPath"].DefaultValue = pathThumb;

                            SqlDataSource1.Insert();

                            int idUser = Convert.ToInt32(Session["idUser"]);
                            EventOpInsert op = new EventOpInsert();
                            op.InsEvent = new EventDb();
                            op.InsEvent.IdUser = idUser;
                            op.InsEvent.EventDescr = "User inserted a new Image!";
                            op.InsEvent.Time = DateTime.Now;

                            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);
                        }
                        catch (Exception ex)
                        {
                            this.ErrorsLabel.Text = ex.Message;
                        }
                    }
                    else
                    {
                        ((CustomValidator)GridView1.FooterRow.FindControl("CustomValidator1")).IsValid = false;
                        return;
                    }
                } 
            
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            FileUpload file = ((FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload1"));

                if (file.HasFile)
                {
                    string extension = System.IO.Path.GetExtension(file.FileName);
                    string uploadFolder = Server.MapPath("~/images/");

                    if (extension == ".jpg" || extension == ".png" || extension == ".gif" || extension == ".jpeg")
                    {
                        try
                        {
                            file.SaveAs(uploadFolder + file.FileName);
                            file.SaveAs(uploadFolder + "thumb_" + file.FileName);
                            string path = "/images/" + file.FileName;
                            string pathThumb = "/images/" + "thumb_" + file.FileName;
                            e.NewValues["path"] = path;
                            e.NewValues["thumbPath"] = pathThumb;

                            string oldImage = ((Label)GridView1.Rows[e.RowIndex].FindControl("LabelPath")).Text;
                            string oldImagePath = "~" + oldImage;

                            string oldThumbImage = ((Label)GridView1.Rows[e.RowIndex].FindControl("LabelThumbPath")).Text;
                            string oldThumbImagePath = "~" + oldThumbImage;

                            File.Delete(Server.MapPath(oldImagePath));
                            File.Delete(Server.MapPath(oldThumbImagePath));
                        }
                        catch (Exception ex)
                        {
                            this.ErrorsLabel.Text = ex.Message;
                        }

                    }
                    else
                    {
                        ((CustomValidator)GridView1.Rows[e.RowIndex].FindControl("CustomValidatorUpdate")).IsValid = false;
                        return;
                    }
                }
                else{
                    e.NewValues["path"] = ((Label)GridView1.Rows[e.RowIndex].FindControl("LabelPath")).Text;
                    e.NewValues["thumbPath"] = ((Label)GridView1.Rows[e.RowIndex].FindControl("LabelThumbPath")).Text;
                }

                int idUser = Convert.ToInt32(Session["idUser"]);

                Label idItemLabel = (Label)GridView1.Rows[e.RowIndex].FindControl("Label1");
                int idItem = Convert.ToInt32(idItemLabel.Text);
                EventOpInsert op = new EventOpInsert();
                op.InsEvent = new EventDb();
                op.InsEvent.IdUser = idUser;
                op.InsEvent.EventDescr = "User edited an Image with the id: " + idItem + "!";
                op.InsEvent.Time = DateTime.Now;

                OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string oldImage = ((Label)GridView1.Rows[e.RowIndex].FindControl("LabelPathItem")).Text;
            string oldImagePath = "~" + oldImage;

            string oldThumbImage = ((Label)GridView1.Rows[e.RowIndex].FindControl("LabelThumbPathItem")).Text;
            string oldThumbImagePath = "~" + oldThumbImage;

            File.Delete(Server.MapPath(oldImagePath));
            File.Delete(Server.MapPath(oldThumbImagePath));

            int idUser = Convert.ToInt32(Session["idUser"]);

            Label idItemLabel = (Label)GridView1.Rows[e.RowIndex].FindControl("Label1");
            int idItem = Convert.ToInt32(idItemLabel.Text);
            EventOpInsert op = new EventOpInsert();
            op.InsEvent = new EventDb();
            op.InsEvent.IdUser = idUser;
            op.InsEvent.EventDescr = "User deleted an Image with the id: " + idItem + "!";
            op.InsEvent.Time = DateTime.Now;

            OperacijaRezultat rez = OperationManager.Singleton.izvrsiOperaciju(op);
        }
    }
}