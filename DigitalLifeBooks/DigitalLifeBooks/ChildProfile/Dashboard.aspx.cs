using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DigitalLifeBooks.Models;
using DigitalLifeBooks.UserControls;

namespace DigitalLifeBooks.ChildProfile
{
    public partial class Dashboard : BaseDLBPage
    {
        public Child Child { get; set; }

        public Album ImportantDocuments { get; set; }

        public string ProfilePicLink { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var childId = Request.QueryString["ChildId"];
            Child = LoadChild(childId);
            
            ImportantDocuments = Child.Albums.SingleOrDefault(a => a.IsImportanDocumentsAlbum);
            ProfilePicLink = Child.ProfilePickLink;            

            if (ImportantDocuments != null)
                ImportantDocumentsRender.Album = ImportantDocuments;

            Albums.DataSource = Child.Albums.Where(a => !a.IsImportanDocumentsAlbum);
            DataBind();
        }

        public void On_AlbumRender_Created(object sender, RepeaterItemEventArgs e)
        {
            var albumRender = (AlbumRender)e.Item.FindControl("AlbumRender");
            albumRender.Album = e.Item.DataItem as Album;
        }

        private Child LoadChild(string childId)
        {
            var id = long.Parse(childId);
            return DataContext.Children.Single(c => c.Id == id);
        }       
    }
}