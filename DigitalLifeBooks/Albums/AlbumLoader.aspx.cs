using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DigitalLifeBooks.Models;

namespace DigitalLifeBooks.Albums
{
    public partial class AlbumLoader : BaseDLBPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var albumId = Request.QueryString["AlbumId"];
            if (albumId == null)
                return;

            var album = LoadAlbum(long.Parse(albumId));
            AlbumRender.Album = album;
            AlbumRender.DataBind();
        }

        private Album LoadAlbum(long albumId)
        {
            return DataContext.Albums.Single(a => a.ID == albumId);
        }
    }
}