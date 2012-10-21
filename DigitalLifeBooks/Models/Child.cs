using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DigitalLifeBooks.Models
{
    public partial class Child
    {
        public bool UserIsAuthorizedForChild(User user)
        {
            return true;
        }
    }
}