using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DigitalLifeBooks.AssetManagement;
using DigitalLifeBooks.Models;

namespace DigitalLifeBooks
{
    /// <summary>
    /// Summary description for Assets
    /// </summary>
    public class Assets : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            var assetId = context.Request.QueryString["Id"];
            var assetManager = new LocalDiskAssetManager(context);
            var asset = new Asset();
            asset.Id = new Guid("{c41afbc8-1ac2-4127-b7bc-a042e53a2576}");
            var stream = assetManager.GetAssetData(asset);
            context.Response.ContentType = "text/plain";
            stream.CopyTo(context.Response.OutputStream);
            context.Response.Flush();
            context.Response.Close();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}