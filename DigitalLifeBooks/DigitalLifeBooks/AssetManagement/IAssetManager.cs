using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using DigitalLifeBooks.Models;

namespace DigitalLifeBooks.AssetManagement
{
    public interface IAssetManager
    {
        Stream GetAssetData(Asset asset);
        void SaveAsset(Asset asset, Stream assetData);
        void Delete(Asset asset);
    }
}
