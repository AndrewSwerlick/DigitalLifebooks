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

            var album = LoadAlbum(albumId);
            AlbumRender.Album = album;
            AlbumRender.DataBind();
        }

        private Album LoadAlbum(string albumId)
        {
            var album = new Album();
            album.Assets.Add(new Asset()
            {
                ID = new Guid("c41afbc8-1ac2-4127-b7bc-a042e53a2576"),
                Type = "Image"
            });

            return album;
        }
    }
}