using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DigitalLifeBooks
{
    public class BaseDLBPage : System.Web.UI.Page
    {
        protected DataContext DataContext
        {
            get
            {
                HttpContext myContext = HttpContext.Current;
                return myContext.Items["DataContext"];
            }
        }
    }
}