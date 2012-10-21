using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using DigitalLifeBooks.Models;
using DigitalLifeBooks.Admin;

namespace DigitalLifeBooks.Users
{
    //public partial class UserProfile : AdminBasePage
    //{
    //    string _userId { get; set; }
    //    User _user { get; set; }

    //    protected void Page_Load(object sender, EventArgs e)
    //    {
    //        _userId = Request.QueryString["UserId"];
    //        if (!string.IsNullOrEmpty(_userId))
    //            LoadProfileInfo(LoadUser(_userId));

    //    }

    //    private void LoadProfileInfo(User user)
    //    {
    //        txtUserName.Text = user.LoginName;
    //        txtFirstName.Text = user.FirstName;
    //        txtLastName.Text = user.LastName;
    //        txtusertype.Text = user.UserType;
    //        txtEmail.Text = user.Email;
    //        txtPhone.Text = user.PhoneNumber;
    //        txtCity.Text = user.City;
    //        txtState.Text = user.State;
    //    }

    //    private User LoadUser(string userId)
    //    {
    //        return DataContext.Users.Single(a => a.LoginName == userId);
    //    }
    //}

    public partial class UserProfile : BaseDLBPage
    {
        string _userId { get; set; }
        public User User { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

            
            _userId = Request.QueryString["UserId"];
            if (!string.IsNullOrEmpty(_userId) && HttpContext.Current.User.IsInRole("Admin"))
                User = LoadUser(_userId);
            else
                User = CurrentUser;

                LoadProfileInfo(User);
        }

        private void LoadProfileInfo(User user)
        {
            txtUserName.Text = user.LoginName;
            txtFirstName.Text = user.FirstName;
            txtLastName.Text = user.LastName;
            txtusertype.Text = user.UserType;
            txtEmail.Text = user.Email;
            txtPhone.Text = user.PhoneNumber;
            txtCity.Text = user.City;
            txtState.Text = user.State;
        }

         private User LoadUser(string userId)
        {
            return DataContext.Users.Single(a => a.LoginName == userId);
        }
    }
}