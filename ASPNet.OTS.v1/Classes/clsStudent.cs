using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASPNet.OTS.v1.Classes
{
    public class clsStudent
    {
        public int OgrID { get; set; }
        public int OgrNo { get; set; }
        public string OgrAd { get; set; }
        public string OgrSoyad { get; set; }
        public int SinifID { get; set; }
        public string OgrDT { get; set; }
        public char OgrCinsiyet { get; set; }
    }
}