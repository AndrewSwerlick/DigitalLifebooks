using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DigitalLifeBooks.Models
{
    public class Child
    {
        public Guid Id { get; set; }
        public IList<User> Users { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Last4OfSSN { get; set; }
        public DateTime DateOfBirth { get; set; }

        public Child()
        {
            Users = new List<User>();
        }

        public bool UserIsAuthorizedForChild(User user)
        {
            return Users.Contains(user);
        }
    }
}