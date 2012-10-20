using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DigitalLifeBooks.Models;
using DigitalLifeBooks.Models;
using System.Text;

namespace DigitalLifeBooks.Admin.Create
{
    public partial class NewChild : BaseDLBPage
    {
        string _userId { get; set; }
        User _user { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            _userId = Request.QueryString["UserId"];
            if (!string.IsNullOrEmpty(_userId))
                _user = LoadUser(_userId);
        }
       
        public void On_Save_Click(object sender, EventArgs e)
        {
            var DOB = DateTime.Parse(DateOfBirth.Text);

            var child = new Child()
            {
                FirstName = FirstName.Text,
                LastName = LastName.Text,
                Last4OfSSN = Last4SSN.Text,
                DateOfBirth = DOB
            };

            if (_user != null)
                child.Users.Add(_user);

            //Wire up database to save child
            string redirectLocation = "ChildCreatedConfirmation.aspx?ChildId=" + child.Id;
            if (_user != null)
                redirectLocation = redirectLocation + "&UserId=" + _userId;

            var childId = Request.QueryString["ChildId"];
            var userId = Request.QueryString["UserId"];           

            var confirmationMessageBuilder = new StringBuilder().AppendFormat("A new child {0} was created", child.FirstName + child.LastName);

            if (_user != null)
                confirmationMessageBuilder.AppendFormat(" and associated with the user {0}", _user.LoginName);

            NewForm.Visible = false;
            ConfirmationDialog.Visible = true;
            ConfirmationMessage.Text = confirmationMessageBuilder.ToString();
        }

        private User LoadUser(string userId)
        {
            return new User() { LoginName = "test" };
        }
    }
}