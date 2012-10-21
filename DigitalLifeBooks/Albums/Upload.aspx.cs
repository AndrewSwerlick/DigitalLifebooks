using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DigitalLifeBooks.Models;
using System.IO;
using DigitalLifeBooks.AssetManagement;
using System.Threading;

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

            if (album != null && album.IsProfilePictureAlbum)
            {
                //if the profile pic album, delete all images before saving to 
                int i = album.Assets.Count - 1;
                while (album.Assets.Count > 0)
                {
                    DataContext.Assets.DeleteObject(album.Assets.ElementAt(i));
                    i--;
                }

                DataContext.SaveChanges();
            }

            var asset = new Asset()
            {
                Album = album,
                Type = extension.ToLower()
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
        private Album LoadAlbum(long Id)
        {           
            return DataContext.Albums.Single(a => a.ID == Id);            
        }

    }
}