using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DigitalLifeBooks.Models;

namespace DigitalLifeBooks.Albums
{
    public partial class NewOrEditAlbum : BaseDLBPage
    {
        Child _child { get; set; }
        Album _album { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var childId = Request.QueryString["ChildId"];
            var albumId = Request.QueryString["AlbumId"];
            if (!string.IsNullOrEmpty(albumId))
                _album = LoadAlbum(long.Parse(albumId));

            if (_album != null)
                Create.Text = "Save";

            if (_album != null && !IsPostBack)
            {
                AlbumTitle.Text = _album.Title;
                AlbumDescription.Text = _album.Description;
            }
            _child = LoadChild(long.Parse(childId));
        }

        public void On_Create_Clicked(object sender, EventArgs e)
        {
            var albumId = Request.QueryString["AlbumId"];

            if (string.IsNullOrEmpty(AlbumTitle.Text))
                return;

            var album = EditOrCreateAlbum(long.Parse(albumId));
            DataContext.SaveChanges();

            Response.Redirect("Album.aspx?Id" + album.ID);
        }

        private Album LoadAlbum(long id)
        {
            return DataContext.Albums.SingleOrDefault(a => a.ID == id);
        }
        private Album EditOrCreateAlbum(long id)
        {
            var album = LoadAlbum(id);

            if (album == null)
            {
                album = new Album()
                {                   
                    Child = _child
                };
                DataContext.Albums.AddObject(album);
            }

             album.Title = AlbumTitle.Text;
             album.Description = AlbumDescription.Text;
             return album;
        }

        private Child LoadChild(long childId)
        {
            return new Child();
        }
    }
}