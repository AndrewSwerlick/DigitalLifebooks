using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalLifeBooks.ServerControls
{
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:SecurityTrimmedPanel runat=server></{0}:SecurityTrimmedPanel>")]
    public class SecurityTrimmedPanel : Panel
    {
        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        [Localizable(true)]
        public string RoleToShowFor
        {
            get
            {
                String s = (String)ViewState["RoleToShowFor"];
                return ((s == null) ? String.Empty : s);
            }

            set
            {
                ViewState["RoleToShowFor"] = value;
            }
        }

        protected override void OnInit(EventArgs e)
        {
            var userInRole = Context.User.IsInRole(RoleToShowFor);
            this.Visible = userInRole;
            base.OnInit(e);
        }        
    }
}
