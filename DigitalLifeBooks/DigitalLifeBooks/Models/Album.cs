using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DigitalLifeBooks.Models
{
    public class Album
    {
        public Child Child {get;set;}
        public string Name { get; set; }
        public IList<Asset> Assets {get;set;}

        public Album()
        {
            Assets = new List<Asset>();
        }
    }
}