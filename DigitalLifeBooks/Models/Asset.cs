using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DigitalLifeBooks.Models
{
    public partial class Asset
    {

        private IDictionary<string, string> mimeTypeDictionary = new Dictionary<string, string>(){
             {"jpg", @"image\jpg"},
                {"jpeg", @"image\jpg"},
                {"gif", @"image\gif"},
                {"png", @"image\png"},
                {"bmp", @"image\bmp"},
                {"tiff", @"image\tiff"},
                {"xlsx", @"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"},
                {"doc", @"application/msword"},
                {"docx",@"application/vnd.openxmlformats-officedocument.wordprocessingml.document"},
                {"xls",@"application/vnd.ms-excel"},
                {"pdf", @"application/pdf"}
        };
        public bool UserHasAccessToAsset(User user)
        {
            return true;
        }

        public string MimeType()
        {
            return mimeTypeDictionary[Type];
        }
    }
}