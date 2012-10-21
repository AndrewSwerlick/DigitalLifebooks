using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalLifeBooks.Admin
{
    public partial class AdminChildSearch : BaseDLBPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void On_Search_Click(object sender, EventArgs e)
        {
            var childrenQuery = from c in CurrentUser.Children
                                where c.FirstName.Contains(txtSeachChildren.Text) || c.LastName.Contains(txtSeachChildren.Text)
                                select c;

            rtChildren.DataSource = childrenQuery;
            rtChildren.DataBind();
        }
    }
}