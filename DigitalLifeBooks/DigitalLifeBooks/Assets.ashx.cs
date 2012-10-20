using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DigitalLifeBooks.AssetManagement;
using DigitalLifeBooks.Models;
using System.IO;
using System.Text;

namespace DigitalLifeBooks
{
    /// <summary>
    /// Summary description for Assets
    /// </summary>
    public class Assets : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            var userName = context.User.Identity.Name;
            var user = new User();
            var assetId = context.Request.QueryString["Id"];
            var assetManager = new LocalDiskAssetManager(context);
            var asset = new Asset();
            if (!asset.UserHasAccessToAsset(user))            
                throw new UnauthorizedAccessException();
            
            asset.ID = new Guid("{c41afbc8-1ac2-4127-b7bc-a042e53a2576}");
            var stream = assetManager.GetAssetData(asset);
            context.Response.Clear();
            context.Response.ContentType = "image/jpg";
            context.Response.BinaryWrite(ReadFully(stream));
            stream.CopyTo(context.Response.OutputStream);
            context.Response.Flush();
            context.Response.End();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        private static byte[] ReadFully(Stream input)
        {
            byte[] buffer = new byte[16*1024];
            using (MemoryStream ms = new MemoryStream())
            {
                int read;
                while ((read = input.Read(buffer, 0, buffer.Length)) > 0)
                {
                    ms.Write(buffer, 0, read);
                }
                return ms.ToArray();
        }
}
    }
}