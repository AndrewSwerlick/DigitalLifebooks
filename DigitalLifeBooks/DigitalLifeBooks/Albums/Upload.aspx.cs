using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DigitalLifeBooks.Models;
using System.IO;
using DigitalLifeBooks.AssetManagement;

namespace DigitalLifeBooks.Albums
{
    public partial class Upload : BaseDLBPage
    {
        Album album { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var user = CurrentUser;
            var albumId = long.Parse(Request.QueryString["AlbumId"]);
            album = LoadAlbum(albumId);
            if(!album.Child.UserIsAuthorizedForChild(user))
                throw new UnauthorizedAccessException();           
        }

        public void FileUpload_Click(object sender, EventArgs e)
        {
            if (fileUpload.HasFile)
            {
                var asset = CreateAsset(album, fileUpload.FileName);
                try
                {
                    var manager = new LocalDiskAssetManager(HttpContext.Current);
                    var fileBytes = fileUpload.FileBytes;
                    var dataStream = new MemoryStream(fileBytes);
                    manager.SaveAsset(asset, dataStream);
                }
                catch (Exception ex)
                {
                    DeleteAsset(asset);
                }
                Response.Redirect("EditAsset.aspx?Id=" + asset.ID);
            }                        
        }
        
        private Asset CreateAsset(Album album, string fileName)
        {
            var extension = fileName.Split('.')[1];
            var asset = new Asset()
            {
                Album = album,
                Type = extension
            };
            DataContext.Assets.AddObject(asset);
            DataContext.SaveChanges();
            return asset;            
        }
        private void DeleteAsset(Asset asset)
        {
            DataContext.Assets.DeleteObject(asset);
            return;
        }
        private Child LoadChild(Guid Id)
        {
            return new Child();
        }
        private Album LoadAlbum(long Id)
        {
            using (var context = new DigitalLifeBooksEntities())
            {
                return context.Albums.Single(a => a.ID == Id);
            }
        }

    }
}