using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DigitalLifeBooks.Models;

namespace DigitalLifeBooks.Albums
{
    public partial class AlbumViewer : System.Web.UI.Page
    {
        string _albumId { get; set; }
        Album _album { get; set; }
        Child _child { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            _albumId = Request.QueryString["AlbumId"];
            if (string.IsNullOrWhiteSpace(_albumId)) return;

            _album = LoadAlbum(_albumId);
            if (_album == null) return;

            _child = _album.Child;

            AlbumName.Text = _album.Title;
            ChildName.Text = NameOf(_child);
        }

        private string NameOf(Child child)
        {
            return String.Format("{0} {1}", child.FirstName, child.LastName);
        }

        private Album LoadAlbum(string albumID)
        {
            return null;
        }
    }
}