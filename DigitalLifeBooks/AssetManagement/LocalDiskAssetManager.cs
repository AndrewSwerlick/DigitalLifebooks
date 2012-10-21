using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DigitalLifeBooks.Models;
using System.IO;

namespace DigitalLifeBooks.AssetManagement
{
    public class LocalDiskAssetManager : IAssetManager
    {
        private static readonly string ASSET_FOLDER_PATH = "Assets";

        HttpContext _context;
        public LocalDiskAssetManager(HttpContext context)
        {
            _context = context;
        }

        public Stream GetAssetData(Asset asset)
        {
            var assetPath = BuildAssetPath(asset);
            var reader = new StreamReader(_context.Server.MapPath(assetPath));
            return reader.BaseStream;
        }
        public void SaveAsset(Asset asset, Stream assetData)
        {
            var assetPath = BuildAssetPath(asset);
            var fileStream = new FileStream(_context.Server.MapPath(assetPath), FileMode.OpenOrCreate);
            assetData.CopyTo(fileStream);
        }
        public void Delete(Asset asset)
        {
            var assetPath = BuildAssetPath(asset);
            File.Delete(_context.Server.MapPath(assetPath));            
        }

        private string BuildAssetPath(Asset asset)
        {
            return string.Format("/{0}/{1}", ASSET_FOLDER_PATH, asset.ID);
        }

        private void CreatePath(string assetPath)
        {

        }
    }
}