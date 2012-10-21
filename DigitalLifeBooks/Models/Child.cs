﻿using System;
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
                
                return "/Assets?Id=" + profilePic.ID;
            }
        }

        public string SearchString
        {
            get
            {
                return string.Format("{0} {1} {2}", FirstName, LastName, this.DateOfBirth.ToString("mdy") + Last4SSN);
            }
        }

        public Child()
        {
            Albums.Add(new Album()
            {
                Title = "Important Documents",
                IsImportanDocumentsAlbum = true
            });

            Albums.Add(new Album()
            {
                Title = "ProfilePicture",
                IsProfilePictureAlbum = true
            });
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