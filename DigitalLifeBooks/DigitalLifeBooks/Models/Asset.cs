using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DigitalLifeBooks.Models
{
    public class Asset
    {
        public Guid Id { get; set; }
        public Child Child { get; set;}


        public bool UserHasAccessToAsset(User user)
        {
            return Child.UserIsAuthorizedForChild(user);
        }
    }
}