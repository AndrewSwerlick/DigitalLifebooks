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

        protected DigitalLifeBooksEntities DataContext
        {
            get
            {
                HttpContext myContext = HttpContext.Current;
                return myContext.Items["DataContext"] as DigitalLifeBooksEntities;
            }
        }

        protected User CurrentUser
        {
            get
            {
#if DEBUG
                return DataContext.Users.First();
#endif
                return DataContext.Users.Single(u => u.LoginName == HttpContext.Current.User.Identity.Name);
            }
        }

        public void ProcessRequest(HttpContext context)
        {
            var user = CurrentUser;
            var assetId = context.Request.QueryString["Id"];
            var assetManager = new LocalDiskAssetManager(context);
            var asset = LoadAsset(long.Parse(assetId));
            if (!asset.UserHasAccessToAsset(user))
                throw new UnauthorizedAccessException();
            
            var stream = assetManager.GetAssetData(asset);
            context.Response.Clear();
            context.Response.ContentType = "image/jpg";
            context.Response.BinaryWrite(ReadFully(stream));
            stream.CopyTo(context.Response.OutputStream);
            stream.Dispose();
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

        private Asset LoadAsset(long id)
        {
            return DataContext.Assets.Single(a => a.ID == id);
        }
    }
}