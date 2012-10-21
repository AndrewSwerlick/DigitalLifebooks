using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DigitalLifeBooks.Models;

namespace DigitalLifeBooks.UserControls
{
    public partial class AssetRender : System.Web.UI.UserControl
    {
        private IDictionary<string, Panel> typeToPanelMap;

        public Asset Asset { get; set; }

        protected override void OnInit(EventArgs e)
        {
            typeToPanelMap = new Dictionary<string, Panel>{
                {"jpg", ImageRender}
            };
            base.OnInit(e);
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public override void DataBind()
        {
            if (typeToPanelMap.ContainsKey(Asset.Type))
                typeToPanelMap[Asset.Type].Visible = true;
            else
                DefaultRender.Visible = true;

            base.DataBind();
        }
    }
}