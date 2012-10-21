using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DigitalLifeBooks.Models;
using DigitalLifeBooks.Models;
using System.Text;
using DigitalLifeBooks.Models;

namespace DigitalLifeBooks.Admin.Create
{
    public partial class NewChild : AdminBasePage
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
            var child = new Child()
            {
                FirstName = txtFirstName.Text,
                LastName = txtLastName.Text,
                DateOfBirth = DateTime.Parse(txtDateOfBirth.Text),
                City = txtCity.Text,
                State = txtState.Text,
                Country = txtCountry.Text,
                BirthWeight = txtBirthWeight.Text,
                BirthLength = txtBirthWeight.Text,
                Last4SSN = txtLast4SSN.Text,
            };

            if (_user != null)
            {
                //Wire up database to save child

                Child childuser = new Child();
                childuser.FirstName = child.FirstName;
                childuser.LastName = child.LastName;
                childuser.DateOfBirth = child.DateOfBirth;
                childuser.City = child.City;
                childuser.State = child.State;
                childuser.Country = child.Country;
                childuser.BirthWeight = child.BirthWeight;
                childuser.BirthLength = child.BirthLength;
                childuser.Last4SSN = child.Last4SSN;
                childuser.Users.Add(_user);
                DataContext.AddToChildren(childuser);
                DataContext.SaveChanges();
            }

            string redirectLocation = "ChildCreatedConfirmation.aspx?ChildId=" + child.Id;
            if (_user != null)
                redirectLocation = redirectLocation + "&UserId=" + _userId;

            var childId = Request.QueryString["ChildId"];
            var userId = Request.QueryString["UserId"];           

            var confirmationMessageBuilder = new StringBuilder().AppendFormat("A new child {0} was created", child.FirstName + " " + child.LastName);

            if (_user != null)
                confirmationMessageBuilder.AppendFormat(" and associated with the user {0}", _user.LoginName);

            NewForm.Visible = false;
            ConfirmationDialog.Visible = true;
            ConfirmationMessage.Text = confirmationMessageBuilder.ToString();
        }

        private User LoadUser(string userId)
        {
            return DataContext.Users.Single(a => a.LoginName == userId); 
        }
    }
}