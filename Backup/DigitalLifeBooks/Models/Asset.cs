using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DigitalLifeBooks.Models
{
    public partial class Asset
    {
        public bool UserHasAccessToAsset(User user)
        {
            return true;
        }
    }
}