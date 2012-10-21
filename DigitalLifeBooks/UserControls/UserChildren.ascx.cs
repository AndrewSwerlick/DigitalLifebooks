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
    //public partial class UserChildren : BaseDLBPage
    //{
    //    string _userId { get; set; }
    //    User _user { get; set; }

    //    protected void Page_Load(object sender, EventArgs e)
    //    {
    //        LoadProfileInfo(CurrentUser);
    //    }

    //    private void LoadProfileInfo(User user)
    //    {
    //        rtChildren.DataSource = user.Children;
    //        rtChildren.DataBind();
    //    }
    //}

    public partial class UserChildren : System.Web.UI.UserControl
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
                //return DataContext.Users.Single(u => u.LoginName == HttpContext.Current.User.Identity.Name);
                return DataContext.Users.First();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            rtChildren.DataSource = CurrentUser.Children;
            rtChildren.DataBind();
        }

    }
}