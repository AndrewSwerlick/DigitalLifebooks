using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DigitalLifeBooks.Models;

namespace DigitalLifeBooks
{
    public class BaseDLBPage : System.Web.UI.Page
    {
        protected DigitalLifeBooksEntities DataContext
        {
            get
            {
                HttpContext myContext = HttpContext.Current;
                return myContext.Items["DataContext"] as DigitalLifeBooksEntities;
            }
        }

        protected User CurrentUser
        {
            get
            {
#if DEBUG
//                return DataContext.Users.First();
#endif
                return DataContext.Users.Single(u => u.LoginName == HttpContext.Current.User.Identity.Name);
            }                
        }
    }
}