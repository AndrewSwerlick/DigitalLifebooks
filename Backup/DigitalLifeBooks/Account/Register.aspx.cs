using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using DigitalLifeBooks.Models;

namespace DigitalLifeBooks.Account
{
    public partial class Register : BaseDLBPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterUser.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];
        }

        protected void RegisterUser_CreatedUser(object sender, EventArgs e)
        {
            AddUserToDatabase();
            FormsAuthentication.SetAuthCookie(RegisterUser.UserName, false /* createPersistentCookie */);

            string continueUrl = RegisterUser.ContinueDestinationPageUrl;
            if (String.IsNullOrEmpty(continueUrl))
            {
                continueUrl = "~/";
            }
            Response.Redirect(continueUrl);
        }

        public void RegisterNewUser_CreatingUser(object sender, System.EventArgs e)
        {
            CreateUserWizard cuw = (CreateUserWizard)sender;
            cuw.Email = cuw.UserName;
        }


        private void AddUserToDatabase()
        {
            var userName = RegisterUser.UserName;
            var user = new User()
            {
                LoginName = userName,
                Email = userName
            };

            DataContext.Users.AddObject(user);
            DataContext.SaveChanges();
        }

    }
}
