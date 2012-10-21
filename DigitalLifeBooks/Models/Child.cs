using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DigitalLifeBooks.Models
{
    public partial class Child
    {
        public static readonly string DEFAULT_PROFILE_LINK = "http://placehold.it/30x30";

        public string ProfilePickLink
        {
            get
            {
                var profilePicAlbum = Albums.SingleOrDefault(a => a.IsProfilePictureAlbum);
                if (profilePicAlbum == null)
                    return DEFAULT_PROFILE_LINK;
                var profilePic = profilePicAlbum.Assets.FirstOrDefault();
                if (profilePic == null)
                    return DEFAULT_PROFILE_LINK;
                
                return "/Assets.ashx?Id=" + profilePic.ID;
            }
        }

        public long ProfileAlbumId
        {
            get
            {
                var profilePicAlbum = Albums.SingleOrDefault(a => a.IsProfilePictureAlbum);
                return profilePicAlbum.ID;
            }
        }

        public string Age
        {
            get
            {
                int now = int.Parse(DateTime.Today.ToString("yyyyMMdd"));
                int dob = int.Parse(DateOfBirth.ToString("yyyyMMdd"));
                string dif = (now - dob).ToString();
                string age = "0";
                if (dif.Length > 4)
                    age = dif.Substring(0, dif.Length - 4);
                return age;
            }
        }
        
        public bool UserIsAuthorizedForChild(User user)
        {
#if DEBUG
            return true;
#endif
            return Users.Contains(user);
        }
    }
}