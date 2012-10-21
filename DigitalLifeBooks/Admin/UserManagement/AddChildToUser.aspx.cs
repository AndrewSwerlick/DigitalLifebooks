using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DigitalLifeBooks.Models;

namespace DigitalLifeBooks.Admin.UserManagement
{
    public partial class AddChildToUser : AdminBasePage
    {
        string _userId { get; set; }
        User _user { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            _userId = Request.QueryString["UserId"];
            if (!string.IsNullOrEmpty(_userId))
                _user = LoadUser(_userId);
        }

        public void On_Next_Clicked(object sender, EventArgs e)
        {
            var creatingNewUser = NewOrExistingRadioChoices.SelectedValue == "New";

            if (creatingNewUser)
                Response.Redirect("/Admin/Create/NewChild.aspx?UserId=" + _userId);

            var existingUserSelected = ChildSearchResultChoices.SelectedItem != null;
            if (existingUserSelected)
            {
                //Loadchild from DB using value of selected Item
                var child = new Child() { FirstName = "Test3", LastName = "Test" };
                SaveUserAssociation(ChildSearchResultChoices.SelectedItem);
                UpdateConfirmationMessageWithInformationAboutUpdatedChild(child);
                return;
            }

            var children = LoadChildren(ChildSearchBox.Text);

            if (children.Count() == 1)
            {
                var child = children.SingleOrDefault();
                child.Users.Add(_user);
                UpdateConfirmationMessageWithInformationAboutUpdatedChild(child);
                return;
            }

            var childrenListItems = children.Select(c => new ListItem()
            {
                Text = c.FirstName + c.LastName,
                Value = c.Id.ToString()
            });

            ChildSearchResultChoices.Items.AddRange(childrenListItems.ToArray());
        }

        private void UpdateConfirmationMessageWithInformationAboutUpdatedChild(Child updatedChild)
        {
            ConfirmationDialog.Visible = true;
            ConfirmationMessage.Text = string.Format("User {0} was added as an authorized user for {1} {2}", _user.LoginName, updatedChild.FirstName, updatedChild.LastName);
            EditForm.Visible = false;

        }
        private void SaveUserAssociation(ListItem listItem)
        {
            Guid childId = new Guid(listItem.Value);
            //Load Child from DB
            //Add user to childs collection
        }
        private IEnumerable<Child> LoadChildren(string childSearchId)
        {
            return new List<Child>(){
                new Child(){
                    FirstName="Test1",
                    LastName ="Test"
                },
                new Child(){
                    FirstName= "Test2",
                    LastName= "Test"
                }
            };
        }
        private User LoadUser(string userId)
        {
            return new User() { LoginName = "test" };
        }
    }
}