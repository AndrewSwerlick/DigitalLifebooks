using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DigitalLifeBooks.Models
{
    public class Child
    {
        public IEnumerable<User> Users { get; set; }

        public bool UserIsAuthorizedForChild(User user)
        {
            return Users.Contains(user);
        }
    }
}