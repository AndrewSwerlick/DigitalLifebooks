using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DigitalLifeBooks.Models;

namespace DigitalLifeBooks.Admin.UserManagement
{
    public partial class AddChildToUser : BaseDLBPage
    {
        string _userId { get; set; }
        public User ProfileUser { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            _userId = Request.QueryString["UserId"];
            if (!string.IsNullOrEmpty(_userId))
                ProfileUser = LoadUser(_userId);
        }

        public void On_Next_Clicked(object sender, EventArgs e)
        {
            var creatingNewUser = NewOrExistingRadioChoices.SelectedValue == "New";

            if (creatingNewUser)
                Response.Redirect("/Admin/Create/NewChild.aspx?UserId=" + _userId);

            var existingUserSelected = ChildSearchResultChoices.SelectedItem != null;
            if (existingUserSelected)
            {
                var id = long.Parse(ChildSearchResultChoices.SelectedValue);
                var child = DataContext.Children.Single(c => c.Id == id);
                SaveUserAssociation(ChildSearchResultChoices.SelectedItem);
                UpdateConfirmationMessageWithInformationAboutUpdatedChild(child);
                return;
            }

            var children = LoadChildren(ChildSearchBox.Text);

            var childrenListItems = children.Select(c => new ListItem()
            {
                Text = string.Format("{0} {1} {2} {3}", c.FirstName, c.LastName, c.DateOfBirth.ToShortDateString(), c.Last4SSN),
                Value = c.Id.ToString()
            });
            if (childrenListItems.Count() > 0)
            {
                ChildSearchResultChoices.Items.Clear();
                ChildSearchResultChoices.Items.AddRange(childrenListItems.ToArray());
            }
            else
                NoResultsFound.Visible = true;
        }

        private void UpdateConfirmationMessageWithInformationAboutUpdatedChild(Child updatedChild)
        {
            ConfirmationDialog.Visible = true;
            ConfirmationMessage.Text = string.Format("User {0} was added as an authorized user for {1} {2}", ProfileUser.LoginName, updatedChild.FirstName, updatedChild.LastName);
            EditForm.Visible = false;

        }
        private void SaveUserAssociation(ListItem listItem)
        {
            var id = long.Parse(listItem.Value);
            var child = DataContext.Children.Single(c => c.Id == id);
            child.Users.Add(ProfileUser);
        }
        private IEnumerable<Child> LoadChildren(string childSearchId)
        {
            return DataContext.Children.Where(c => String.Concat(c.FirstName, " ", c.LastName).Contains(childSearchId) || c.Last4SSN.Contains(childSearchId)).ToList().Except(ProfileUser.Children);
        }
        private User LoadUser(string userId)
        {
            return DataContext.Users.Single(u => u.LoginName == userId);
        }
    }
}