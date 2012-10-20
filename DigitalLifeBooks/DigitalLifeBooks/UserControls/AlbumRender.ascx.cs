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
        public int? PageNumber { get; set; }
        public int? ItemsPerPage { get; set; }

        protected override void OnInit(EventArgs e)
        {
            if (!PageNumber.HasValue)
                PageNumber = 1;
            if (!ItemsPerPage.HasValue)
                ItemsPerPage = 10;
            base.OnInit(e);
        }

        public override void DataBind()
        {
            var numberOfItemsToSkip = PageNumber.Value * ItemsPerPage.Value;
            var thereAreEnoughItems = Album.Assets.Count >= numberOfItemsToSkip;

            if(!thereAreEnoughItems){
                var numberOfPages = Album.Assets.Count / ItemsPerPage.Value;
                numberOfItemsToSkip = (numberOfPages - 1) * ItemsPerPage.Value;
            }



            var assetsForThisPage = Album.Assets.Skip(numberOfItemsToSkip).Take(ItemsPerPage.Value);
            Assets.DataSource = Album.Assets;
            Assets.DataBind();
            base.DataBind();
        }

        public void On_AssetsRender_Created(object sender, RepeaterItemEventArgs e)
        {
            var assetRender = (AssetRender)e.Item.FindControl("AssetRender");
            assetRender.Asset = e.Item.DataItem as Asset;
        }
    }
}