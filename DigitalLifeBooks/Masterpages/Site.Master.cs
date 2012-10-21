using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DigitalLifeBooks.ChildProfile;
using System.Web.Security;

namespace DigitalLifeBooks
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void SignOff_Click(object sender, EventArgs e)
        {
            Profile profile = Session["Profile"] as Profile;

            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Redirect("/Account/Login.aspx");
        }
    }
}
