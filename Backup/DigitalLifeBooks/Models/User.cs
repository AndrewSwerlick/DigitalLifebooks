using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DigitalLifeBooks.Models
{
    public partial class User
    {
        public string DisplayName
        {
            get
            {
                if (!string.IsNullOrEmpty(FirstName) && !string.IsNullOrEmpty(LastName))
                    return FirstName + " " + LastName;
                else
                    return LoginName;
            }
        }
    }
}