using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalLifeBooks.Admin.UserManagement
{
    public partial class SearchForUser : BaseDLBPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var searchTerm = Request.QueryString["q"];
            if (string.IsNullOrEmpty(searchTerm))
                return;

            var users = DataContext.Users.Where(u => u.FirstName.Contains(searchTerm) || u.LastName.Contains(searchTerm) || u.LoginName.Contains(searchTerm));
            SearchResults.DataSource = users;
            SearchResults.DataBind();
        }

        public void On_Search_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.AbsolutePath + "?q=" + Search.Text);
        }
    }
}