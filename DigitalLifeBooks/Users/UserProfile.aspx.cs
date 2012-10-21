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
    public partial class UserProfile : BaseDLBPage
    {
        string _userId { get; set; }
        public User User { get; set; }

        protected override void OnInit(EventArgs e)
        {
            _userId = Request.QueryString["UserId"];
            if (!string.IsNullOrEmpty(_userId) && HttpContext.Current.User.IsInRole("Admin"))
                User = LoadUser(_userId);
            else
                User = CurrentUser;
            if (!IsPostBack)
                LoadProfileInfo(User);

            UserChildren.DoNotUseCurrentUser = true;
            UserChildren.User = User;
            base.OnInit(e);
        }

        protected void Page_Load(object sender, EventArgs e)
        {            
           
        }

        public void On_Edit_Click(object sender, EventArgs e)
        {
            ProfileRead.Visible = false;
            ProfileEdit.Visible = true;
        }
        public void On_Save_Click(object sender, EventArgs e)
        {
            User.FirstName = txtFirstName.Text;
            User.LastName = txtLastName.Text;
            User.Email = txtEmail.Text;
            User.City = txtCity.Text;
            User.State = txtState.Text;
            User.PhoneNumber = txtPhone.Text;
            DataContext.SaveChanges();
            Response.Redirect(Request.RawUrl);
        }
        private void LoadProfileInfo(User user)
        {
            txtFirstName.Text = user.FirstName;
            txtLastName.Text = user.LastName;
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