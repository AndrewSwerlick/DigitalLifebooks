using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using DigitalLifeBooks.Models;

namespace DigitalLifeBooks.Albums
{
    public partial class AlbumViewer : BaseDLBPage
    {
        string _albumId { get; set; }
        Album _album { get; set; }
        Child _child { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (tryGetAlbumInfo()) FillInThePage();
            else
            {
                Head1.Title = "Album Not Found";
                BodyMatter.Text = "<p>Requested Album not found. (Sorry!)</p>";
            }
        }

        private void FillInThePage()
        {
            string album_title = _album.Title;
            album_title = string.IsNullOrWhiteSpace(album_title) ? "[Untitled]" : album_title;
            Head1.Title = "View Album " + album_title;
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("<h1>{0}</h1>", album_title);
            sb.AppendFormat("<h2>an album belonging to {0}", NameOf(_child));
            BodyMatter.Text = sb.ToString();
        }

        private bool tryGetAlbumInfo()
        {
            _albumId = Request.QueryString["AlbumId"];
            if (string.IsNullOrWhiteSpace(_albumId)) return false;

            _album = GetAlbumByID(DataContext, _albumId);
            if (_album == null) return false;

            _child = _album.Child;

            return true;
        }

        private string NameOf(Child child)
        {
            return String.Format("{0} {1}", child.FirstName, child.LastName);
        }

        private static Album GetAlbumByID(DigitalLifeBooksEntities data_context, string albumID)
        {
            long albumID_numeric;
            if (!long.TryParse(albumID, out albumID_numeric)) return null;
            try
            {
                return data_context.Albums.SingleOrDefault(a => a.ID == albumID_numeric);
            }
            catch (Exception /*ex*/)
            {
                // log the exception
            }
            return null;

            /*
            return new Album() {
                Child = new Child() { FirstName = "Joe", LastName = "Doe" },
                Title = "Joe's Xmas with the Fosters",
                ID = albumID_numeric
            };
            */
        }
    }
}