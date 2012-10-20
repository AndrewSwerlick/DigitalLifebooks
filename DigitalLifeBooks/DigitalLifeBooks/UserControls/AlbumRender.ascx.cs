using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DigitalLifeBooks.Models;

namespace DigitalLifeBooks.UserControls
{
    public partial class AlbumRender : System.Web.UI.UserControl
    {
        public Album Album { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        public override void DataBind()
        {
            Assets.DataSource = Album.Assets;
            Assets.DataBind();
            base.DataBind();
        }

        public void On_Assets_Databinding(object sender, RepeaterItemEventArgs e)
        {
            var assetRender = (AssetRender)e.Item.FindControl("AssetRender");
            assetRender.Asset = e.Item.DataItem as Asset;
        }
    }
}