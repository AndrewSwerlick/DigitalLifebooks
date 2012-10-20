﻿using System;
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
            var albumId = new Guid(Request.QueryString["AlbumId"]);
            album = LoadAlbum(albumId);
            if(!album.Child.UserIsAuthorizedForChild(user))
                throw new UnauthorizedAccessException();           
        }

        public void FileUpload_Click(object sender, EventArgs e)
        {
            if (fileUpload.HasFile)
            {
                var asset = CreateAsset(album);
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
            }                        
        }
        
        private Asset CreateAsset(Album album)
        {
            var asset = new Asset();
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
        private Album LoadAlbum(Guid Id)
        {
            return DataContext.Albums.Single(a => a.ID == Id);
        }

    }
}