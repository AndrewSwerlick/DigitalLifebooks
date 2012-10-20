using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DigitalLifeBooks.Models;

namespace DigitalLifeBooks.Albums
{
    public partial class NewAlbum : BaseDLBPage
    {
        Child _child { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var childId = Request.QueryString["ChildId"];
            _child = LoadChild(long.Parse(childId));
        }

        public void On_Create_Clicked(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Title.Text))
                return;

            var album = new Album()
            {
                Title = Title.Text,
                Child = _child
            };

            DataContext.Albums.AddObject(album);
            DataContext.SaveChanges();
            Response.Redirect("Album.aspx?Id" + album.ID);
        }

        private Child LoadChild(long childId)
        {
            return new Child();
        }
    }
}