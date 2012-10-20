using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DigitalLifeBooks.Models;

namespace DigitalLifeBooks.Child
{
    public partial class Profile : BaseDLBPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string profileId = Request.QueryString["Id"];

            

            //var child = DataContext.Children.FirstOrDefault<DigitalLifeBooks.Models.Child>(x => x.Id == Id);

            
        }
    }
}