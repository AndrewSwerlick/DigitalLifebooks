using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using DigitalLifeBooks.Models;
using DigitalLifeBooks.Admin;

namespace DigitalLifeBooks.Controls
{
    public partial class UserChildren : System.Web.UI.UserControl
    {
        public User User {get;set;}
        public bool DoNotUseCurrentUser { get; set; }

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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!DoNotUseCurrentUser)
                User = CurrentUser;

            rtChildren.DataSource = CurrentUser.Children;
            rtChildren.DataBind();
        }

    }
}