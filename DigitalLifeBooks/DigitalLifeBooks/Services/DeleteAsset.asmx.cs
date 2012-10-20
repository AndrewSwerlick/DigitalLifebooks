using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace DigitalLifeBooks.Services
{
    /// <summary>
    /// Summary description for DeleteAsset
    /// </summary>
    [WebService(Namespace = "http://localhost:49243/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class DeleteAsset : System.Web.Services.WebService
    {

        [WebMethod]
        public string DeleteAsset(string UserID, string assetID)
        {   
            return "Hello World";
        }

        [WebMethod]
        public string DeleteUser(string UserID)
        {
            return "Hello World";
        }

        [WebMethod]
        public string RemoveChildFromUser(string UserID, string childID)
        {
            return "Hello World";
        }
    }
}
