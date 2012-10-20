using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using DigitalLifeBooks.Models;
using DigitalLifeBooks.AssetManagement;

namespace DigitalLifeBooks.Services
{
    /// <summary>
    /// Summary description for Delete
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Delete : System.Web.Services.WebService
    {
        DigitalLifeBooksEntities DataContext
        {
            get
            {
                HttpContext myContext = HttpContext.Current;
                return myContext.Items["DataContext"] as DigitalLifeBooksEntities;
            }
        }

        IAssetManager AssetManager { get; set; }

        [WebMethod]        
        public string DeleteEntity(string EntityType, string EnityID)
        {
            try
            {
                AssetManager = new LocalDiskAssetManager(HttpContext.Current);
                var id = long.Parse(EnityID);

                if (EntityType == "User")
                    DeleteUser(id);

                if (EntityType == "Asset")
                    DeleteAsset(id);

                if (EntityType == "Child")
                    DeleteChild(id);

                return "sucess";
            }
            catch
            {
                return "error";
            }
        }

        private void DeleteUser(long EnityID)
        {
            var user = DataContext.Users.Single(u => u.ID == EnityID);
            DataContext.Users.DeleteObject(user);
        }

        private void DeleteAsset(long EnityID)
        {
            var asset = DataContext.Assets.Single(a => a.ID == EnityID);
            AssetManager.Delete(asset);
            DataContext.Assets.DeleteObject(asset);
        }

        private void DeleteChild(long EnityID)
        {
            var child = DataContext.Children.Single(a => a.Id == EnityID);
            foreach (Album album in child.Albums)
            {
                foreach (Asset asset in album.Assets)
                {
                    AssetManager.Delete(asset);
                    DataContext.Assets.DeleteObject(asset);
                }
                DataContext.Albums.DeleteObject(album);
            }
            DataContext.Children.DeleteObject(child);
        }
    }
}
