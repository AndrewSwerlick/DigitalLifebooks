using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DigitalLifeBooks.Models;

namespace DigitalLifeBooks.Albums
{
    public partial class EditAsset : BaseDLBPage
    {
        Asset _asset { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var assetId = Request.QueryString["Id"];
            _asset = LoadAsset(long.Parse(assetId));
            AssetRender.Asset = _asset;
            AssetRender.DataBind();
        }

        private Asset LoadAsset(long assetId)
        {
            return DataContext.Assets.Single(a => a.ID == assetId);
        }

        public void On_Save_Click(object sender, EventArgs e)
        {
            _asset.Caption = Caption.Text;
            Response.Redirect("/Albums/Album.aspx?Id="+ _asset.Album.ID);
        }
    }
}