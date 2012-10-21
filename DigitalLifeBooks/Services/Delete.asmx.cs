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
            AssetManager = new LocalDiskAssetManager(HttpContext.Current);
            var id = long.Parse(EnityID);

            if (EntityType == "User")
                DeleteUser(id);

            if (EntityType == "Asset")
                DeleteAsset(id);

            if (EntityType == "Album")
                DeleteAlbum(id);

            if (EntityType == "Child")
                DeleteChild(id);

            DataContext.SaveChanges();
            return "sucess";                        
        }

        private void DeleteAlbum(long id)
        {
            var album = DataContext.Albums.Single(a => a.ID == id);

            for (int j = 0; album.Assets.Count != 0;)
            {
                var asset = album.Assets.ElementAt(j);
                AssetManager.Delete(asset);
                DataContext.Assets.DeleteObject(asset);
            }
            DataContext.Albums.DeleteObject(album);        
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
            for (int i = 0; child.Albums.Count != 0; i++ )
            {
                var album = child.Albums.ElementAt(i);
                for (int j = 0; album.Assets.Count != 0; j++)
                {
                    var asset = album.Assets.ElementAt(j);
                    AssetManager.Delete(asset);
                    DataContext.Assets.DeleteObject(asset);
                }
                DataContext.Albums.DeleteObject(album);
            }
            for (int i = 0; child.Users.Count != 0; i++)
            {
                var user = child.Users.ElementAt(i);
                child.Users.Remove(user);
            }
            DataContext.Children.DeleteObject(child);
        }
    }
}
